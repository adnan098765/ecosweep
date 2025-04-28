import 'package:flutter/material.dart';
import 'package:service_app/Screens/Cart/booking_screen.dart';
import 'package:service_app/Screens/Navigation/help_screen.dart';

import '../../Constants/App_colors.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int number = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Booking & plans',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HelpScreen()));
                    },
                    child: Container(
                      height: height * 0.04,
                      width: width * 0.17,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.lightGrey),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'Help',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.purple),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Divider(thickness: 3, color: AppColors.lightGrey),
              const Expanded(child: BookingApi())
            ],
          ),
        ),
      ),
    );
  }
}
