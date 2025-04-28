class UpdateCartModel {
  String? _message;
  Cart? _cart;
  int? _totalPrice;

  UpdateCartModel({String? message, Cart? cart, int? totalPrice}) {
    if (message != null) {
      _message = message;
    }
    if (cart != null) {
      _cart = cart;
    }
    if (totalPrice != null) {
      _totalPrice = totalPrice;
    }
  }

  String? get message => _message;
  set message(String? message) => _message = message;
  Cart? get cart => _cart;
  set cart(Cart? cart) => _cart = cart;
  int? get totalPrice => _totalPrice;
  set totalPrice(int? totalPrice) => _totalPrice = totalPrice;

  UpdateCartModel.fromJson(Map<String, dynamic> json) {
    _message = json['message'];
    _cart = json['cart'] != null ? Cart.fromJson(json['cart']) : null;
    _totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['message'] = _message;
    if (_cart != null) {
      data['cart'] = _cart!.toJson();
    }
    data['total_price'] = _totalPrice;
    return data;
  }
}

class Cart {
  int? _id;
  int? _userId;
  int? _productId;
  String? _quantity;
  var _totalPrice;
  String? _createdAt;
  String? _updatedAt;

  Cart(
      {int? id,
      int? userId,
      int? productId,
      String? quantity,
      var totalPrice,
      String? createdAt,
      String? updatedAt}) {
    if (id != null) {
      _id = id;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (productId != null) {
      _productId = productId;
    }
    if (quantity != null) {
      _quantity = quantity;
    }
    if (totalPrice != null) {
      _totalPrice = totalPrice;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  int? get userId => _userId;
  set userId(int? userId) => _userId = userId;
  int? get productId => _productId;
  set productId(int? productId) => _productId = productId;
  String? get quantity => _quantity;
  set quantity(String? quantity) => _quantity = quantity;
  dynamic get totalPrice => _totalPrice;
  set totalPrice( totalPrice) => _totalPrice = totalPrice;
  String? get createdAt => _createdAt;
  set createdAt(String? createdAt) => _createdAt = createdAt;
  String? get updatedAt => _updatedAt;
  set updatedAt(String? updatedAt) => _updatedAt = updatedAt;

  Cart.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _userId = json['user_id'];
    _productId = json['product_id'];
    _quantity = json['quantity'];
    _totalPrice = json['total_price'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['user_id'] = _userId;
    data['product_id'] = _productId;
    data['quantity'] = _quantity;
    data['total_price'] = _totalPrice;
    data['created_at'] = _createdAt;
    data['updated_at'] = _updatedAt;
    return data;
  }
}