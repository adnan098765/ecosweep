import 'package:service_app/Models/product.dart';

class SearchModel {
  List<Categories>? categories;
  List<Subcategories>? subcategories;
  List<Products>? products;

  SearchModel({this.categories, this.subcategories, this.products});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['subcategories'] != null) {
      subcategories = <Subcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(Subcategories.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.id,
      this.name,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    showOnHome = json['show_on_home'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['show_on_home'] = showOnHome;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Subcategories {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;

  Subcategories(
      {this.id,
      this.categoryId,
      this.name,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt});

  Subcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    showOnHome = json['show_on_home'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['image'] = image;
    data['show_on_home'] = showOnHome;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

