part of 'home_bloc.dart';

abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeActionState extends HomeState {}

final class ConfirmDriveState extends HomeActionState {}

final class VehicleTypeSetState extends HomeActionState {}

final class SelectCarState extends HomeActionState {}

final class SelectVehicleTypeState extends HomeState {
  String vehicleType;
  SelectVehicleTypeState({required this.vehicleType});
}
