class ViewCartModel {
  int? status;
  List<ViewCartItems>? cartItems;
  int? totalPrice;

  ViewCartModel({this.status, this.cartItems, this.totalPrice});

  ViewCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['cart_items'] != null) {
      cartItems = <ViewCartItems>[];
      json['cart_items'].forEach((v) {
        cartItems!.add(ViewCartItems.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cartItems != null) {
      data['cart_items'] = cartItems!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    return data;
  }
}

class ViewCartItems {
  int? productId;
  String? productName;
  int? quantity;
  String? image;
  var pricePerUnit;
  int? totalPrice;

  ViewCartItems({
    this.productId,
    this.productName,
    this.quantity,
    this.pricePerUnit,
    this.totalPrice,
    this.image,
  });

  ViewCartItems.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    quantity = json['quantity'];
    pricePerUnit = json['price_per_unit'];
    totalPrice = json['total_price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['quantity'] = quantity;
    data['price_per_unit'] = pricePerUnit;
    data['total_price'] = totalPrice;
    data['image'] = image;
    return data;
  }
}
