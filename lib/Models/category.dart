class CategoryModel {
  int? status;
  List<Data>? data;




  CategoryModel({this.status, this.data});

  CategoryModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? image;
  String? showOnHome;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.name,
      this.image,
      this.showOnHome,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
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
