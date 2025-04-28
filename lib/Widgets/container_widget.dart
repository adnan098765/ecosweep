import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  final double? height;
  final Color? color;
  final Widget? child;
  final double? width;
  final Decoration? decoration;
  final EdgeInsetsGeometry? margin;

  const ContainerWidget(
      {super.key,
      this.color,
      this.height,
      this.margin,
      this.child,
      this.width,
      this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      width: width,
      decoration: decoration,
      child: child,
    );
  }
}
