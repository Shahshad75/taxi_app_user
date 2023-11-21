import 'dart:convert';

import 'package:http/http.dart' as http;

class MapBoxHelper {
  static const accessToken =
      'pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow';

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

        return results;
      }
    }

    return [];
  }

  static Future<String?> getPlaceName(double latitude, double longitude) async {
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
      // print("===================$data");
      // print(features);
      if (features.isNotEmpty) {
        return features[0]['place_name'];
      }
    }

    return null;
  }

  static Future<String?> getDirection() async {
    var url =
        'https://api.mapbox.com/directions/v5/mapbox/driving/75.8932343%2C11.1518781%3B75.93474649999999%2C11.3211795?alternatives=false&annotations=distance%2Cduration%2Cspeed&geometries=geojson&language=en&overview=full&steps=true&access_token=pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow';
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    print(response.body);
  }
}
