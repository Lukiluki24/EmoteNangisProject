// lib/providers/cart_provider.dart
import 'package:flutter/foundation.dart';
import '../models/cart_item.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => [..._items];

  int get itemCount => _items.length;

  int get totalPrice {
    return _items.fold(0, (sum, item) => sum + item.totalPrice);
  }

  void addItem(CartItem item) {
    bool found = false;
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].packageName == item.packageName &&
          _items[i].date.isAtSameMomentAs(item.date)) {
        _items[i] = CartItem(
          packageName: _items[i].packageName,
          price: _items[i].price,
          quantity: _items[i].quantity + item.quantity,
          date: _items[i].date,
        );
        found = true;
        break;
      }
    }
    if (!found) {
      _items.add(item);
    }
    notifyListeners();
  }

  void removeItem(CartItem item) {
    _items.removeWhere((cartItem) =>
        cartItem.packageName == item.packageName &&
        cartItem.date.isAtSameMomentAs(item.date));
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
