import 'package:flutter/material.dart';
import 'package:service_app/Screens/Categories/wash_car_detail/car_wash_book.dart';

import '../../../Constants/App_colors.dart';

class CarWashCategoryScreen extends StatefulWidget {
  const CarWashCategoryScreen({super.key});

  @override
  _CarWashCategoryScreenState createState() => _CarWashCategoryScreenState();
}

class _CarWashCategoryScreenState extends State<CarWashCategoryScreen> {
  final List<String> text2 = [
    'Select the car type so we can adjust the price for you',
    'Car type'
  ];

  final List<String> text = [
    'Car',
    'Truck',
    'BMW',
    'Mehran',
    'Land Cruiser',
    'Suzuki',
  ];

  final List<String> images = [
    'assets/wa1.jpg',
    'assets/wa2.jpg',
    'assets/wa3.jpg',
    'assets/wa4.jpg',
    'assets/wa5.jpg',
    'assets/wa6.jpg',
  ];

  List<bool> checks = [false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car wash Services',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the introductory text
            Text(
              text2[0],
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text2[1],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // Expanded ListView.builder to take up the remaining space
            Expanded(
              child: ListView.builder(
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarWashBookScreen()));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      height: height * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: AppColors.grey),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.lightGrey,
                            spreadRadius: 2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Display the image
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              images[index],
                              height: height * 0.08,
                              width: width * 0.22,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 8),
                          // Display the text for each item
                          Expanded(
                            child: Text(
                              text[index],
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Spacer(),
                          Checkbox(
                            checkColor: AppColors.lightgreen,
                            activeColor: AppColors.lightgreen,
                            value: checks[index],
                            onChanged: (bool? value) {
                              setState(() {
                                checks[index] = value!;
                              });
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
