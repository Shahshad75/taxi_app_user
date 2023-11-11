import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:taxi_app_user/presentation/screens/profile_setting_screen.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';

import '../widget/common/button.dart';
import '../widget/common/textfield.dart';
import '../widget/rich_text.dart';

class SingupScreen extends StatelessWidget {
  const SingupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
                child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 250,
                      height: 300,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('asset/image/signup.png'))),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 10),
                          child: Text(
                            "Create your\nAccount",
                            style: CustomTextStyle.ultraBoldTextstyle,
                          ),
                        ),
                      ],
                    ),
                    const CustomTextfield(hintText: "Enter Your Email"),
                    const CustomTextfield(hintText: "Enter Your Password"),
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: const Row(
                        children: [
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 183, 183, 183),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              "OR",
                              style: CustomTextStyle.buttonTextStyle,
                            ),
                          ),
                          Expanded(
                            child: Divider(
                              thickness: 1,
                              color: Color.fromARGB(255, 189, 189, 189),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SignInButton(
                      elevation: 0,
                      Buttons.Google,
                      padding: const EdgeInsets.only(left: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(
              width: double.infinity,
              height: 150,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButton(
                        text: "Sign up",
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfileIndroScreen(),
                          ));
                        }),
                    richText(
                        context: context,
                        firstTxt: "Dont have an Account?  ",
                        secondTxt: "Sign-up")
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
