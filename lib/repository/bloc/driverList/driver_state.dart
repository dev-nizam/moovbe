part of 'driver_bloc.dart';

@immutable
abstract class DriverState {}

class DriverInitial extends DriverState {}
class DriverLoading extends DriverState {}
class DriverLoaded extends DriverState {}
class DriverError extends DriverState {}
class DriverDltLoading extends DriverState {}
class DriverDltLoaded extends DriverState {}
class DriverDltError extends DriverState {}
class DriverAdded extends DriverState {}
