import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/widget/common/button.dart';
import 'package:taxi_app_user/presentation/widget/common/dropdown_button.dart';
import 'package:taxi_app_user/presentation/widget/common/textfield.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';

class BottomSheetContent extends StatelessWidget {
  BottomSheetContent({super.key});
  final List<String> seats = ["4 Seats", "5 Seates", "6 Seats"];
  final List<String> type = [
    "Sedan",
    "SUV (Sport Utility Vehicle)",
    "Hatchback"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Set your pick-up location',
            style: TextStyle(
                color: Color.fromARGB(255, 90, 90, 90),
                fontWeight: FontWeight.bold,
                fontSize: 19.0,
                fontFamily: 'Urbanist'),
          ),
          const Divider(
            thickness: 1,
            height: 30,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(CupertinoIcons.location),
                  title: Text(
                    "Kochi Airport Bus Terminal",
                    style: CustomTextStyle.buttonTextStyle,
                  ),
                  subtitle: Text('Drop-off'),
                ),
                CustomTextfield(
                    hintText: 'Vehicle type',
                    readOnly: true,
                    suffixIcon: CustomDropDownButton(
                      item: type,
                      onChanged: (String? value) {
                        print(value);
                      },
                    )),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: CustomButton(
                    text: "Continue",
                    onTap: () {},
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
