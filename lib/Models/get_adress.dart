class Address {
  final int id;
  final int userId;
  final String latitude;
  final String longitude;
  final String address;
  final String houseNo;
  final String addressDetail;
  final String? landmark;
  final String createdAt;
  final String updatedAt;

  Address({
    required this.id,
    required this.userId,
    required this.latitude,
    required this.longitude,
    required this.address,
    required this.houseNo,
    required this.addressDetail,
    required this.landmark,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      id: json['id'],
      userId: json['user_id'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      address: json['address'],
      houseNo: json['house_no'] ?? '',
      addressDetail: json['address_detail'] ?? '',
      landmark: json['landmark'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
