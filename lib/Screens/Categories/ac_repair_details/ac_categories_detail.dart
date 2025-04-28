import 'package:flutter/material.dart';
import 'package:service_app/Widgets/container_widget.dart';

import '../../../Constants/App_colors.dart';

class ACCategoriesScreen extends StatefulWidget {
  const ACCategoriesScreen({super.key, });

  @override
  State<ACCategoriesScreen> createState() => _ACCategoriesScreenState();
}

class _ACCategoriesScreenState extends State<ACCategoriesScreen> {
  List wo = [
    'assets/duct.jpg',
    'assets/split.jpg',
    'assets/window.jpg',
  ];
  List wodetail = [
    "Duct/Central AC",
    'Split AC',
    "Window AC",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AC Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(thickness: 3, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.03,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      // index == 0
                      //     ? Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) =>
                      //                  ProductListingAndDetailScreen(categoryId:, subcatId: , name: )))
                      //     : index == 1
                      //         ? Navigator.push(
                      //             context,
                      //             MaterialPageRoute(
                      //                 builder: (context) =>
                      //                     ProductListingAndDetailScreen(categoryId: ,subcatId: , name: ,)))
                      //         : null;
                    },
                    child: ContainerWidget(
                      margin: const EdgeInsets.only(bottom: 10),
                      height: height * .14,
                      width: width,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(
                                  0.1), // Shadow color with opacity
                              offset: const Offset(
                                  0, 2), // Horizontal and vertical offset
                              blurRadius: 2, // Blur radius
                              spreadRadius: 0.5, // Spread radius
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: AppColors.white)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              height: height * 0.10,
                              width: width * 0.20,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(wo[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              wodetail[index],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
