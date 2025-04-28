import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:service_app/Controller/address_controller.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import 'package:service_app/Utils/toast_component.dart';
import 'package:service_app/Widgets/container_widget.dart';
import 'package:service_app/Widgets/custom_textformfield.dart';
import 'package:service_app/Widgets/round_button_widget.dart';
import 'package:toast/toast.dart';

import '../../../Constants/App_colors.dart';
import '../../../Models/address_model.dart';

class AnotherAddresses extends StatefulWidget {
  const AnotherAddresses({super.key});

  @override
  State<AnotherAddresses> createState() => _AnotherAddressesState();
}

class _AnotherAddressesState extends State<AnotherAddresses> {
  TextEditingController houseno = TextEditingController();
  TextEditingController addresshouse = TextEditingController();
  TextEditingController addresdetail = TextEditingController();
  TextEditingController landmarks = TextEditingController();
  TextEditingController usersId = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isopen = false;
  String selectedType = '';
  String myAddress = '';
  String? userId;
  String? latitude;
  String? longitude;
  String? address;
  String? houseNo;
  String? addressDetail;
  String? landmark;

  void _updateSelection(String type) {
    setState(() {
      selectedType = type;
    });
  }

  void fetchFullAddress() async {
    if (await checkLocationPermission()) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      setState(() {
        myAddress =
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

  void submitAddress() async {
    ToastContext().init(context);
    if (houseno.text == '') {
      ToastComponent.showDialogError("Please enter house no");
      return;
    }
    if (addresshouse.text == '') {
      ToastComponent.showDialogError("Please enter building name / Street ");
      return;
    }
    if (addresdetail.text == '') {
      ToastComponent.showDialogError("Please select address name");
      return;
    }
    AddressModel? result = await AddressController().postAddress(
      houseno.text.toString(),
      address.toString(),
      addresdetail.text,
      landmarks.text,
      await SharedPrefrenceData.getUserId(),
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Address posted successfully!')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to post address.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Choose Your Location',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.7,
                      child: Text(
                        myAddress,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    ContainerWidget(
                      height: height * 0.047,
                      width: width * 0.24,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(10)),
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Change',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.purple),
                          )),
                    )
                  ],
                ),
                Divider(thickness: 3, color: AppColors.lightGrey),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTextFormField(
                  controller: houseno,
                  onSaved: (value) => houseNo = value,
                  bordercolor: AppColors.lightGrey,
                  hintText: 'House/Flat Number',
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTextFormField(
                  controller: addresshouse,
                  onSaved: (value) => address = value,
                  bordercolor: AppColors.lightGrey,
                  hintText: 'Building Name - Street Address',
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                CustomTextFormField(
                  controller: landmarks,
                  onSaved: (value) => landmark = value,
                  bordercolor: AppColors.lightGrey,
                  hintText: 'Landmark(Optional)',
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                const Text('Save as'),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        _updateSelection('Home');
                        addresdetail.text = 'Home';
                      },
                      child: ContainerWidget(
                        height: height * 0.055,
                        width: width * 0.20,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: selectedType == 'Home'
                              ? AppColors.lightgreen
                              : Colors.transparent,
                        ),
                        child: const Center(
                          child: Text(
                            'Home',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                    GestureDetector(
                      onTap: () => _updateSelection('Other'),
                      child: ContainerWidget(
                        height: height * 0.055,
                        width: width * 0.20,
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColors.grey),
                          borderRadius: BorderRadius.circular(10),
                          color: selectedType == 'Other'
                              ? AppColors.lightgreen
                              : AppColors.white,
                        ),
                        child: const Center(
                          child: Text(
                            'Other',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                if (selectedType == 'Other')
                  CustomTextFormField(
                    controller: addresdetail,
                    onSaved: (value) => addressDetail = value,
                    bordercolor: AppColors.lightGrey,
                    hintText: "Eg.John's home, Mom's place, etc",
                  ),
                SizedBox(
                  height: height * 0.05,
                ),
                Center(
                  child: RoundButtonWidget(
                    buttonColor: AppColors.lightgreen,
                    title: 'Save and Process',
                    onpress: () {
                      submitAddress();

                      ///------------------------bank detail start---------------------------////
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

////-------------------alert dialoge box widget-------------------////
void _showBookingSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Booking Successful'),
        content: const Text('Your booking has been processed successfully.'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              // Navigator.of(context).pop();
              Navigator.pushNamedAndRemoveUntil(
                  context, 'navbar', (route) => false);
              // Close the dialog
              // Navigate to the home screen, replace `HomeScreen` with your home screen widget
            },
          ),
        ],
      );
    },
  );
}
