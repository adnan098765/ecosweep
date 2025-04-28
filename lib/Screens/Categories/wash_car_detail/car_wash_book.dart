import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Screens/Address/address_detail.dart';

import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';

class CarWashBookScreen extends StatefulWidget {
  const CarWashBookScreen({super.key});

  @override
  State<CarWashBookScreen> createState() => _CarWashBookScreenState();
}

class _CarWashBookScreenState extends State<CarWashBookScreen> {
  final List<String> crouselpics = [
    'assets/wa1.jpg',
    'assets/wa2.jpg',
    'assets/wa3.jpg',
    'assets/wa4.jpg',
    'assets/wa5.jpg',
    'assets/wa6.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Car Wash detail',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CarouselSlider(
                items: crouselpics.map((item) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage(item),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: height * .27,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 20 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 600),
                  viewportFraction: 0.9,
                ),
              ),
              SizedBox(height: height * 0.02),
              Text(
                'Wash Service',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
              SizedBox(height: height * 0.02),
              const Text(
                'Hard Wax',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Interior Cleaning',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Scratch Removal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Carpet Shampooing',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Watr Spot Removal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Paint Restoration',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.04),
              Divider(thickness: 3, color: AppColors.lightGrey),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Bill',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('= 1500', style: TextStyle(fontWeight: FontWeight.bold))
                ],
              ),
              SizedBox(height: height * 0.2),
              Center(
                child: RoundButtonWidget(
                  buttonColor: AppColors.lightgreen,
                  title: 'Book Now',
                  onpress: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: height * .5,
                          width: width,
                          decoration: const BoxDecoration(),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(children: [
                              const Text(
                                'Payment Summary',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Payment:'),
                                  Text('Rs. 1000'),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Fee:'),
                                  Text('Rs. 500'),
                                ],
                              ),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Consetion:'),
                                  Text('Rs. 100'),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              const Divider(thickness: 3, color: Colors.grey),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Total payable:'),
                                  Text('Rs. 1400'),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.04,
                              ),
                              const Text(
                                'Pay via:',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/meezan.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/dub bank.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.09,
                                    width: width * 0.22,
                                    decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage('assets/jazz.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.05,
                              ),
                              RoundButtonWidget(
                                title: 'CheckOut',
                                onpress: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BookAddressDetail()));
                                },
                                buttonColor: AppColors.lightgreen,
                              )
                            ]),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

////--------------------