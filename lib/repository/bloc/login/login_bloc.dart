import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moovbe/model/LoginModel.dart';
import 'package:moovbe/repository/api/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  late LoginModel loginModel;
  ApiLogin apiLogin= ApiLogin();
  LoginBloc() : super(LoginInitial()) {
    on<FetchLogin>((event, emit)async {
      final preference = await SharedPreferences.getInstance();
      // TODO: implement event handler
      print("loading....");
      emit(LoginLoading());
      try {
        loginModel = await apiLogin.getLogin(Email: event.Email, password:event.password
        );
        print("loaded.....");
         preference.setString('token',loginModel.access.toString() );
        preference.setString('userid',loginModel.urlId.toString() );
        if(loginModel.status!){
          emit(LoginLoaded());
        }
        else{
          emit(LoginError());
        }
      } catch (e) {
        print("***********$e");
        emit(LoginError());
      }
    });
  }
}
