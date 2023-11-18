import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/map_box_bloc/mapbox_bloc.dart';
import '../common/textfield.dart';

class LocationPickerBar extends StatelessWidget {
  LocationPickerBar({super.key});
  final picupLocation = TextEditingController();
  final endLoaction = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Column(
        children: [
          Row(
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
                  padding:
                      const EdgeInsets.only(right: 20, top: 15, bottom: 10),
                  child: SizedBox(
                    child: Column(
                      children: [
                        BlocBuilder<MapboxBloc, MapboxState>(
                          builder: (context, state) {
                            if (state is SelectPicLocationState) {
                              picupLocation.text = state.location;
                            }
                            return CustomTextfield(
                              controller: picupLocation,
                              hintText: 'Pickup Location',
                              onChanged: (value) async {
                                context
                                    .read<MapboxBloc>()
                                    .add(SearchPickEevent(value: value));
                              },
                            );
                          },
                        ),
                        BlocBuilder<MapboxBloc, MapboxState>(
                          builder: (context, state) {
                            if (state is SelectEndLocationState) {
                              endLoaction.text = state.location;
                            }
                            return CustomTextfield(
                              controller: endLoaction,
                              hintText: 'Where to?',
                              onChanged: (value) async {
                                context
                                    .read<MapboxBloc>()
                                    .add(SearchEndEevent(value: value));
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          ElevatedButton(onPressed: () {
            if(picupLocation.text.trim().isNotEmpty&&endLoaction.text.isNotEmpty){
              
            }
          }, child: const Text('Confirm'))
        ],
      ),
    );
  }
}
