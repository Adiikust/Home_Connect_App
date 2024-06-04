import 'dart:convert';
import 'package:vendor_app/services/apis_services.dart';
import '../../../../services/network_client.dart';
import '../../../Utils/Exports/all_exports.dart';

class SignUpFormService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));

  Future<bool> signUpSubmitForm(
    final name,
    final email,
    final phone,
    final password,
  ) async {
    final response = await apiService.registerUser({
      'name': name.toString(),
      'email': email.toString(),
      'phone': phone.toString(),
      'password': password.toString(),
    });
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());
      print(map.toString());
      CustomToaster.ToasterTopSuccess(title: "Successfully Registered");
      print("login+++++++++++1");
      return true;
    } else {
      return false;
    }
  }
}
