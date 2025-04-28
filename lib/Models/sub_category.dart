import 'package:service_app/Models/category.dart';

class SubcategoryModel {
  int? status;
  List<Data>? data;

  SubcategoryModel({this.status, this.data});

  SubcategoryModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? categoryId;
  String? name;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;
  CategoryModel? category;

  Data(
      {this.id,
      this.categoryId,
      this.name,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt,
      this.category});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    image = json['image'];
    showOnHome = json['show_on_home'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}
