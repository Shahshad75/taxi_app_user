// ignore_for_file: use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/screens/bottam_sheet.dart';
import 'package:taxi_app_user/widget/avathar_picker.dart';
import 'package:taxi_app_user/widget/common/appbar.dart';
import 'package:taxi_app_user/widget/common/button.dart';
import 'package:taxi_app_user/widget/common/date_picker.dart';
import 'package:taxi_app_user/widget/common/number_field.dart';
import 'package:taxi_app_user/widget/common/textfield.dart';
import 'package:taxi_app_user/service/firebase.dart';
import 'package:taxi_app_user/service/repository.dart';
import 'package:taxi_app_user/service/sharedpref.dart';
import 'package:taxi_app_user/service/user.dart';
import '../../bloc/profile_bloc/profile_bloc.dart';

class ProfileIndroScreen extends StatelessWidget {
  ProfileIndroScreen({super.key});
  final datebirthController = TextEditingController();
  final genderController = TextEditingController();
  final fullNamgeController = TextEditingController();
  final nickNameController = TextEditingController();
  final phonNumberController = TextEditingController();
  final DatePickerFun datePickerFun = DatePickerFun();
  final List<String> items = ['None', 'Male', 'Female'];
  final String selectGender = 'None';
  String imageUrl = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(0, 60), child: CustomAppbar()),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
        child: ListView(
          children: [
            const ProfileAvathar(),
            CustomTextfield(
              hintText: 'Full name',
              controller: fullNamgeController,
            ),
            CustomTextfield(
              hintText: 'Nick name',
              controller: nickNameController,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is DatePickedState) {
                  datebirthController.text = state.pickedDate;
                }
                return CustomTextfield(
                  readOnly: true,
                  hintText: 'Date birth',
                  controller: datebirthController,
                  suffixIcon: IconButton(
                      onPressed: () {
                        datePickerFun.getTimeFromUser(context);
                      },
                      icon: const Icon(
                        Icons.date_range,
                        color: Colors.grey,
                      )),
                );
              },
            ),
            NumberField(controller: phonNumberController),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is GenderPickState) {
                  genderController.text = state.selectGender;
                }
                return CustomTextfield(
                    readOnly: true,
                    controller: genderController,
                    hintText: 'Gender',
                    suffixIcon: Padding(
                      padding: const EdgeInsets.only(top: 15, right: 15),
                      child: DropdownButton(
                        isDense: true,
                        icon: const Icon(Icons.arrow_drop_down),
                        iconDisabledColor:
                            const Color.fromARGB(252, 103, 103, 103),
                        items:
                            items.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value.toString(),
                            child: Text(value.toString()),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          context
                              .read<ProfileBloc>()
                              .add(GenderPickEvent(selectGender: newValue!));
                        },
                      ),
                    ));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is SucessfullyPicimageEvent) {
                    imageUrl = state.imagePath;
                  }
                  return CustomButton(
                    text: "Continue",
                    onTap: () async {
                      if (fullNamgeController.text.isNotEmpty &&
                          nickNameController.text.isNotEmpty &&
                          datebirthController.text.isNotEmpty) {
                        Map? userAuth = Sharedpref.instence.getAuthDetails();
                        User user = User(
                            fullname: fullNamgeController.text,
                            birthdate: datebirthController.text,
                            email: userAuth!['email'],
                            password: userAuth['password'],
                            phonenumber: phonNumberController.text,
                            gender: genderController.text,
                            image: imageUrl);
                        int? id = await Repo.userSignUp(user);
                        if (id != null) {
                          await Sharedpref.instence.addUserId(id);
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const CustomBottamSheet(),
                          ));
                          await FirebaseHelper.getFirebaseMessagingToken();
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                backgroundColor:
                                    Color.fromARGB(255, 255, 87, 58),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.all(10),
                                content: Text(
                                  'Fill all colums',
                                )));
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
