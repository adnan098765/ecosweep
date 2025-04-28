class CartData {
  int userId;
  dynamic products;

  CartData({required this.userId, required this.products});

  Map<String, dynamic> toJson() {
    return {
      'user_id': "$userId",
      'products': products,
    };
  }
}
