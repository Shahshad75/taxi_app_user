part of 'home_bloc.dart';

abstract class HomeEvent {}

final class VehicleTypeSetEvnet extends HomeEvent {
  final double piclat;
  final double piclong;
  final double endlat;
  final double endlong;
  VehicleTypeSetEvnet({
   required this.piclat,
   required this.piclong,
   required this.endlat,
  required  this.endlong,
  });
}

final class SelectCarEvent extends HomeEvent {
  Driver driver;
  SelectCarEvent({required this.driver});
}

final class ConfirmDriveEvent extends HomeEvent {
  Driver driver;
  ConfirmDriveEvent({required this.driver});
}

final class SelectVehicleTypeEvent extends HomeEvent {
  String vehicleType;
  SelectVehicleTypeEvent({required this.vehicleType});
}
