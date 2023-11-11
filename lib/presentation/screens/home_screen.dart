import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:taxi_app_user/presentation/widget/home_widget.dart/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          FlutterMap(
            options: const MapOptions(
              initialCenter: LatLng(51.509364, -0.128928),
              initialZoom: 7,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/shahshad7558/clos7mqx000q301pr8cu0hv1q/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow',
                additionalOptions: const {
                  "accessToken":
                      'pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow',
                  "id": "mapbox.mapbox-streets-v8"
                },
              ),
            ],
          ),
          const HomeAppbar(),
        ],
      ),
    ));
  }
}
