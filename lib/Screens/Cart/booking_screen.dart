import 'dart:developer';

import 'package:flutter/material.dart';
import '../../Controller/booking_controller.dart';
import '../../Models/booking_model.dart';

class BookingApi extends StatefulWidget {
  const BookingApi({super.key});

  @override
  _BookingApiState createState() => _BookingApiState();
}

class _BookingApiState extends State<BookingApi> {
  BookingResponseModel? _booking;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // Fetch the booking data when the widget is initialized
    BookingResponseController().fetchBooking().then((booking) {
      setState(() {
        _booking = booking;
        isLoading = false;
      });
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      log(error); // Handle the error here
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _booking == null || _booking!.data.isEmpty
              ? const Center(child: Text('No booking found'))
              : ListView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _booking!.data.length, // Number of bookings
                  itemBuilder: (context, index) {
                    // Accessing each booking in the list
                    var booking = _booking!.data[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Payment Method: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: booking
                                          .paymentMethod), // Dynamic value
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Total Price: \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: booking.totalPrice
                                          .toString()), // Dynamic value
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Tax: \$',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: booking.tax
                                          .toString()), // Dynamic value
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Delivery Address: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: booking
                                          .deliveryAddress), // Dynamic value
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text.rich(
                              TextSpan(
                                children: [
                                  const TextSpan(
                                    text: 'Created At: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                      text: booking.createdAt), // Dynamic value
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
