import 'package:flutter/material.dart';

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
        name: 'Medicine 1',
        description: 'Description for Medicine 1',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Medicine 2',
        description: 'Description for Medicine 2',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Medicine 3',
        description: 'Description for Medicine 3',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Medicine 4',
        description: 'Description for Medicine 4',
        image: 'https://via.placeholder.com/150'),
    Medicine(
        name: 'Medicine 5',
        description: 'Description for Medicine 5',
        image: 'https://via.placeholder.com/150'),
  ];

  List<Medicine> _cart = [];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicines'),
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
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    _searchController.clear();
                  },
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _medicines.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(_medicines[index].image),
                  ),
                  title: Text(_medicines[index].name),
                  subtitle: Text(_medicines[index].description),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _cart.add(_medicines[index]);
                      });
                    },
                    icon: Icon(Icons.add_shopping_cart),
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
        title: Text('Checkout'),
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
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Clear Cart?'),
                    content: Text('Are you sure you want to clear the cart?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context, true);
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
        ],
      ),
    );
  }
}
