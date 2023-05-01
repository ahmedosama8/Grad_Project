import 'package:flutter/material.dart';
import 'package:mobile_app/colors.dart';
import 'package:mobile_app/pages/welcome_page.dart';

class Medicine {
  String name;
  String description;
  String image;

  Medicine(
      {required this.name, required this.description, required this.image});
}

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  final List<Medicine> _medicines = [
    Medicine(
        name: 'Aspirin',
        description: 'Pain Reliever',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Ibuprofen',
        description: 'Pain Reliever/Fever Reducer',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Panadol',
        description: 'Pain Reliever/Fever Reducer',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Antinal',
        description: 'treatment of diarrhea & gastroenteritis.',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Medicine 5',
        description: 'Allergy Relief',
        image: 'https://via.placeholder.com/150'),
  ];

  List<Medicine> _cart = [];
  List<Medicine> _filteredMedicines = [];
  
  TextEditingController _searchController = TextEditingController();
    @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all medicines
    _filteredMedicines = List.from(_medicines);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Medicines'),
        backgroundColor: primary,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CheckoutPage(cart: _cart)),
              );
            },
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      '${_cart.length}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Padding(
              padding: const EdgeInsets.only(top:10.0,bottom: 10),
              child: TextField(
                controller: _searchController,
                onChanged: (text) {
                  // Filter the list based on the text entered in the search bar
                  setState(() {
                    _filteredMedicines = _medicines
                        .where((medicine) => medicine.name
                            .toLowerCase()
                            .contains(text.toLowerCase()))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _filteredMedicines = List.from(_medicines);
                      });
                    },
                    icon: Icon(Icons.clear),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredMedicines.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                  child: Card(
                        shape: RoundedRectangleBorder(
                        side: BorderSide(
                          color: Colors.greenAccent,
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 0,
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(_filteredMedicines[index].image),
                      ),
                      title: Text(_filteredMedicines[index].name),
                      subtitle: Text(_filteredMedicines[index].description),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            _cart.add(_filteredMedicines[index]);
                          });
                        },
                        icon: Icon(Icons.add_shopping_cart),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CheckoutPage extends StatelessWidget {
  final List<Medicine> cart;

  CheckoutPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Center(child: Text('Checkout')),
        backgroundColor: primary,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(cart[index].image),
                  ),
                  title: Text(cart[index].name),
                  subtitle: Text(cart[index].description),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Clear Cart?'),
                      content: Text('Are you sure you want to clear the cart?'),
                      actions: [
                        TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: primary
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                            style: TextButton.styleFrom(
                            foregroundColor: primary
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                             Navigator.push(
                            context,
                           MaterialPageRoute(
                          builder: (context) => WillPopScope(
                            onWillPop: () async {
                            // disable back button by returning false
                            return false;       },
                            child: WelcomePage())),);
                          },
                          child: Text('Clear'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text('Clear Cart'),
            ),
          ),
        ],
      ),
    );
  }
}
