import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:taxi_app_user/presentation/bloc/home_bloc/home_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/map_box_bloc/mapbox_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/profile_bloc/profile_bloc.dart';
import 'package:taxi_app_user/presentation/screens/splash_screen.dart';
import 'package:taxi_app_user/service/sharedpref.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Sharedpref.instence.initeStorage();
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(
          create: (context) => MapboxBloc(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
