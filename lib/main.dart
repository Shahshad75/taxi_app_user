import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:taxi_app_user/presentation/screens/welcome_screens/swipe_screen.dart';

void main(List<String> args) {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Swipepage(),
      ),
    );
  }
}
