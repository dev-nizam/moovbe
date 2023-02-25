import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moovbe/model/DriverListModel.dart';
import 'package:moovbe/repository/api/driverList/DriverList.dart';

import '../../../model/DriverdltModel.dart';

part 'driver_event.dart';
part 'driver_state.dart';

class DriverBloc extends Bloc<DriverEvent, DriverState> {
late  DriverListModel driverListModel;
late  DeleteDriverModel deleteDriverModel;
DriverListApi driverListApi=DriverListApi();
  DriverBloc() : super(DriverInitial()) {
    on<FetchDreiverGet>((event, emit) async {
      emit(DriverLoading());
      try {
        driverListModel = await driverListApi.getDrivers();
        emit(DriverLoaded());
      } catch (e) {
        print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
        emit(DriverError());
      }

      // TODO: implement event handler
    });
    // on<FetchDreiverdlt>((event, emit) async {
    //   emit(DriverLoading());
    //   try {
    //     deleteDriverModel = await driverListApi.dltDriver(driverId:event.driverId);
    //     emit(DriverDeleted());
    //   } catch (e) {
    //     print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
    //     emit(DriverError());
    //   }
    //
    //   // TODO: implement event handler
    // });
    // on<FetchDreiverAdd>((event, emit) async {
    //   emit(DriverLoading());
    //   try {
    //     driverListModel = await driverListApi.PostDriverAdd(name: event.name, mobile: event.mobile, licenseNo: event.licenseNo);
    //     emit(DriverAdded());
    //   } catch (e) {
    //     print("Error>>>>>>>>>>>>>>>>>>>>>>>>>" + e.toString());
    //     emit(DriverError());
    //   }
    //
    //   // TODO: implement event handler
    // });
  }
}
