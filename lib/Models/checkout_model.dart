class ChekoutModel {
  String? status;
  String? message;
  int? orderId;

  ChekoutModel({this.status, this.message, this.orderId});

  ChekoutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    orderId = json['order_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['order_id'] = this.orderId;
    return data;
  }
}
