import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:service_app/Constants/api_url.dart';
import 'package:service_app/Models/sub_category.dart';
import '../Models/category.dart';

class CategoryController extends ChangeNotifier {
//
  CategoryModel? categoryModel;
  SubcategoryModel? subCategoryModel;
//

  Future<CategoryModel?> fetchCategory() async {
    try {
      var response = await http.post(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.categoryUrl}"),
      );
      log("myResponse ==> ${response.body}");
      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        categoryModel = CategoryModel.fromJson(decodedData);
        notifyListeners();
        return categoryModel;
      } else {
        return CategoryModel();
      }
    } catch (e) {
      log("Error in fetchCategory: $e");
      throw Exception("Failed to fetch category: $e");
    }
  }
//

  Future<SubcategoryModel?> fetchSubCategory(int? catId) async {
    try {
      var response = await http.post(
        Uri.parse("${APIUrls.baseUrl}${APIUrls.subCategoryUrl}"),
        body: {
          'category_id': "$catId",
        },
      );
      log("myResponse ==> ${response.body}");
      log("myResponse ==> ${response.statusCode}");

      var decodedData = jsonDecode(response.body);

      if (response.statusCode == 200) {
        subCategoryModel = SubcategoryModel.fromJson(decodedData);
        notifyListeners();
        return subCategoryModel!;
      } else {
        return SubcategoryModel();
      }
    } catch (e) {
      log("Error in fetchSubCategory: $e");
      throw Exception("Failed to fetch subcategory: $e");
    }
  }
//
}
