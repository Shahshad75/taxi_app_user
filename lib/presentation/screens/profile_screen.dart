// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/login_screen.dart';
import 'package:taxi_app_user/presentation/screens/privacy_policy_screen.dart';
import 'package:taxi_app_user/presentation/screens/terms_condition_screen.dart';
import 'package:taxi_app_user/service/sharedpref.dart';
import 'package:taxi_app_user/service/user.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * .35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  user!.fullname,
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: "urbanist"),
                ),
                Text(
                  user!.phonenumber.toLowerCase(),
                  style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: "urbanist"),
                )
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PrivacyPolicy()));
            },
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.lock),
            ),
            title: const Text(
              "Privacy policy",
              style: CustomTextStyle.buttonTextStyle,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const TermsConditionScreen()));
            },
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.info_outline),
            ),
            title: const Text(
              "Terms & Conditions",
              style: CustomTextStyle.buttonTextStyle,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
            ),
          ),
          ListTile(
            onTap: () async {
              await Sharedpref.instence.signout();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            leading: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.login,
                color: Colors.red,
              ),
            ),
            title: const Text("LogOut",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Urbanist",
                    color: Colors.red)),
            trailing: const Icon(
              Icons.arrow_forward_ios_sharp,
              size: 18,
              color: Colors.red,
            ),
          )
        ],
      ),
    ));
  }
}
