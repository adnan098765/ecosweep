class ProductModel {
  int? status;
  Category? category;
  Category? subCategory;

  ProductModel({this.status, this.category, this.subCategory});

  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    subCategory = json['sub_category'] != null
        ? Category.fromJson(json['sub_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (subCategory != null) {
      data['sub_category'] = subCategory!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  List<Products>? products;

  Category({this.id, this.name, this.products});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? id;
  int? categoryId;
  int? subCategoryId;
  String? name;
  String? description;
  String? amount;
  String? detail;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;

  Products(
      {this.id,
      this.categoryId,
      this.subCategoryId,
      this.name,
      this.description,
      this.amount,
      this.detail,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    subCategoryId = json['sub_category_id'];
    name = json['name'];
    description = json['description'];
    amount = json['amount'];
    detail = json['detail'];
    image = json['image'];
    showOnHome = json['show_on_home'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['sub_category_id'] = subCategoryId;
    data['name'] = name;
    data['description'] = description;
    data['amount'] = amount;
    data['detail'] = detail;
    data['image'] = image;
    data['show_on_home'] = showOnHome;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
