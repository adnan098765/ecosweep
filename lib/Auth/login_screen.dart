import 'package:flutter/material.dart';
import 'package:service_app/Auth/signup_screen.dart';
import 'package:service_app/Controller/auth_controller.dart';
import 'package:service_app/Widgets/text_widgets.dart';
import 'package:service_app/widgets/round_button_widget.dart';
import '../Constants/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isPasswordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.lightgreen,
        title: LargeText(
          text: 'Log In',
          color: AppColors.white,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: height * 0.035),
                const Text(
                  'Eco Sweeps is now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: height * 0.015),
                Container(
                  height: height * .13,
                  width: width * .45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      image: AssetImage('assets/logo.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.02),
                const Text(
                  'Your Home Services here',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
               
                SizedBox(height: height * 0.04),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.email),
                    labelText: 'E-mail',
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.04),
                TextFormField(
                  controller: passwordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                    labelText: 'Password',
                    border: const OutlineInputBorder(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: height * 0.10),
                RoundButtonWidget(
                  loading: isLoading,
                  title: 'Login',
                  onpress: () async {
                    if (formKey.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      try {
                        await AuthController().signIn(
                          emailController.text,
                          passwordController.text,
                          context,
                        );
                      } finally {
                        setState(() {
                          isLoading = false;
                        });
                      }
                    }
                  },
                  buttonColor: AppColors.lightgreen,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: Text(
                        'Signup',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
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
