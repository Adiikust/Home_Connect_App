import 'dart:convert';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Get_User_Profile/user_profileModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

class UserProfileService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<UserProfileDataModel> list = [];
  Future<List<UserProfileDataModel>> browse() async {
    print("this is UserProfileService ");
    final response = await apiService.getUserProfileData();
    print("this is UserProfileService ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is UserProfileService ");

      print("APi Response");
      list.add(UserProfileDataModel.fromJson(map));

      Overseer.userProfileImage = list[0].data!.imageUrl.toString();
      Overseer.userProfileEmail = list[0].data!.email.toString();
      Overseer.userProfileName = list[0].data!.name.toString();

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
