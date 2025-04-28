import 'package:flutter/material.dart';

class ListviewWidget extends StatelessWidget {
  final int? itemCount;
  final Axis? scrollDirection;
  final Decoration? decoration;
  final double? height;
  final Widget? Function(BuildContext, int)? itemBuilder;

  const ListviewWidget({
    super.key,
    this.decoration,
    this.height,
    this.itemCount,
    this.scrollDirection,
    this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        physics: scrollDirection == Axis.horizontal
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        itemCount: itemCount,
        scrollDirection: scrollDirection ?? Axis.vertical,
        shrinkWrap: true,
        itemBuilder: itemBuilder!,
      ),
    );
  }
}
