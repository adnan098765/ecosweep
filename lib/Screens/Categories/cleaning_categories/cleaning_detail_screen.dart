import 'package:flutter/material.dart';
import 'package:service_app/Screens/Address/address_detail.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';

class CleaningDetailScreen extends StatefulWidget {
  const CleaningDetailScreen({super.key});

  @override
  State<CleaningDetailScreen> createState() => _CleaningDetailScreenState();
}

class _CleaningDetailScreenState extends State<CleaningDetailScreen> {
  List hours = [
    '1 hour',
    '1.5 hour',
    '2 hour',
    '2.5 hour',
    '3 hour',
    '3.5 hour',
    '4 hour',
    '4.5 hour',
    '5 hour',
    '5.5 hour',
    '6 hour',
    '6.5 hour'
  ];
  List mans = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  int selectedHourIndex = -1;
  int selectedManIndex = -1;
  bool isselected = false;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            'Home Cleaning',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Divider(thickness: 3, color: AppColors.lightGrey),
          const Text('How many hours do you need your professional to stay?'),
          SizedBox(height: height * 0.03),
          SizedBox(
            height: height * 0.085,
            child: ListView.builder(
              itemCount: hours.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHourIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    // height: height * 0.030,
                    width: width * 0.18,
                    decoration: BoxDecoration(
                      color: selectedHourIndex == index
                          ? AppColors.lightgreen
                          : AppColors.lightGrey,
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        hours[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: selectedHourIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.05),
          const Text('How many professionals do you need?'),
          SizedBox(height: height * 0.02),
          SizedBox(
            height: height * 0.07,
            width: width,
            child: ListView.builder(
              itemCount: mans.length,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedManIndex = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    width: width * 0.15,
                    decoration: BoxDecoration(
                      color: selectedManIndex == index
                          ? AppColors.lightgreen
                          : AppColors.lightGrey,
                      border: Border.all(color: AppColors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        mans[index],
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: selectedManIndex == index
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: height * 0.05),
          const Text('Need cleaning material?'),
          SizedBox(height: height * 0.02),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isselected = !isselected;
                  });
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.35,
                  decoration: BoxDecoration(
                    color:
                        isselected ? AppColors.lightgreen : AppColors.lightGrey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'No, I have them',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: isselected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: width * 0.03),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isselected = !isselected;
                  });
                },
                child: Container(
                  height: height * 0.06,
                  width: width * 0.3,
                  decoration: BoxDecoration(
                    color: !isselected
                        ? AppColors.lightgreen
                        : AppColors.lightGrey,
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      'Yes, please',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: !isselected ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          ///------------------------------need cleaning material end------------------------///
        ]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Total'),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('PKR 1500'),
                  // const Icon(Icons.keyboard_arrow_up_outlined),
                  InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ContainerWidget(
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
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(' payment:'),
                                    Text('Rs. 1000')
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [Text(' Fee:'), Text('Rs. 500')],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Divider(
                                    thickness: 3, color: AppColors.lightGrey),
                                const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Total payable:'),
                                    Text('Rs. 1500')
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.04,
                                ),
                                const Text(
                                  'Pay via:',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ContainerWidget(
                                      height: height * 0.09,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/meezan.jpg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    ContainerWidget(
                                      height: height * 0.09,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image: AssetImage(
                                                  'assets/dub bank.jpg'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    ContainerWidget(
                                      height: height * 0.09,
                                      width: width * 0.22,
                                      decoration: BoxDecoration(
                                          image: const DecorationImage(
                                              image:
                                                  AssetImage('assets/jazz.png'),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
                          //------------------------pyament bottom sheet end------------------///
                        },
                      );
                    },
                    child: Container(
                      height: height * 0.06,
                      width: width * 0.30,
                      decoration: BoxDecoration(
                        color: AppColors.lightgreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Center(
                        child: Text(
                          'Next',
                          style: TextStyle(color: AppColors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
