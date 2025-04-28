import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/edit_profile.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Utils/toast_component.dart';

class ProfileController extends ChangeNotifier {
  EditProfileModel? getMyProfile;
  bool loading = false;
  //EditProfile

  Future<EditProfileModel> editprofile() async {
    int userId = await SharedPrefrenceData.getUserId();
    try {
      loading = true;
      notifyListeners();
      var response = await http
          .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.getProfile}"), body: {
        'user_id': '$userId',
      });
      log("APICalled == > ${response.body}");
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        getMyProfile = EditProfileModel.fromJson(jsonData);
        notifyListeners();
        return getMyProfile!;
      } else {
        ToastComponent.showDialogError("${jsonData['messae']}");
        return EditProfileModel();
      }
    } catch (e) {
      log("Error Occurs ==> $e");
    } finally {
      loading = false;
      notifyListeners();
    }
    return EditProfileModel();
  }

  //update profile controller
  Future<void> UpdateProfile(
      String name, String email, String password, int userId) async {
    try {
      loading = true;
      notifyListeners();
      var response = await http
          .post(Uri.parse("${APIUrls.baseUrl}${APIUrls.updateprofile}"), body: {
        'name': name,
        'email': email,
        'password': password,
        'user_id': "$userId",
      });
      var jsonData = jsonDecode(response.body);
      if (response.statusCode == 200) {
        log(response.body);
        ToastComponent.showDialogSuccess("${jsonData['message']}");
      } else {
        ToastComponent.showDialogError("${jsonData['message']}");
      }
    } catch (e) {
      print(e.toString());
    } finally {
      loading = false;
      notifyListeners();
    }
  }
}
