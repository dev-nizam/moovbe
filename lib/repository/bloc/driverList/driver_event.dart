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
  String licenseNo;
  String mobile;
  FetchDreiverAdd({required this.name,required this.licenseNo,required this.mobile});
}