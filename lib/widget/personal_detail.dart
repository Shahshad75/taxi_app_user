import 'package:flutter/material.dart';
import 'package:taxi_app_user/service/user.dart';
import 'package:taxi_app_user/widget/common/textfield.dart';

class PersonDetailTable extends StatefulWidget {
  const PersonDetailTable({super.key, required this.onTap, required this.user});
  final void Function()? onTap;
  final User user;

  @override
  State<PersonDetailTable> createState() => _PersonDetailTableState();
}

class _PersonDetailTableState extends State<PersonDetailTable> {
  final nameController = TextEditingController();

  final numberContoroller = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = widget.user.email;
    numberContoroller.text = widget.user.phonenumber;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(44, 112, 112, 112),
              spreadRadius: 1,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
        ),
        width: double.maxFinite,
        height: MediaQuery.sizeOf(context).height * .28,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).height * .18,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(widget.user.image),
                    // user image
                    radius: 55,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextfield(
                      labelText: "Email",
                      readOnly: true,
                      controller: nameController,
                      hintText: "Full name",
                    ),
                    CustomTextfield(
                      labelText: "Phone Number",
                      readOnly: true,
                      controller: numberContoroller,
                      hintText: "Last name",
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
