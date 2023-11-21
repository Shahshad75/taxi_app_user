part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeActionState extends HomeState {}

final class ConfirmDriveState extends HomeActionState {}

final class VehicleTypeSetState extends HomeActionState {
  List drivers = [];
  VehicleTypeSetState({required this.drivers});
}

final class SelectCarState extends HomeActionState {
  Driver driver;
  SelectCarState({required this.driver});
}

final class SelectVehicleTypeState extends HomeState {
  String vehicleType;
  SelectVehicleTypeState({required this.vehicleType});
}
