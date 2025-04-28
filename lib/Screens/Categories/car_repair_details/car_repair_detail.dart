import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Screens/Address/address_detail.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';

class CarRepairDetailScreen extends StatefulWidget {
  const CarRepairDetailScreen({super.key});

  @override
  State<CarRepairDetailScreen> createState() => _CarRepairDetailScreenState();
}

class _CarRepairDetailScreenState extends State<CarRepairDetailScreen> {
  final List<String> crouselpics = [
    'assets/cars.jpg',
    'assets/srv.jpg',
    'assets/re2.jpg',
    'assets/re3.jpg',
    'assets/re4.jpg',
    'assets/bmw.png',
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Repair Detail'),
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
                'Basic Service',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue),
              ),
              SizedBox(height: height * 0.02),
              const Text(
                'Oil Change',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Clean Filters',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Leather Change',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Break checkup',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Text(
                'Tyre threats',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: height * 0.05),
              Divider(thickness: 3, color: AppColors.lightGrey),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Bill',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('= 1300', style: TextStyle(fontWeight: FontWeight.bold))
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
                                  Text('Rs. 300'),
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
                                  Text('Rs. 1300'),
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
