import 'package:flutter/material.dart';

class ManagePayment extends StatefulWidget {
  const ManagePayment({super.key});

  @override
  State<ManagePayment> createState() => _ManagePaymentState();
}

class _ManagePaymentState extends State<ManagePayment> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.assignment_late_outlined),
          Center(child: Text('Please login using a phone number local', style: TextStyle(fontWeight: FontWeight.w600),)),
          Center(child: Text('to the selected address', style: TextStyle(fontWeight: FontWeight.w600),)),
        ],
      ),
    );
  }
}




