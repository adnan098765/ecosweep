import 'package:flutter/material.dart';
import 'package:service_app/Widgets/container_widget.dart';

class CustomColumnWidget extends StatelessWidget {
  const CustomColumnWidget({super.key});
  

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      children: [
        ContainerWidget(
          height: height * 0.09,
          width: width * 0.09,
          decoration: const BoxDecoration(),
          child: Image.asset('assets/woman (1).png'),
        ),
        const Text('Salon for women')
      ],
    );
  }
}
