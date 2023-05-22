import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mobile_app/colors.dart';
import 'package:mobile_app/configure.dart';
import 'package:mobile_app/pages/welcome_page.dart';

class Medicine {
  final int id;
  final String name;
  final double price;

  Medicine({
    required this.id,
    required this.name,
    required this.price,
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      id: json['id'],
      name: json['name'],
      price: double.parse(json['price']),
    );
  }
}

class MedicineListPage extends StatefulWidget {
  @override
  _MedicineListPageState createState() => _MedicineListPageState();
}

class _MedicineListPageState extends State<MedicineListPage> {
  List<Medicine> _medicines = [];
  List<Medicine> _filteredMedicines = [];
  List<Medicine> _cart = []; // Added _cart variable

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchMedicines();
  }

  Future<void> fetchMedicines() async {
    final response =
        await http.get(Uri.parse('${AppUrl.Base_Url}/medications/list'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      setState(() {
        _medicines = data.map((json) => Medicine.fromJson(json)).toList();
        _filteredMedicines = List.from(_medicines);
      });
    } else {
      // Handle error case
      print('Failed to fetch medicines');
    }
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
                  builder: (context) => CheckoutPage(cart: _cart),
                ),
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
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
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
                cursorColor: primary,
                decoration: InputDecoration(
                  hintText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                   focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: primary), // Set the desired border color when focused
                    ),
                  suffixIcon: IconButton(
                    onPressed: () {
                      _searchController.clear();
                      setState(() {
                        _filteredMedicines = List.from(_medicines);
                      });
                    },
                    icon: Icon(Icons.clear,color: primary,),
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
                      title: Text(_filteredMedicines[index].name),
                      subtitle: Text(
                          'Price: ${_filteredMedicines[index].price.toString()} LE'),
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

// The CheckoutPage class remains the same

class CheckoutPage extends StatelessWidget {
  final List<Medicine> cart;

  CheckoutPage({required this.cart});

  @override
  Widget build(BuildContext context) {
    double total = 0;
    for (var medicine in cart) {
      total += medicine.price;
    }

    void orderNow() {
      for (var medicine in cart) {
        print(
            'Medicine: ${medicine.name}, Price: \$${medicine.price.toStringAsFixed(2)}');
      }
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: primary,
        title: Text('Checkout'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cart[index].name),
                  subtitle: Text('\$${cart[index].price.toStringAsFixed(2)}'),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                          content:
                              Text('Are you sure you want to clear the cart?'),
                          actions: [
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: primary),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: primary),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.of(context).pushNamedAndRemoveUntil(
                                  'home',
                                  (Route<dynamic> route) => false,
                                );
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                  ),
                  onPressed: orderNow,
                  child: Text('Order Now'),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Text(
              'Total Price: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
