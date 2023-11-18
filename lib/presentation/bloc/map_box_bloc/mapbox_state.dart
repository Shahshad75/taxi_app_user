part of 'mapbox_bloc.dart';

abstract class MapboxState {}

final class MapboxInitial extends MapboxState {}

final class PickupLocationState extends MapboxState {
  List placeses;
  PickupLocationState({required this.placeses});
}

final class SelectPicLocationState extends MapboxState {
  String location;
  SelectPicLocationState({required this.location});
}

final class EndLocationState extends MapboxState {
  List placeses;
  EndLocationState({required this.placeses});
}

final class SelectEndLocationState extends MapboxState {
  String location;
  SelectEndLocationState({required this.location});
}
