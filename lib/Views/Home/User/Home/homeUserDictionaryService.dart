import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import 'homeUserDictionaryModel.dart';

class HomeUserDictionaryService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<HomeUserDictionaryModel> list = [];
  Future<List<HomeUserDictionaryModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getHomeUserDictionaryData();
    // String content = response.toString();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice ");

      print("APi Response");
      list.add(HomeUserDictionaryModel.fromJson(map));

      print("img url ${response}");

      /// print Response Api
      print(response.toString());
    } else {}

    return list;
  }
}
