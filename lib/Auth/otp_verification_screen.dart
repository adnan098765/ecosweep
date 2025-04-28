import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:service_app/Controller/auth_controller.dart';
import 'package:service_app/Widgets/round_button_widget.dart';
import '../Constants/App_colors.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final otpFieldController = OtpFieldController();
  String? otpPin;
  //  final FocusNode focusNode;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verification Code'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Please enter the 6-digit code sent on E-mail'),
              const SizedBox(height: 10),
              SizedBox(height: height * 0.02),
              OTPTextField(
                controller: otpFieldController,
                length: 6,
                width: MediaQuery.of(context).size.width,
                fieldWidth: 50,
                style: const TextStyle(fontSize: 17),
                textFieldAlignment: MainAxisAlignment.spaceAround,
                fieldStyle: FieldStyle.underline,
                onCompleted: (pin) {
                  otpPin = pin;
                  setState(() {});
                },
              ),
              SizedBox(height: height * 0.4),
              Center(
                  child: RoundButtonWidget(
                title: 'Go to Login',
                onpress: () {
                  AuthController().signUpwithCode(otpPin!, context);
                },
                buttonColor: AppColors.lightgreen,
              )),
              // ElevatedButton(
              //     onPressed: () {

              //     },
              //     child: const Text('login'))
            ],
          ),
        ),
      ),
    );
  }
}
