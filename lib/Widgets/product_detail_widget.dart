import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import '../Constants/App_colors.dart';

class ProductDetailWidget extends StatelessWidget {
  
  const ProductDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.sizeOf(context).height;
    double width=MediaQuery.sizeOf(context).width;
    return  ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                physics:
                    const NeverScrollableScrollPhysics(), // Ensures the ListView doesn't scroll
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Super saver deals',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            'Cleaning Guide',
                            style: TextStyle(
                                color: AppColors.purple,
                                fontWeight: FontWeight.bold),
                          ),
                          const Icon(Icons.arrow_forward_ios_outlined)
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('RS. 404 PER BATHROOM'),
                              Text(
                                'Intense cleaning-2',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'bathroom pack',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                  ),
                                  Text('4.78 (1.6M reviews)'),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('\$20'),
                                  Text('2 hrs 40 minutes')
                                ],
                              ),
                            ],
                          ),
                          Stack(
                            children: [
                              Container(
                                height: height * 0.11,
                                width: width * 0.23,
                                decoration: BoxDecoration(
                                    color: Colors.green.shade200,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Text(
                                      '2',
                                      style: TextStyle(
                                          fontSize: 40,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.green),
                                    ),
                                    const Text(
                                      'BATHROOMS',
                                      style: TextStyle(color: Colors.black),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 80, left: 10),
                                height: height * 0.03,
                                width: width * 0.18,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(color: AppColors.grey),
                                    borderRadius: BorderRadius.circular(6)),
                                child: Center(
                                    child: Text(
                                  'Add',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.purple),
                                )),
                              )
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const DottedLine(
                        lineThickness: 1.0,
                        dashColor: Colors.grey,
                        lineLength: 250,
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                              '1-Hard-water stain removal from toilet\n   pot,basin,exhaust,tiles etc'),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                              '2-Intense cleaning with scrubbing\n   machine at only \$20/bathroom'),
                        ],
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'View details',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      Divider(thickness: 3, color: AppColors.lightGrey),
                      SizedBox(
                        height: height * 0.02,
                      ),
                    ],
                  );
                },
              );
  }
}