import 'package:flutter/material.dart';
import 'package:service_app/Constants/App_colors.dart';
import 'package:service_app/Controller/profile_controller.dart';
import 'package:service_app/Models/edit_profile.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import 'package:service_app/Widgets/round_button_widget.dart';

class UpdateProfile extends StatefulWidget {
  final EditProfileModel myProfileModel;
  const UpdateProfile({
    super.key,
    required this.myProfileModel,
  });

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  ProfileController profileController = ProfileController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * 0.05,
              ),
              CustomTextFormField(
                controller: namecontroller,
                hintText: '${widget.myProfileModel.data!.name}',
                hintColor: AppColors.black,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomTextFormField(
                controller: emailcontroller,
                hintText: '${widget.myProfileModel.data!.email}',
                hintColor: AppColors.black,
              ),
              SizedBox(
                height: height * 0.03,
              ),
              CustomTextFormField(
                controller: phonecontroller,
                hintText: '${widget.myProfileModel.data!.verificationCode}',
                hintColor: AppColors.black,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomTextFormField(
                controller: passwordcontroller,
                hintText: '${widget.myProfileModel.data!.verificationCode}',
                hintColor: AppColors.black,
              ),
              SizedBox(
                height: height * 0.05,
              ),
              RoundButtonWidget(
                loading:
                    profileController.loading, // Controls loading indicator
                title: 'Update Now',
                onpress: () async {
                  setState(() {
                    profileController.loading = true;
                  });
                  await profileController.UpdateProfile(
                    namecontroller.text,
                    emailcontroller.text,
                    passwordcontroller.text,
                    await SharedPrefrenceData.getUserId(),
                  );
                  setState(() {
                    profileController.loading = false;
                  });
                },
                buttonColor: AppColors.lightgreen,
              )
            ],
          ),
        ),
      ),
    );
  }
}
