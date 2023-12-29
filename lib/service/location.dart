// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:taxi_app_user/bloc/map_box_bloc/mapbox_bloc.dart';

class CurrentLocation {
  static Future<void> getCurrentLocation(BuildContext context) async {
    Position? currentPosition;
    String? currentAddress;
    await requestLocationPermission();

    try {
      currentPosition = await getCurrentPosition();
      currentAddress = await getAddressFromCoordinates(currentPosition);
      context.read<MapboxBloc>().add(LocationSelectedEvent(
          lant: currentPosition.latitude,
          long: currentPosition.longitude,
          location: currentAddress));
    } catch (e) {
      currentAddress = 'Error fetching location';
    }
  }

  static Future<void> requestLocationPermission() async {
    var status = await Geolocator.checkPermission();
    if (status == LocationPermission.denied) {
      await Geolocator.requestPermission();
    }
  }

  static Future<Position> getCurrentPosition() async {
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  static Future<String> getAddressFromCoordinates(Position position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];

        return '${placemark.street}, ${placemark.locality}, ${placemark.country}';
      } else {
        return 'Address not found';
      }
    } catch (e) {
      return 'Error getting address';
    }
  }
}
