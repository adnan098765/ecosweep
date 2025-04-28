import 'package:flutter/material.dart';
import 'package:service_app/Screens/Address/address_detail.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

import '../../../Constants/App_colors.dart';

class CarBookDetail extends StatefulWidget {
  const CarBookDetail({super.key});

  @override
  State<CarBookDetail> createState() => _CarBookDetailState();
}

class _CarBookDetailState extends State<CarBookDetail> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Toyota hilux 2023 ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            ContainerWidget(
              height: height * .25,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage('assets/R2.jpg'), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dubai',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Rs. 10000/day',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            const Text(
              'Features:',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Automatic',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Petrol/Diesel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Only with Driver',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'SUV',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'Seats 7',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Text(
              'AC available',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            const Text(
              'Description:',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const Text(
                'Eco Sweeps - Transform your jouney with seamless rides and exceptional service.Contact us at @ecosweeps.com'),
            SizedBox(
              height: height * 0.10,
            ),

            ///-----------------------------payment summary bottom sheet strt---------------------------///
            Center(
              child: RoundButtonWidget(
                title: 'Book now',
                onpress: () {
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
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Rent payment:'),
                                Text('Rs. 10000')
                              ],
                            ),
                            SizedBox(
                              height: height * 0.04,
                            ),
                            Divider(thickness: 3, color: AppColors.lightGrey),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total payable:'),
                                Text('Rs. 10000')
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/meezan.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image:
                                              AssetImage('assets/dub bank.jpg'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                Container(
                                  height: height * 0.09,
                                  width: width * 0.22,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage('assets/jazz.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(10)),
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
                buttonColor: AppColors.lightgreen,
              ),
            )
          ],
        ),
      ),
    );
  }
}
