import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/addTocart.dart';
import 'package:service_app/Models/checkout_model.dart';
import 'package:service_app/Models/update_cart.dart';
import 'package:service_app/Models/view_cart.dart';
import 'package:service_app/Utils/toast_component.dart';
import 'package:toast/toast.dart';

class CartController extends ChangeNotifier {
//
  AddToCartModel? myAddedCart;
  ViewCartModel? viewMyCart;
  UpdateCartModel? updateCart;
  ChekoutModel? checkOutModel;
  bool isLoading = false;
//

  Future<AddToCartModel?> addToCart(context, userId, productId, qnty) async {
    ToastContext().init(context);
    try {
      var response = await http.post(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.addCart}"),
        headers: {
          "accept": "application/json",
        },
        body: {
          'user_id': '$userId',
          'product_id': '$productId',
          'quantity': '$qnty',
        },
      );

      log("Added Cart Data ==> ${response.body}");

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        myAddedCart = AddToCartModel.fromJson(jsonData);
        return myAddedCart;
      } else {
        ToastComponent.showDialogError(
            "Something went wrong. Please try again later.");
        return AddToCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }

//

  Future<ViewCartModel> getViewMyCart(context, int? userId) async {
    ToastContext().init(context);
    try {
      isLoading = true;
      notifyListeners();
      var response = await http.get(
          Uri.parse("${APIUrls.baseUrl}${APIUrls.getViewCart}/$userId"),
          headers: {
            "Accept": "application/json",
          });

      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        viewMyCart = ViewCartModel.fromJson(jsonData);
        isLoading = false;
        notifyListeners();
        return viewMyCart!;
      } else {
        isLoading = false;
        notifyListeners();
        ToastComponent.showDialogError("Cart is Empty");
        return ViewCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
//

  Future<UpdateCartModel?> updateCartData({int? quantity, int? cartId}) async {
    Map postData = {
      "cart_id": cartId,
      "qunatity": quantity,
    };
    try {
      var response = await http.post(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.updateCart}"),
        body: postData,
      );
      log("Update Cart Data ==> ${response.body}");
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        updateCart = UpdateCartModel.fromJson(jsonData);
        return updateCart;
      } else {
        ToastComponent.showDialogError("Something went wrong try again later");
        return UpdateCartModel();
      }
    } catch (e) {
      throw e.toString();
    }
  }
//

  Future deleteCart(context, {int? userId, int? productId}) async {
    isLoading = true;
    notifyListeners();
    var response = await http.get(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.getDeleteCart}/$productId"),
        headers: {
          "Accept": "application/json",
        });
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      log("MyDeletedCart ==> ${response.body}");
      ToastComponent.showDialogSuccess("${jsonData['message']}");
      Future.delayed(const Duration(seconds: 3), () {
        viewMyCart = null;
        getViewMyCart(context, userId);
      });
    } else {
      ToastComponent.showDialogError("${jsonData['message']}");
      isLoading = false;
      notifyListeners();
    }
  }

//

  Future checkout(
      {String? paymentMethod,
      String? totalPrice,
      String? tax,
      String? deliveryAddress}) async {
    try {
      var response = await http
          .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.checkout}"), headers: {
        'Accept': 'application/json',
      }, body: {
        "payment_method": "$paymentMethod",
        "total_price": "$totalPrice",
        "tax": "$tax",
        "delivery_address": "$deliveryAddress",
      });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        checkOutModel = ChekoutModel.fromJson(jsonData);
        notifyListeners();
        return checkOutModel;
      } else {
        return ChekoutModel();
      }
    } catch (e) {
      throw Exception("");
    }
  }
}
