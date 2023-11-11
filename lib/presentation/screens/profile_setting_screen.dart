import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/screens/bottam_sheet.dart';
import 'package:taxi_app_user/presentation/widget/avathar_picker.dart';
import 'package:taxi_app_user/presentation/widget/common/appbar.dart';
import 'package:taxi_app_user/presentation/widget/common/button.dart';
import 'package:taxi_app_user/presentation/widget/common/date_picker.dart';
import 'package:taxi_app_user/presentation/widget/common/number_field.dart';
import 'package:taxi_app_user/presentation/widget/common/textfield.dart';

import '../bloc/profile_bloc/profile_bloc.dart';

class ProfileIndroScreen extends StatelessWidget {
  ProfileIndroScreen({super.key});
  final datebirthController = TextEditingController();
  final genderController = TextEditingController();
  final DatePickerFun datePickerFun = DatePickerFun();
  final List<String> items = ['None', 'Male', 'Female'];
  final String selectGender = 'None';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size(0, 60), child: CustomAppbar()),
      body: SafeArea(
          child: ListView(
        children: [
          const ProfileAvathar(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const CustomTextfield(hintText: 'Full name'),
                const CustomTextfield(hintText: 'Nick name'),
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
                const CustomTextfield(
                  hintText: 'shahshad@gmail.com',
                  keyboardType: TextInputType.emailAddress,
                ),
                const NumberField(),
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
                            items: items
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value.toString(),
                                child: Text(value.toString()),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              context.read<ProfileBloc>().add(
                                  GenderPickEvent(selectGender: newValue!));
                            },
                          ),
                        ));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: CustomButton(
                    text: "Continue",
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const BottamSheet(),
                      ));
                    },
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
