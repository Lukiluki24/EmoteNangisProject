// home_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/cart_item.dart';
import 'checkout_screen.dart';
import '../provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // final List<CartItem> _cart = [];

  final List<CartItem> _packages = [
    CartItem(
      packageName: 'Raja Ampat HuHu',
      price: 3500000,
      quantity: 1,
      date: DateTime.now().add(Duration(days: 3)),
    ),
    CartItem(
      packageName: 'Discover Yogyakarta',
      price: 2200000,
      quantity: 1,
      date: DateTime.now().add(Duration(days: 5)),
    ),
    CartItem(
      packageName: 'Bali HiHi',
      price: 2700000,
      quantity: 1,
      date: DateTime.now().add(Duration(days: 10)),
    ),
  ];

  void _addToCart(CartItem item) {
    Provider.of<CartProvider>(context, listen: false).addItem(item);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("${item.packageName} ditambahkan ke keranjang.")),
    );
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp');

    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Huhu'),
        backgroundColor: Colors.teal,
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CheckoutScreen()),
                  );
                },
              ),
              if (cartProvider.itemCount > 0)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    constraints: BoxConstraints(minWidth: 16, minHeight: 16),
                    child: Text(
                      '${cartProvider.itemCount}',
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _packages.length,
        itemBuilder: (context, index) {
          final item = _packages[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 4,
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              title: Text(
                item.packageName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Harga: ${currencyFormat.format(item.price)}\nTanggal: ${DateFormat('dd MMM yyyy').format(item.date)}',
              ),
              trailing: ElevatedButton(
                onPressed: () => _addToCart(item),
                child: Text('Add'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
