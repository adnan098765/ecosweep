import 'package:flutter/material.dart';

class PlusMemebership extends StatefulWidget {
  const PlusMemebership({super.key});

  @override
  State<PlusMemebership> createState() => _PlusMemebershipState();
}

class _PlusMemebershipState extends State<PlusMemebership> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'My Subscriptions',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  Image.asset('assets/images/emoji.jpg', width: width*0.32, height: height*0.07,),
          SizedBox(
            height: height * 0.03,
          ),
          const Center(
              child: Text(
            'No Active Subscriptions',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
          )),
          const Center(
              child: Text(
            'Looks like you have not purchased any',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
          )),
          const Center(
              child: Text(
            'subscription pain',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
          )),
        ],
      ),
    );
  }
}
