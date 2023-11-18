part of 'home_bloc.dart';

abstract class HomeEvent {}

final class VehicleTypeSetEvnet extends HomeEvent {}

final class SelectCarEvent extends HomeEvent {}

final class ConfirmDriveEvent extends HomeEvent {}

final class SelectVehicleTypeEvent extends HomeEvent {
  String vehicleType;
  SelectVehicleTypeEvent({required this.vehicleType});
}
