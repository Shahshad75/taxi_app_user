import 'dart:async';

import 'package:bloc/bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<VehicleTypeSetEvnet>(vehicleTypeSetEvnet);
    on<SelectCarEvent>(selectCarEvent);
    on<ConfirmDriveEvent>(confirmDriveEvent);
    on<SelectVehicleTypeEvent>(selectVehicleTypeEvent);
  }

  FutureOr<void> vehicleTypeSetEvnet(
      VehicleTypeSetEvnet event, Emitter<HomeState> emit) {
    emit(VehicleTypeSetState());
  }

  FutureOr<void> selectCarEvent(SelectCarEvent event, Emitter<HomeState> emit) {
    emit(SelectCarState());
  }

  FutureOr<void> confirmDriveEvent(
      ConfirmDriveEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> selectVehicleTypeEvent(
      SelectVehicleTypeEvent event, Emitter<HomeState> emit) {
    emit(SelectVehicleTypeState(vehicleType: event.vehicleType));
  }
}
