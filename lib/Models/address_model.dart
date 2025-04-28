class AddressModel {
  int? status;
  String? message;
  Data? data;

  AddressModel({this.status, this.message, this.data});

  AddressModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? userId;
  String? latitude;
  String? longitude;
  String? address;
  String? houseNo;
  String? addressDetail;
  String? landmark;
  String? updatedAt;
  String? createdAt;
  int? id;

  Data(
      {this.userId,
      this.latitude,
      this.longitude,
      this.address,
      this.houseNo,
      this.addressDetail,
      this.landmark,
      this.updatedAt,
      this.createdAt,
      this.id});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    houseNo = json['house_no'];
    addressDetail = json['address_detail'];
    landmark = json['landmark'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['address'] = address;
    data['house_no'] = houseNo;
    data['address_detail'] = addressDetail;
    data['landmark'] = landmark;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
