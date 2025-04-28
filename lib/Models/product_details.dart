class ProductDetailsModel {
  final int? status;
  final ProductData? Data;

  ProductDetailsModel({
     this.status,
     this.Data,
  });

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailsModel(
      status: json['status'],
      Data: ProductData.fromJson(json['Data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'Data': Data!.toJson(),
    };
  }
}

class ProductData {
  final int id;
  final int category_id;
  final int sub_category_id;
  final String name;
  final String description;
  final String amount;
  final String detail;
  final String image;
  final String show_on_home;
  final DateTime created_at;
  final DateTime updated_at;

  ProductData({
    required this.id,
    required this.category_id,
    required this.sub_category_id,
    required this.name,
    required this.description,
    required this.amount,
    required this.detail,
    required this.image,
    required this.show_on_home,
    required this.created_at,
    required this.updated_at,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      category_id: json['category_id'],
      sub_category_id: json['sub_category_id'],
      name: json['name'],
      description: json['description'],
      amount: json['amount'],
      detail: json['detail'],
      image: json['image'],
      show_on_home: json['show_on_home'],
      created_at: DateTime.parse(json['created_at']),
      updated_at: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': category_id,
      'sub_category_id': sub_category_id,
      'name': name,
      'description': description,
      'amount': amount,
      'detail': detail,
      'image': image,
      'show_on_home': show_on_home,
      'created_at': created_at.toIso8601String(),
      'updated_at': updated_at.toIso8601String(),
    };
  }
}
