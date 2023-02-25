part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}
class FetchLogin extends LoginEvent {
  String Email;
  String password;
  FetchLogin({required this.Email, required this.password});
}