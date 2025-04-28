import 'package:flutter/material.dart';

import '../Constants/App_colors.dart';

class RoundButtonWidget extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onpress;
  final Color? buttonColor;

  const RoundButtonWidget(
      {super.key,
      required this.title,
      this.loading =false,
      required this.onpress,
      this.buttonColor});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap: onpress,
      child: Container(
        
        height: height * 0.06,
        width: width * .8,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(
                    color: Colors.white,
                  )
                : Text(
                    title,
                    style: TextStyle(fontSize: 20, color: AppColors.white),
                  )),
      ),
    );
  }
}
