import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:service_app/Controller/auth_controller.dart';
import '../../Utils/shared_prefrence_data.dart';



class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  // ignore: non_constant_identifier_names
  bool switch_value = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'Settings',
            style: TextStyle(color: Colors.white),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: Colors.green,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                const Text(
                  'Updates on Whatsapp',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Switch(
                    value: switch_value,
                    onChanged: (newBool) {
                      setState(() {
                        switch_value = newBool;
                      });
                    })
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            InkWell(
              onTap: () async {
                int userid = await SharedPrefrenceData.getUserId();
                AuthController().deleteAccount(userid, context);
              },
              child: Row(
                children: [
                  const Icon(Icons.delete),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Text('Delete Account',
                      style: TextStyle(fontWeight: FontWeight.w700))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
