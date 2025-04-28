import 'package:flutter/material.dart';

enum TextType {
  small,
  heading,
  medium,
  subheading,
}

class TextWidget extends StatelessWidget {
  final String text;
  final TextType type;

  const TextWidget({super.key, required this.text, required this.type});

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle;

    switch (type) {
      case TextType.small:
        textStyle = const TextStyle(fontSize: 15.0);
        break;
      case TextType.heading:
        textStyle = const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        );
        break;
      case TextType.medium:
        textStyle = const TextStyle(fontSize: 18.0);
        break;
      case TextType.subheading:
        textStyle = const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
        );
        break;
      default:
        textStyle = const TextStyle(fontSize: 14.0);
    }

    return Text(
      text,
      style: textStyle,
    );
  }
}
