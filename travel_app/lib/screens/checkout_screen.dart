// cart_page.dart
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/cart_provider.dart';

class CheckoutScreen extends StatelessWidget {
  // final List<CartItem> cartItems;
  // CartPage({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(locale: 'id', symbol: 'Rp');

    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        final cartItems = cartProvider.items;

        return Scaffold(
          appBar: AppBar(
            title: Text('Your Cart'),
            backgroundColor: Colors.teal,
          ),
          body: cartItems.isEmpty
              ? Center(child: Text("Cart is empty"))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems.length,
                        itemBuilder: (context, index) {
                          final item = cartItems[index];
                          return Card(
                            margin: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            child: ListTile(
                              title: Text(item.packageName),
                              subtitle: Text(
                                'Date: ${DateFormat('dd MMM yyyy').format(item.date)}\n'
                                'Price: ${currencyFormat.format(item.price)} x ${item.quantity}',
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.delete, color: Colors.red),
                                onPressed: () {
                                  cartProvider.removeItem(item);
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            currencyFormat.format(cartProvider.totalPrice),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (cartItems.isNotEmpty) {
                            cartProvider.clearCart();

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Checkout berhasil!"),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );

                            Navigator.of(context).pop();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Cart masih kosong!"),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          }
                        },
                        child: Text("Checkout"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal,
                          minimumSize: Size(double.infinity, 50),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
