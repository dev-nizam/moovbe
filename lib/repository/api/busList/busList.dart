// import 'package:moovbe/repository/api/Api_Cleint.dart';
//
// class BusListApi {
//   ApiClient apiClient = ApiClient();
//   Future<DriverListModel> getDrivers() async {
//     final preference = await SharedPreferences.getInstance();
//     String basePath = "DriverApi/${preference.getString('userid')}/";
//     Response response =
//     await apiClient.invokeAPI(path: basePath, method: "GET", body: null);
//     print(response.body);
//     return DriverListModel.fromJson(jsonDecode(response.body));
//   }
// }