import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:service_app/Auth/login_screen.dart';
import 'package:service_app/Controller/cart_controller.dart';
import 'package:service_app/Screens/Navigation/bottom_navbar.dart';
import 'package:service_app/Constants/app_colors.dart';
import 'package:service_app/splash_screen.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CartController())
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          primaryTextTheme:
              GoogleFonts.poppinsTextTheme(Theme.of(context).primaryTextTheme),
          appBarTheme:
              AppBarTheme(backgroundColor: AppColors.white, centerTitle: true),
          scaffoldBackgroundColor: AppColors.white),
      routes: {
        'navbar': (context) => const BottomNavbar(),
        '/login': (context) => const LoginScreen(),
      },
      home: const SplashScreen(),
    );
  }
}
