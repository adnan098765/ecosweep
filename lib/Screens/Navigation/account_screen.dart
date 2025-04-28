import 'package:flutter/material.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:service_app/Controller/auth_controller.dart';
import 'package:service_app/Controller/profile_controller.dart';
import 'package:service_app/Screens/Settings/manage_payment.dart';
import 'package:service_app/Screens/Address/mange_addresses.dart';
import 'package:service_app/Screens/Settings/scheduled_screen.dart';
import 'package:service_app/Screens/Settings/update_profile.dart';
import 'package:service_app/Utils/shared_prefrence_data.dart';
import '../Settings/About_ecs.dart';
import '../Settings/setting_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  ProfileController myController = ProfileController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      body: FutureBuilder(
          future: myController.editprofile(),
          builder: (context, snapData) {
            if (snapData.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SizedBox(
                width: width * 1,
                height: height * 1,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${myController.getMyProfile!.data!.name}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 21),
                              ),
                              Text('${myController.getMyProfile!.data!.email}'),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateProfile(
                                              myProfileModel:
                                                  myController.getMyProfile!,
                                            )));
                              },
                              icon: const Icon(Icons.edit_outlined)),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Card(
                            child: Container(
                              width: width * 0.27,
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Icon(Icons.assignment_outlined),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    const Text('Bookings',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                    const Text('& plans',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            child: Container(
                              width: width * 0.27,
                              height: height * 0.15,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(11),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    const Icon(Icons.headset_mic_outlined),
                                    SizedBox(
                                      height: height * 0.02,
                                    ),
                                    const Text(
                                      'Help &',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const Text('Support',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        child: Row(
                          children: [
                            const Icon(
                              Icons.star_border_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'My rating',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManageAddresses(),
                              ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'Manage addresses',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ManagePayment(),
                              ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.credit_card,
                              size: 18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'Manage payment methods',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SettingScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.settings_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'Settings',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ScheduledScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.assignment_outlined,
                              size: 18,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'Scheduled bookings',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AboutScreen(),
                              ));
                        },
                        child: Row(
                          children: [
                            Container(
                              width: width * 0.045,
                              height: height * 0.02,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(1),
                                border: Border.all(color: Colors.black),
                                shape: BoxShape.rectangle,
                              ),
                              child: const Center(
                                  child: Text(
                                'ECS',
                                style: TextStyle(
                                    fontSize: 8, fontWeight: FontWeight.w500),
                              )),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            const Text(
                              'About ECS',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 16),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () async {
                          AuthController()
                              // ignore: use_build_context_synchronously
                              .logout(await SharedPrefrenceData.getUserId(),
                                  context);

                          ///---------------------------log out button-----------------////
                        },
                        child: Container(
                          width: width * 0.35,
                          height: height * 0.05,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                            border: Border.all(color: Colors.grey, width: 0.2),
                          ),
                          child: const Center(
                              child: Text(
                            'Logout',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Center(
                          child: Text(
                        'Version 7.5.66 R409',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
