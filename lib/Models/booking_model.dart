class BookingResponseModel {
  final List<Booking> data;

  BookingResponseModel({required this.data});

  factory BookingResponseModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<Booking> bookingList = list.map((i) => Booking.fromJson(i)).toList();
    return BookingResponseModel(data: bookingList);
  }
}

class Booking {
  final int id;
  final int userId;
  final String paymentMethod;
  final String totalPrice;
  final String tax;
  final String deliveryAddress;
  final String createdAt;

  Booking({
    required this.id,
    required this.userId,
    required this.paymentMethod,
    required this.totalPrice,
    required this.tax,
    required this.deliveryAddress,
    required this.createdAt,
  });

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'],
      userId: json['user_id'],
      paymentMethod: json['payment_method'],
      totalPrice: json['total_price'],
      tax: json['tax'],
      deliveryAddress: json['delivery_address'],
      createdAt: json['created_at'],
    );
  }
}
