import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:service_app/Auth/login_screen.dart';
import 'package:service_app/Controller/auth_controller.dart';
import 'package:service_app/Widgets/round_button_widget.dart';
import 'package:service_app/Widgets/text_widgets.dart';

import '../Constants/App_colors.dart';
import '../Widgets/custom_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController controller = TextEditingController();
  final String initialCountry = 'AE';
  PhoneNumber number = PhoneNumber(isoCode: 'AE', dialCode: 'AE');

  String selectedTitle = 'Title';
  TextEditingController nameController = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  bool? ischeked = false;

  AuthController authController = AuthController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.lightgreen,
          title: LargeText(
            text: 'Sign Up',
            color: AppColors.white,
          )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                SmallText(
                  text:
                      "Complete your profile, it's complusory for future reference, you won't be able to book experience our amazing service!",
                  color: AppColors.grey,
                ),
                SizedBox(height: height * .02),
                Container(
                  height: height * .08,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        // Handle phone number changes
                      },
                      onInputValidated: (bool value) {
                        // Handle phone number validation
                      },
                      selectorConfig: const SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: const TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phoneNumbercontroller,
                      formatInput: true,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      inputDecoration: InputDecoration(
                        hintStyle: const TextStyle(fontSize: 13),
                        hintText: 'Phone Number',
                        filled: true,
                        fillColor: AppColors.lightGrey,
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: AppColors.lightGrey, width: 1.2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(
                              bottomRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: AppColors.lightGrey, width: 1.2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8)),
                          borderSide: BorderSide(
                              color: AppColors.lightGrey, width: 1.2),
                        ),
                      ),
                      selectorButtonOnErrorPadding: 10.0,
                      onSaved: (PhoneNumber number) {
                        // Handle phone number save
                      },
                    ),
                  ),
                ),
                SizedBox(height: height * .02),
                Container(
                  height: height * .06, // Adjust the height as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.lightGrey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                            icon: const Icon(
                              Icons.keyboard_arrow_down_outlined,
                            ),
                            value: selectedTitle,
                            items: [
                              'Title',
                              'Mr.',
                              'Mrs.',
                              'Miss',
                              'Dr.',
                            ]
                                .map((title) => DropdownMenuItem<String>(
                                      value: title,
                                      child: Text(title),
                                    ))
                                .toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedTitle = newValue!;
                              });
                            },
                            underline: Container()),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: width * .600,
                          height: height * 0.07,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              hintStyle: const TextStyle(fontSize: 13),
                              hintText: 'Enter Name',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                    color: AppColors.lightGrey, width: 1.2),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                    color: AppColors.lightGrey, width: 1.2),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                borderSide: BorderSide(
                                    color: AppColors.lightGrey, width: 1.2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: height * .02),
                CustomTextFormField(
                  prefixIcon: Icons.email,
                  controller: emailcontroller,
                  labelText: 'E-mail',
                  hintText: 'Enter E-mail',
                ),
                SizedBox(height: height * .03),
                CustomTextFormField(
                  prefixIcon: Icons.lock,
                  controller: passwordcontroller,
                  labelText: 'Password',
                  hintText: 'Password',
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  children: [
                    Checkbox(
                        activeColor: Colors.blue,
                        value: ischeked,
                        onChanged: (newbool) {
                          setState(() {
                            ischeked = newbool;
                          });
                        }),
                    const Text(
                        'send me promotion messages and \nemails with deals and  discounts')
                  ],
                ),
                SizedBox(
                  height: height * .20,
                ),
                RoundButtonWidget(
                  loading: loading, // Loading indicator
                  title: 'Get Verification Code',
                  buttonColor: AppColors.lightgreen,
                  onpress: () async {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        loading = true; // Show loading indicator
                      });

                      await authController.signUp(
                        nameController.text,
                        emailcontroller.text,
                        phoneNumbercontroller.text,
                        passwordcontroller.text,
                        context,
                      );

                      setState(() {
                        loading = false; // Hide loading indicator after sign-up
                      });
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColors.blue),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
