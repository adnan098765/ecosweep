import 'package:flutter/material.dart';

import '../../Constants/App_colors.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.lightGrey,
        title: const Text(
          'How can we help you',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 18, top: 20),
            child: Text(
              'All topics',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Account'),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),
////-----------------------------------------------------------------///
          const ListTile(
            leading: Icon(Icons.start),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Getting started with ECS'),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),

          const ListTile(
            leading: Icon(Icons.payment),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Payment & ECS Credits'),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),

          const ListTile(
            leading: Icon(Icons.card_membership),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('ECS Plus Membership'),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),

          const ListTile(
            leading: Icon(Icons.safety_check),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('ECS Safty '),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),

          const ListTile(
            leading: Icon(Icons.save),
            trailing: Icon(Icons.keyboard_arrow_right),
            title: Text('Warranty'),
          ),
          Divider(thickness: 2, color: AppColors.lightGrey),
        ],
      ),
    );
  }
}
