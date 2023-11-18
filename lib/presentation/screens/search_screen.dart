import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taxi_app_user/presentation/bloc/map_box_bloc/mapbox_bloc.dart';
import 'package:taxi_app_user/presentation/widget/search_widgets.dart/search_bar.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size(0, 50),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.white,
            elevation: 0,
          )),
      body: SafeArea(
        child: Column(
          children: [
            LocationPickerBar(),
            Expanded(
              child: SizedBox(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: BlocBuilder<MapboxBloc, MapboxState>(
                      builder: (context, state) {
                        List placeses = [];
                        if (state is PickupLocationState) {
                          placeses = state.placeses;
                        } else if (state is EndLocationState) {
                          placeses = state.placeses;
                        }
                        return ListView.builder(
                          itemCount: placeses.length,
                          itemBuilder: (context, index) {
                            var placename = placeses[index]['placeName'];
                            return ListTile(
                              onTap: () {
                                if (state is EndLocationState) {
                                  context.read<MapboxBloc>().add(
                                      EndLocationEvent(location: placename));
                                } else if (state is PickupLocationState) {
                                  context.read<MapboxBloc>().add(
                                      LocationSelectedEvent(
                                          location: placename));
                                }
                              },
                              title: Text(
                                placename.toString(),
                                overflow: null,
                                maxLines: 1,
                              ),
                              subtitle: Text(placename.toString()),
                            );
                          },
                        );
                      },
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
