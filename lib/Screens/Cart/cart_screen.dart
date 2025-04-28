import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Controller/cart_controller.dart';
import 'package:service_app/Widgets/custome_container/custom_container.dart';
import '../../Constants/app_colors.dart';
import '../Address/address_detail.dart';

class CartScreen extends StatefulWidget {
  final int? userId;
  const CartScreen({super.key, this.userId});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  CartController cartController = CartController();
  @override
  void initState() {
    context.read<CartController>().getViewMyCart(context, widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log("myData ==> ${widget.userId}");
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Consumer<CartController>(
          builder: (context, snapshot, data) {
            return snapshot.viewMyCart != null
                ? snapshot.isLoading == true
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.purple,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: [
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.viewMyCart!.cartItems!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 15.0),
                                  child: CustomContainer(
                                    myCartItems:
                                        snapshot.viewMyCart!.cartItems![index],
                                    userId: widget.userId!,
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: width * 0.9,
                                height: height * 0.06,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(11),
                                  color:
                                      const Color.fromARGB(255, 245, 231, 208),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      const Text('Total Amount'),
                                      const Spacer(),
                                      Text(
                                        '${snapshot.viewMyCart!.totalPrice}',
                                        style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BookAddressDetail()));
                                },
                                child: Container(
                                  width: width * 0.9,
                                  height: height * 0.06,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(11),
                                    color: AppColors.lightgreen,
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'Proceed To checkout',
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                : const Center(
                    child: Text("Oops! Cart is Empty"),
                  );
          },
        ),
      ),
    );
  }
}
