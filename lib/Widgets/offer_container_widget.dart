import 'package:flutter/material.dart';

class OfferContainerWidget extends StatefulWidget {
  final double? height;
  final double? width;
  final Widget? child;
  final Decoration? decoration;
  final BoxDecoration? boxDecoration;
  const OfferContainerWidget({
    super.key,
    this.boxDecoration,
    this.child,
    this.decoration,
    this.height,
    this.width
  });

  @override
  State<OfferContainerWidget> createState() => _OfferContainerWidgetState();
}

class _OfferContainerWidgetState extends State<OfferContainerWidget> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        
        Container(
          height: height * 0.11,
          width: width * 0.25,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  image: AssetImage('assets/star.jpg'), fit: BoxFit.cover)),
        ),
        const Text('Super saver\ndeals')
      ],
    );
  }
}
