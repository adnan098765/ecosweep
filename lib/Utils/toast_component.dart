import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:toast/toast.dart';

class ToastComponent {
//
  static showDialogError(String msg, {duration = 0, gravity = 0}) {
    Toast.show(msg,
        duration: duration != 0 ? duration : Toast.lengthShort,
        gravity: gravity != 0 ? gravity : Toast.bottom,
        backgroundColor: const Color.fromARGB(228, 238, 76, 76),
        textStyle: TextStyle(color: AppColors.white),
        border: Border(
          top: BorderSide(color: AppColors.black),
          bottom: BorderSide(color: AppColors.black),
          right: BorderSide(color: AppColors.black),
          left: BorderSide(color: AppColors.black),
        ),
        backgroundRadius: 6);
  }
//

  static showDialogSuccess(String msg, {duration = 0, gravity = 0}) {
    Toast.show(
      msg,
      duration: duration != 0 ? duration : Toast.lengthShort,
      gravity: gravity != 0 ? gravity : Toast.bottom,
      backgroundColor: const Color.fromARGB(227, 5, 158, 18),
      textStyle: TextStyle(color: AppColors.white),
      border: Border(
        top: BorderSide(color: AppColors.black),
        bottom: BorderSide(color: AppColors.black),
        right: BorderSide(color: AppColors.black),
        left: BorderSide(color: AppColors.black),
      ),
      backgroundRadius: 6,
    );
  }
}
