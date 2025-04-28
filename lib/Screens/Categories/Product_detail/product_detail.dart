import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:service_app/Controller/cart_controller.dart';
import 'package:service_app/Controller/product_controller.dart';

import 'package:service_app/Models/product.dart';
import 'package:service_app/Screens/Cart/cart_screen.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import '../../../Constants/app_colors.dart';
import '../../../Widgets/round_button_widget.dart';
import 'dart:developer';

class ProductDetailScreen extends StatefulWidget {
  final dynamic myProducts;

  const ProductDetailScreen({super.key, required this.myProducts});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
//
  CartController myCartController = CartController();
  ProductController productController = ProductController();
//
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.myProducts.name!,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
                future:
                    productController.postProductDetails(widget.myProducts.id!),
                builder: (context, snapshot) {
                  log('${snapshot.data}');
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Container(
                      width: width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: height * 0.19,
                                  width: width,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data!.Data!.image),
                                          fit: BoxFit.cover),
                                      color: Colors.black,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  snapshot.data!.Data!.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  snapshot.data!.Data!.description,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    Text(
                                      snapshot.data!.Data!.amount,
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(width: 10),
                                    const Text(
                                      'AED 169',
                                      style: TextStyle(
                                        fontSize: 16,
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const Divider(),
                                const SizedBox(height: 10),
                                const Text(
                                  "What's Included",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: height * 0.030),
                                Text(
                                  snapshot.data!.Data!.description,
                                )
                              ])));
                }),
            SizedBox(height: height * .15),
            CounterWidget(myProducts: widget.myProducts)
          ],
        ),
      ),
    );
  }
}

class CounterWidget extends StatefulWidget {
  final Products? myProducts;

  const CounterWidget({super.key, required this.myProducts});

  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  CartController myCartController = CartController();
  int count = 1;
  double totalPrice = 0;
  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      if (count > 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    String amount = widget.myProducts!.amount!;
    List<String> amountParts =
        amount.replaceAll(RegExp(r'[^0-9 ]'), '').split(" ");
    int parsedValue = 0;
    for (String part in amountParts) {
      int? value = int.tryParse(part);
      if (value != null) {
        parsedValue = value;
        break;
      }
    }

    totalPrice = double.parse((count * parsedValue).toString());
    return Container(
      height: height * 0.2,
      width: width,
      decoration: const BoxDecoration(
        color: Colors.white10,
      ),
      child: Column(
        children: [
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.red,
                  child: IconButton(
                    icon: const Center(child: Icon(Icons.remove)),
                    onPressed: () {
                      decrement();
                    },
                  ),
                ),
                SizedBox(
                  width: width * 0.020,
                ),
                Text(
                  '$count',
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(
                  width: width * 0.020,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      increment();
                    },
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child: RoundButtonWidget(
                buttonColor: AppColors.lightgreen,
                title: 'Add  to Cart for AED $totalPrice',
                onpress: () async {
                  int userId = await SharedPrefrenceData.getUserId();

                  myCartController.addToCart(
                      context, userId, widget.myProducts?.id, count);
                  showAddToCartDialog(context);
                }),
          )
        ],
      ),
    );
  }
}

void showAddToCartDialog(BuildContext context) {
  showCupertinoDialog(
    context: context,
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: const Text('Item Added to Cart'),
        content:
            const Text('The item has been successfully added to your cart.'),
        actions: <Widget>[
          CupertinoDialogAction(
            child: const Text('Shop more'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          CupertinoDialogAction(
            child: const Text('Go to cart'),
            onPressed: () async {
              int userId = await SharedPrefrenceData.getUserId();
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen(
                            userId: userId,
                          )));
            },
          ),
        ],
      );
    },
  );
}
