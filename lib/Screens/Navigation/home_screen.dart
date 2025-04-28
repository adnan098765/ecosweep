import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service_app/Controller/category_controller.dart';
import 'package:service_app/Models/search_model.dart';
import 'package:service_app/Screens/Cart/cart_screen.dart';
import 'package:service_app/Screens/Search/search_screen.dart';
import 'package:service_app/Screens/SubCategories/custom_subcategory_screen.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import '../../Constants/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  SearchModel searchResults = SearchModel();
  bool isLoading = false;
  CategoryController categoryController = CategoryController();
  SearchController searchProduct = SearchController();

  List wo = [
    'assets/physio.jpg',
    'assets/nurse.jpg',
    'assets/consult.jpg',
    'assets/pcr.jpg',
    'assets/flu.jpg',
    'assets/phys coun.jpg',
    'assets/labtest.jpg',
    'assets/therapy.jpg'
  ];

  final List<String> crouselpics = [
    'assets/first.jpg',
    'assets/second.jpg',
    'assets/third.jpg',
    'assets/fourth.jpg',
    'assets/fifth.jpg',
    'assets/2ndlast.jpg',
    'assets/last.jpg'
  ];

  String address = '';
  String city = '';

  void fetchFullAddress() async {
    if (await checkLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        address =
            '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
      });
    }
  }

  Future<bool> checkLocationPermission() async {
    if (await Permission.location.isGranted) {
      return true;
    } else {
      var status = await Permission.location.request();
      if (status.isGranted) {
        return true;
      } else {
        return false;
      }
    }
  }

  @override
  void initState() {
    fetchFullAddress();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SafeArea(
                      child: Column(
                        children: [
                          // Location, Cart section
                          ListTile(
                            title: Text(
                              city,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(address),
                            trailing: InkWell(
                              onTap: () async {
                                int userId =
                                    await SharedPrefrenceData.getUserId();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CartScreen(
                                              userId: userId,
                                            )));
                              },
                              child: CircleAvatar(
                                backgroundColor: AppColors
                                    .lightGrey, // Use AppColors.lightgreen here
                                child: const Icon(Icons.shopping_cart_outlined),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),

                          // Search bar

                          CustomTextFormField(
                            isReadOnly: true,
                            controller: searchController,
                            hintText: 'Look for services',
                            bordercolor: AppColors.black,
                            prefixIcon: Icons.search,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SearchScreen()));
                            },
                          ),

                          SizedBox(height: height * 0.02),

                          // First services section
                          FutureBuilder(
                            future: categoryController.fetchCategory(),
                            builder: (context, snapshot) {
                              if (!snapshot.hasData) {
                                return const Center(
                                  child: CircularProgressIndicator(),
                                );
                              }

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.data!.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10,
                                  mainAxisExtent: 130,
                                  mainAxisSpacing: 10,
                                  crossAxisCount: 3,
                                ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CustomSubCategoryScreen(
                                            catId:
                                                snapshot.data!.data![index].id,
                                            catName: snapshot
                                                .data!.data![index].name,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Container(
                                      height: height * 0.15,
                                      width: width * .40,
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * 0.10,
                                            width: width * .27,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                              color: Colors.grey[
                                                  200], // Use AppColors.lightGrey
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  snapshot
                                                      .data!.data![index].image
                                                      .toString(),
                                                ),
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            snapshot.data!.data![index].name
                                                .toString(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),

                          Divider(
                              thickness: 5,
                              color: AppColors
                                  .lightGrey), // Use AppColors.lightGrey

                          // Carousel slider section
                          CarouselSlider(
                            items: crouselpics.map((item) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image:
                                      DecorationImage(image: AssetImage(item)),
                                ),
                              );
                            }).toList(),
                            options: CarouselOptions(
                              height: height * .23,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 600),
                              viewportFraction: 0.8,
                            ),
                          ),

                          Divider(thickness: 5, color: AppColors.lightGrey),

                          // Healthcare section
                          SizedBox(height: height * 0.02),
                          buildSection(
                            context,
                            'Healthcare at home',
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: wo.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return buildHorizontalCard(
                                  height,
                                  width,
                                  wo[index],
                                  // wodetail[index],
                                );
                              },
                            ),
                          ),

                          const Divider(thickness: 5, color: Colors.grey),

                          // Cleaning section

                          Divider(thickness: 5, color: AppColors.lightGrey),

                          // AC Repair section

                          Divider(
                              thickness: 5,
                              color: AppColors
                                  .lightGrey), // Use AppColors.lightGrey

                          // Women's Saloon section

                          Divider(thickness: 5, color: AppColors.lightGrey),
                          // Maintenance section
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }

  // Reusable method for building sections
  Widget buildSection(BuildContext context, String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        SizedBox(height: 150, child: content),
      ],
    );
  }

  // Reusable method for building horizontal cards
  Widget buildHorizontalCard(double height, double width, String image,
      {String? detail}) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 15),
          child: Container(
            height: height * .14,
            width: width * 0.43,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Text(
            // detail,
            "",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
