import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/search_screen.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 23,
                    backgroundColor: const Color.fromARGB(255, 213, 178, 72),
                    child: CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 255, 216, 97),
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SearchScreen(),
                          ));
                        },
                        icon: const Icon(
                          CupertinoIcons.search,
                          color: Color.fromARGB(255, 63, 63, 63),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
