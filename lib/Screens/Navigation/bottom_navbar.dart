import 'package:flutter/material.dart';
import 'package:service_app/Screens/Navigation/account_screen.dart';
import 'package:service_app/Screens/Navigation/booking_screen.dart';
import 'package:service_app/Screens/Navigation/home_screen.dart';
import '../../Constants/App_colors.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List screens = [
    const HomeScreen(),
    const BookingScreen(),
    const AccountScreen(),
    // const RewardsScreen(),
    // const NativeScreen(),
  ];
  int myIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        selectedItemColor: AppColors.black,
        unselectedItemColor: AppColors.grey,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'UC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit_document),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          // BottomNavigationBarItem(icon: Icon(Icons.wallet), label: 'Rewards'),
          // BottomNavigationBarItem(icon: Icon(Icons.house), label: 'Native'),
        ],
      ),
      body: screens[myIndex],
    );
  }
}
