import 'dart:convert';

import 'package:http/http.dart';
import 'package:moovbe/repository/api/Api_Cleint.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/LoginModel.dart';

class ApiLogin {
  ApiClient apiClient = ApiClient();
  LoginModel loginmodel = LoginModel();

  final String loginPath = "LoginApi";
  Future<LoginModel> getLogin({required Email, required password}) async {
   Map body = {
      "username": Email,
      "password": password,
    };
    print(body);

    print("getlogin....");
    Response response = await apiClient.invokeAPI(
        path: loginPath, method: "POST_", body:body);

    print("response worked");
    return LoginModel.fromJson(json.decode(response.body));
  }
}
