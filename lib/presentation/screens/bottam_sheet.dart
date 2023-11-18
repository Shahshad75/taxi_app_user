// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:taxi_app_user/presentation/screens/booking_screen.dart';
import 'package:taxi_app_user/presentation/screens/home_screen.dart';
import 'package:taxi_app_user/presentation/screens/payment_screen.dart';
import 'package:taxi_app_user/presentation/screens/profile_screen.dart';

class CustomBottamSheet extends StatefulWidget {
  const CustomBottamSheet({super.key});

  @override
  _CustomBottamSheetState createState() => _CustomBottamSheetState();
}

class _CustomBottamSheetState extends State<CustomBottamSheet> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children:const [
          HomeScreen(),
          BookingScreen(),
          PaymentScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.animateToPage(
              index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.linear,
            );
          });
        },
        items: [
          SalomonBottomBarItem(
              icon: const Icon(
                CupertinoIcons.home,
                color: Colors.grey,
              ),
              title: const Text(
                "Home",
                style: TextStyle(fontFamily: 'Urbanist'),
              ),
              selectedColor: Color.fromARGB(255, 240, 187, 30)),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.collections,
              color: Colors.grey,
            ),
            title: const Text(
              "Bookings",
              style: TextStyle(fontFamily: 'Urbanist'),
            ),
            selectedColor: Colors.green,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.creditcard,
              color: Colors.grey,
            ),
            title: const Text(
              "Payments",
              style: TextStyle(fontFamily: 'Urbanist'),
            ),
            selectedColor: Colors.orange,
          ),
          SalomonBottomBarItem(
            icon: const Icon(
              CupertinoIcons.person,
              color: Colors.grey,
            ),
            title: const Text(
              "Profile",
              style: TextStyle(fontFamily: 'Urbanist'),
            ),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
