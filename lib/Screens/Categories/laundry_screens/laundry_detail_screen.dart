import 'package:flutter/material.dart';
import 'package:service_app/Controller/product_controller.dart';
import 'package:service_app/Models/product.dart';
import 'package:service_app/Screens/Categories/Product_detail/product_detail.dart';
import 'package:service_app/Widgets/listview_widget.dart';
import '../../../Constants/app_colors.dart';

class ProductListingAndDetailScreen extends StatefulWidget {
  final int? categoryId;
  final int? subcatId;
  final String? name;
  const ProductListingAndDetailScreen(
      {super.key,
      required this.categoryId,
      required this.subcatId,
      required this.name});

  @override
  State<ProductListingAndDetailScreen> createState() =>
      _ProductListingAndDetailScreenState();
}

class _ProductListingAndDetailScreenState
    extends State<ProductListingAndDetailScreen> {
  List<Products> cartAddedProducts = [];

  int _count = 1;
  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    setState(() {
      if (_count > 1) {
        _count--;
      }
    });
  }

  ProductController productController = ProductController();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.name!,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Divider(thickness: 2, color: AppColors.lightGrey),
              SizedBox(
                height: height * 0.02,
              ),

              //------------------listview builder widget start---------------------///

              FutureBuilder(
                  future: productController.getProducts(
                      catId: widget.categoryId, subCatId: widget.subcatId),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return SizedBox(
                      child: ListviewWidget(
                          scrollDirection: Axis.vertical,
                          itemCount:
                              snapshot.data!.subCategory!.products!.length,
                          decoration: const BoxDecoration(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                              myProducts: snapshot.data!
                                                  .category!.products![index],
                                            )));
                              },
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: height * 0.13,
                                      width: width * 0.21,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              snapshot.data!.category!
                                                  .products![index].image
                                                  .toString(),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Container(
                                        height: height * 0.13,
                                        width: width * 0.7,
                                        decoration: const BoxDecoration(),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.category!
                                                  .products![index].name
                                                  .toString(),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              snapshot.data!.category!
                                                  .products![index].description
                                                  .toString(),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Text(
                                                  snapshot.data!.category!
                                                      .products![index].amount
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  width: width * 0.350,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                    thickness: 3, color: AppColors.lightGrey),
                                SizedBox(
                                  height: height * 0.01,
                                ),
                              ]),
                            );
                          }),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
