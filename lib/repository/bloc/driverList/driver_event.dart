part of 'driver_bloc.dart';

@immutable
abstract class DriverEvent {}
class FetchDreiverGet extends DriverEvent {
  FetchDreiverGet();
}
class FetchDreiverdlt extends DriverEvent {
  String driverId;
  FetchDreiverdlt({required this.driverId});
}
class FetchDreiverAdd extends DriverEvent {
  String name;
  String mobile;
  String licenseNo;
  FetchDreiverAdd({required this.name,required this.mobile,required this.licenseNo});
}