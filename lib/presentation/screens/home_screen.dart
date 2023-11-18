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
            mapController: MapController(),
            options: MapOptions(
              backgroundColor: Colors.black,
              onPointerHover: (event, point) {},
              initialCenter: const LatLng(11.3211795, 75.93474649999999),
              initialZoom: 10,
            ),
            children: [
              TileLayer(
                urlTemplate:
                    'https://api.mapbox.com/styles/v1/shahshad7558/clozgr7qu014v01pbb1daaxxm/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow',
                additionalOptions: const {
                  "accessToken":
                      'pk.eyJ1Ijoic2hhaHNoYWQ3NTU4IiwiYSI6ImNsb3M1cjA5MjEwaXYya2s0czBxYWJpeWgifQ.EHLmEoHUiBZdpMnGsVwAow',
                  "id": "mapbox.mapbox-streets-v8"
                },
                subdomains: const ['a', 'b', 'c'],
              ),
              MarkerLayer(
                
                markers: [
                  Marker(
                    width: 20.0,
                    height: 20.0,
                    point: const LatLng(10.9581, 76.1597),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const HomeAppbar(),
        ],
      ),
    ));
  }
}
