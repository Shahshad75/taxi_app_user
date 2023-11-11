import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app_user/presentation/screens/bottam_sheet.dart';
import 'package:taxi_app_user/presentation/widget/search_widgets.dart/search_bar.dart';
import 'package:taxi_app_user/utils/app_text_styles.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../widget/common/custom_bottamsheet.dart';

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
            const LocationPickerBar(),
            Expanded(
              child: SizedBox(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      // ListTile(
                      //   leading: Icon(CupertinoIcons.star_fill),
                      //   title: Text('Saved places'),
                      // ),
                      ListTile(
                        onTap: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(
                            builder: (context) => const BottamSheet(),
                          ));
                          showModalBottomSheet(
                            
                            context: context,
                            builder: (context) =>  BottomSheetContent(),
                          );
                        },
                        leading: const Icon(CupertinoIcons.location_solid),
                        title: const Text(
                          'Current Location',
                          style: CustomTextStyle.buttonTextStyle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MapBoxHelper {
  static const accessToken =
      'pk.eyJ1IjoiZGlsc2hhZDEwMSIsImEiOiJjbG9vbXYxdHUwMXBnMmlsOWZmNWtxOGJ5In0.0El5XcobqzmmoFEe6MmYPQ';

  static const mapId = "mapbox.mapbox-streets-v8";

  static const urlTemplate =
      'https://api.mapbox.com/styles/v1/dilshad101/cloond0c300hj01qm7lcsd3nm/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiZGlsc2hhZDEwMSIsImEiOiJjbG9vbXYxdHUwMXBnMmlsOWZmNWtxOGJ5In0.0El5XcobqzmmoFEe6MmYPQ';

  static getSearchResults(String query) async {
    const String apiKey = accessToken;
    final String endpoint =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$query.json';

    final response =
        await http.get(Uri.parse('$endpoint?access_token=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final features = data['features'];

      if (features.isNotEmpty) {
        final results = features.map((feature) {
          final placeName = feature['place_name'];
          final coordinates = feature['geometry']['coordinates'];
          final latitude = coordinates[1];
          final longitude = coordinates[0];

          return {
            'placeName': placeName,
            'latitude': latitude,
            'longitude': longitude,
          };
        }).toList();
        print(results);
        return results;
      }
    }

    return [];
  }

  Future<String?> getPlaceName(double latitude, double longitude) async {
    const String apiKey = accessToken;
    final String endpoint =
        'https://api.mapbox.com/geocoding/v5/mapbox.places/$longitude,$latitude.json';
    http.Response response;
    try {
      response = await http.get(Uri.parse('$endpoint?access_token=$apiKey'));
    } catch (e) {
      return null;
    }

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final features = data['features'];

      if (features.isNotEmpty) {
        return features[0]['place_name'];
      }
    }

    return null;
  }
}
