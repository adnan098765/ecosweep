import 'package:flutter/material.dart';

// Small Text
class SmallText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const SmallText(
      {super.key, required this.text, this.color, this.fontSize = 12});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}

// Medium Text
class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const MediumText(
      {super.key, required this.text, this.color, this.fontSize = 14});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.w500),
    );
  }
}

// Large Text
class LargeText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  const LargeText(
      {super.key, required this.text, this.color, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      text,
      style: TextStyle(
          color: color, fontSize: fontSize, fontWeight: FontWeight.bold),
    );
  }
}
