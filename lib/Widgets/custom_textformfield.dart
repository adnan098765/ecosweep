// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:service_app/Constants/App_colors.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final Color? color;
  final void Function()? onTap;
  final Color? bordercolor;
  final IconData? prefixIcon;
  final Color? hintColor;
  final IconData? suffixIcon;
  final Function(String?)? onSaved;
  Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final bool? isReadOnly;
  final bool? isAutoFocus;

  Function(String)? onChanged;

  CustomTextFormField(
      {super.key,
      this.hintText,
      this.labelText,
      this.color,
      this.bordercolor,
      this.prefixIcon,
      this.suffixIcon,
      this.onTap,
      this.onSaved,
      this.controller,
      this.onChanged,
      this.isAutoFocus,
      this.hintColor,
      this.onFieldSubmitted,
      this.isReadOnly});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      readOnly: isReadOnly ?? false,
      autofocus: isAutoFocus ?? false,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        hintStyle: TextStyle(color: hintColor ?? AppColors.grey),
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide:
              BorderSide(color: bordercolor ?? AppColors.defaultBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide:
              BorderSide(color: bordercolor ?? AppColors.defaultBorderColor),
        ),
      ),
    );
  }
}
