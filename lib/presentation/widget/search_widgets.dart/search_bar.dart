import 'package:flutter/material.dart';

import '../../screens/search_screen.dart';
import '../common/textfield.dart';

class LocationPickerBar extends StatelessWidget {
  const LocationPickerBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Row(
        children: [
          SizedBox(
            width: 70,
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 62, 176, 30),
                  radius: 8,
                ),
                Container(
                  width: 2.0,
                  height: 25.0,
                  color: const Color.fromARGB(255, 199, 199, 199),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                  width: 2.0,
                  height: 40.0,
                  color: const Color.fromARGB(255, 203, 203, 203),
                ),
                const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 208, 197, 45),
                  radius: 8,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 15, bottom: 10),
              child: SizedBox(
                child: Column(
                  children: [
                    CustomTextfield(
                      hintText: "Pickup Location",
                      onChanged: (value) async {
                        await MapBoxHelper.getSearchResults(value);
                      },
                    ),
                    CustomTextfield(
                      hintText: 'Where to?',
                      onChanged: (value) async {
                        await MapBoxHelper.getSearchResults(value);
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}