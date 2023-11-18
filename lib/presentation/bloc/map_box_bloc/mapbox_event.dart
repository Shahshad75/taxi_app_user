part of 'mapbox_bloc.dart';

abstract class MapboxEvent {}

final class SearchPickEevent extends MapboxEvent {
  String value;
  SearchPickEevent({required this.value});
}

final class LocationSelectedEvent extends MapboxEvent {
  String location;
  LocationSelectedEvent({required this.location});
}
final class SearchEndEevent extends MapboxEvent {
  String value;
  SearchEndEevent({required this.value});
}

final class EndLocationEvent extends MapboxEvent {
  String location;
  EndLocationEvent({required this.location});
}
