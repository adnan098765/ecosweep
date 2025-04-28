import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';

// ignore: must_be_immutable
class ActionButton extends StatefulWidget {
  int qunatity;
  ActionButton({super.key, required this.qunatity});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  void _incrementCounter() {
    setState(() {
      widget.qunatity++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (widget.qunatity > 0) {
        widget.qunatity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _incrementCounter();
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 10,
              child: Icon(
                Icons.add,
                size: 20,
                color: AppColors.black,
              ),
            ),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          Text(
            '${widget.qunatity}',
            style: const TextStyle(
                color: Colors.green, fontSize: 21, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.005,
          ),
          InkWell(
            onTap: () {
              _decrementCounter();
            },
            child: CircleAvatar(
              backgroundColor: AppColors.white,
              radius: 10,
              child: Icon(
                Icons.remove,
                size: 20,
                color: AppColors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
