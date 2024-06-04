import 'dart:convert';
import 'package:vendor_app/Views/Auth/Login/loginModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import '../../../../services/network_client.dart';
import '../../../Utils/Exports/all_exports.dart';

class LoginFormService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<LoginModel> list = [];
  Future<bool> loginSubmitForm(final phone, final password) async {
    final response = await apiService.loginUser(
        {'phone': phone.toString(), 'password': password.toString()});
    Overseer.statusCode = response.statusCode.toString();
    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.toString());

      SharedPreferences sharedP = await SharedPreferences.getInstance();
      sharedP.setString('userToken', map['token']);

      String? userToken = sharedP.getString('userToken');

      print("User token $userToken");

      list.add(LoginModel.fromJson(map));
      print(list[0].role.toString());
      Overseer.userLoginType = list[0].role.toString();

      print("^^^^^^^^^^^^^^^^^^^^^Role^^^^^^^^^^^^^^^^^^^^");
      SharedPreferences sharedR = await SharedPreferences.getInstance();
      sharedR.setString('userRole', map['role']);
      sharedR.setString('userLoginID', list[0].user!.id.toString());
      Overseer.userLoginID = sharedR.getString('userLoginID')!;
      String? userRole = sharedR.getString('userRole');
      print("User token $userRole");
      print("User Login ID ${Overseer.userLoginID}");
      print("login token ${sharedP.getString('userToken')}");
      CustomToaster.ToasterTopSuccess(title: "Successfully Login");
      return true;
    } else {
      return false;
    }
  }
}
