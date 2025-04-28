import 'package:flutter/material.dart';

class BathContainerWiget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final String? title;
  final String? subtitle;
  final Color? color;
  final IconData? iconcolor;
  final IconData? icon;
  final IconData? trailingIcon;
  final Decoration? decoration;
  final BoxDecoration? boxDecoration;
  final IconData? leading;
  const BathContainerWiget(
      {super.key,
      this.boxDecoration,
      this.child,
      this.icon,
      this.subtitle,
      this.title,
      this.leading,
      this.trailingIcon,
      this.color,
      this.iconcolor,
      this.decoration,
      this.height = 55,
      this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            color: color,
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Icon(leading),
          iconColor: color,
          title: Text(title ?? ''),
          trailing: Icon(trailingIcon),
          subtitle: Text(subtitle ?? ''),
        ));
  }
}
