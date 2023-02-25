
import 'dart:convert';

import 'package:http/http.dart';
import 'package:moovbe/model/DriverListModel.dart';
import 'package:moovbe/model/DriverdltModel.dart';
import 'package:moovbe/repository/api/Api_Cleint.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DriverListApi {
  ApiClient apiClient = ApiClient();
  Future<DriverListModel> getDrivers() async {
    final preference = await SharedPreferences.getInstance();
    String basePath = "DriverApi/${preference.getString('userid')}/";
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
    print(response.body);
    return DriverListModel.fromJson(jsonDecode(response.body));
  }
  Future<DeleteDriverModel> PostDriverAdd({
    required String name,
    required String licenseNo,
    required String mobile,
  }) async {
    final preference = await SharedPreferences.getInstance();
    String basePath = "DriverApi/${preference.getString('userid')}/";
    var body = {
      "name": name,
      "license_no": licenseNo,
      "mobile": mobile,
    };
    print(body);
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "POST_", body: body);
    print(response.body);
    return DeleteDriverModel.fromJson(jsonDecode(response.body));
  }
  Future<DeleteDriverModel> dltDriver({required String driverId}) async {
    final preference = await SharedPreferences.getInstance();
    String basePath = "DriverApi/${preference.getString('userid')}/";
    var body = {
      "driver_id": driverId,
    };
    Response response =
    await apiClient.invokeAPI(path: basePath, method: "DELETE", body: body);
    print(response.body);
    return DeleteDriverModel.fromJson(jsonDecode(response.body));
  }
}
