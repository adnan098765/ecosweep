import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import '../Models/booking_model.dart';

class BookingResponseController extends ChangeNotifier {
  Future<BookingResponseModel?> fetchBooking() async {
    int bookedId = await SharedPrefrenceData.getUserId();
    String url = "${APIUrls.baseUrl}${APIUrls.bookingApi}$bookedId";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      log('Booking confirmed succesfully');
      log("API Response: ${response.body}");
      return BookingResponseModel.fromJson(json.decode(response.body));
    } else {
      log("Failed to load bookinge");
      return null;
    }
  }
}
