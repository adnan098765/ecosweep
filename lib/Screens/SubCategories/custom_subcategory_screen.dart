import 'package:flutter/material.dart';
import 'package:service_app/Controller/category_controller.dart';
import 'package:service_app/Screens/Categories/laundry_screens/laundry_detail_screen.dart';
import 'package:service_app/Widgets/container_widget.dart';
import '../../Constants/App_colors.dart';
import '../../Models/sub_category.dart';

class CustomSubCategoryScreen extends StatefulWidget {
  final int? catId;
  final String? catName;
  const CustomSubCategoryScreen({super.key, required this.catId, required this.catName});

  @override
  State<CustomSubCategoryScreen> createState() =>
      _CustomSubCategoryScreenState();
}

class _CustomSubCategoryScreenState extends State<CustomSubCategoryScreen> {
  CategoryController categoryController = CategoryController();

  @override
  void initState() {
    categoryController.fetchSubCategory(widget.catId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title:  Text(
          widget.catName.toString(),
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Divider(thickness: 3, color: AppColors.lightGrey),
              SizedBox(height: height * 0.03),
              FutureBuilder(
                future: categoryController.fetchSubCategory(widget.catId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data!.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.data!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return buildSubCategoryItem(
                          context, index, snapshot.data!);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSubCategoryItem(
      BuildContext context, int index, SubcategoryModel subCategory) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductListingAndDetailScreen(
                      categoryId: widget.catId,
                      subcatId: subCategory.data![index].id,
                      name: subCategory.data![index].name,
                    )));
      },
      child: ContainerWidget(
        margin: const EdgeInsets.only(bottom: 10),
        height: height * .14,
        width: width,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 2,
              spreadRadius: 0.5,
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: AppColors.white),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: height * 0.10,
                width: width * 0.20,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image:
                        NetworkImage(subCategory.data![index].image.toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                subCategory.data![index].name.toString(),
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
