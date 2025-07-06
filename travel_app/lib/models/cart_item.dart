class CartItem {
  final String packageName;
  final int price;
  final int quantity;
  final DateTime date;

  CartItem({
    required this.packageName,
    required this.price,
    required this.quantity,
    required this.date,
  });

  int get totalPrice => price * quantity;
}
