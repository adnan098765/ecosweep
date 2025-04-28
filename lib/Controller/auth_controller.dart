import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Auth/otp_verification_screen.dart';
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Utils/toast_component.dart';
import 'package:toast/toast.dart';

class AuthController extends ChangeNotifier {
//
  bool loading = false;
  ToastContext myToastContext = ToastContext();
//

  Future signUp(String name, String email, String phoneNumber, String password,
      context) async {
    loading = true;
    notifyListeners();
    var response = await http
        .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.signup}"), headers: {
      "Accept": "application/json",
    }, body: {
      "name": name,
      "email": email,
      "phone_number": phoneNumber,
      "password": password,
    });
    log("signup data ==> ${response.body}");
    var myData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const OtpVerificationScreen(),
        ),
      );
      Get.snackbar('Eco Sweeps', 'Put OTP ', backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      myToastContext.init(context);
      ToastComponent.showDialogError("${myData['message']}",
          gravity: Toast.top);
    }
  }

//---------------Login api fucntion code start ------------------------///

  Future signIn(String email, String password, context) async {
    loading = true;
    notifyListeners();
    var response =
        await http.post(Uri.parse("${APIUrls.baseUrl}${APIUrls.login}"), body: {
      "email": email,
      "password": password,
    });
    log("loginRes ==> ${response.body}");
    var myJsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await SharedPrefrenceData.setToken(myJsonData['token']);
      await SharedPrefrenceData.setUserId(myJsonData['Data']['id']);
      loading = false;
      notifyListeners();
      Navigator.pushNamedAndRemoveUntil(context, 'navbar', (route) => false);
      Get.snackbar('Eco Sweeps', 'Logged in sucessfully',
          backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      ToastComponent.showDialogError("${myJsonData['message']}");
    }
  }

//---------------sign up with code fucntion code start ------------------------///
  Future signUpwithCode(String verificationCode, context) async {
    ToastContext().init(context);
    loading = true;
    notifyListeners();
    var response = await http
        .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.signupwithcode}"), body: {
      "verification_code": verificationCode,
    });
    var myJosnData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      loading = false;
      notifyListeners();
      await SharedPrefrenceData.setUserId(myJosnData['data']['id']);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      Get.snackbar('Eco Sweeps', 'User Registerd sucessfully',
          backgroundColor: Colors.green);
    } else {
      loading = false;
      notifyListeners();
      ToastComponent.showDialogError("${myJosnData['message']}");
    }
  }

//

  Future deleteAccount(int userId, context) async {
    loading = true;
    notifyListeners();
    var response = await http.post(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.deleteAccountUrl}"),
        body: {
          "user_id": "$userId",
        });
    myToastContext.init(context);
    var jsonData = jsonDecode(response.body);
    if (response.statusCode == 200) {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    }
    loading = false;
    notifyListeners();
  }
//

  Future logout(int userId, context) async {
    loading = true;
    notifyListeners();
    var token = SharedPrefrenceData.getToken();
    var response = await http
        .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.logoutUrl}"), headers: {
      "Authorization": "Bearer $token"
    }, body: {
      "user_id": "$userId",
    });
    var jsonData = jsonDecode(response.body);
    myToastContext.init(context);
    if (response.statusCode == 200) {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    } else {
      ToastComponent.showDialogSuccess("${jsonData['message']}");
    }
    loading = false;
    notifyListeners();
  }
}
