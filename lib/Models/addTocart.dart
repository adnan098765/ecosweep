
class AddToCartModel {
  int? status;
  String? message;
  List<CartItems>? cartItems;

  AddToCartModel({this.status, this.message, this.cartItems});

  AddToCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['cart_items'] != null) {
      cartItems = <CartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(CartItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartItems {
  int? id;
  int? userId;
  int? productId;
  int? quantity;
  var totalPrice;
  String? createdAt;
  String? updatedAt;

  CartItems(
      {this.id,
      this.userId,
      this.productId,
      this.quantity,
      this.totalPrice,
      this.createdAt,
      this.updatedAt});

  CartItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['product_id'] = productId;
    data['quantity'] = quantity;
    data['total_price'] = totalPrice;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}