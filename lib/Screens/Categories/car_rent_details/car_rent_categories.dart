import 'package:flutter/material.dart';
import 'package:service_app/Screens/Categories/car_rent_details/car_book_detail.dart';

import 'package:service_app/Widgets/listview_widget.dart';

import '../../../Constants/App_colors.dart';

class CarRentCategories extends StatefulWidget {
  const CarRentCategories({super.key});

  @override
  State<CarRentCategories> createState() => _CarRentCategoriesState();
}

class _CarRentCategoriesState extends State<CarRentCategories> {
  List cars = [
    'assets/range.jpg',
    'assets/fotuner black.jpg',
    'assets/fortuner.jpg',
    'assets/t yaris.jpg',
    'assets/yaris.jpg',
    'assets/t yaris2.jpg',
    'assets/corola 19.jpg',
    'assets/t corola.jpg',
    'assets/v8.jpg',
    'assets/honda civic.jpg'
  ];

  List carnames = [
    'Range Rover',
    'Fortuner Black',
    'Fortuner ',
    'Toyota Yaris',
    'Yaris',
    'Toyota Yaris',
    'Corola 19',
    'Toyota Corola',
    'Land Cruiser v8',
    'Honda Civic'
  ];

  List rentcars = [
    'assets/R.1.jpg',
    'assets/R2.jpg',
    'assets/R3.jpg',
    'assets/R4.jpg',
    'assets/R5.jpg',
    'assets/R6.jpg',
    'assets/R7.jpg',
    'assets/R8.jpg',
    'assets/R9.jpg',
    'assets/R10.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Available Cars for Rent',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Book your favourite Car',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              SizedBox(
                height: height * .25,
                child: ListviewWidget(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(left: 10),
                            height: height * .2,
                            width: width * .75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(cars[index])),
                        Text(
                          carnames[index],
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        )
                      ],
                    );
                  },
                ),
              ),
              Divider(thickness: 3, color: AppColors.lightGrey),
              const Text(
                'Select Cars',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              GridView.builder(
                itemCount: 10,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 15,
                    mainAxisExtent: 200,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const CarBookDetail()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              offset: const Offset(
                                  0, 2), // Horizontal and vertical offset
                              blurRadius: 2, // Blur radius
                              spreadRadius: 0.2, // Spread radius
                            ),
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.13,
                            width: width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(rentcars[index]),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Toyata hilux',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 5),
                            child: Text(
                              'Altis',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  'Dubai',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                'RS. 1000/day',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
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
