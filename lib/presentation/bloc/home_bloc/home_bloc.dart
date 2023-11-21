import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:taxi_app_user/service/drivers_model.dart';
import 'package:taxi_app_user/service/repository.dart';

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
      VehicleTypeSetEvnet event, Emitter<HomeState> emit) async {
    List drivers = await Repo.booking(event.piclat,event.piclong,event.endlat,event.endlong);
    
    emit(VehicleTypeSetState(drivers: drivers));
  }

  FutureOr<void> selectCarEvent(SelectCarEvent event, Emitter<HomeState> emit) {
    emit(SelectCarState(driver:event.driver));
  }

  FutureOr<void> confirmDriveEvent(
      ConfirmDriveEvent event, Emitter<HomeState> emit) {}

  FutureOr<void> selectVehicleTypeEvent(
      SelectVehicleTypeEvent event, Emitter<HomeState> emit) {
    emit(SelectVehicleTypeState(vehicleType: event.vehicleType));
  }
}
