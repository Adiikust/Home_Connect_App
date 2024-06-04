import 'dart:convert';
import 'package:get/get.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileModel.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';

import '../../../../AppLayer/Overseer.dart';

class VendorProfileService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
  List<VendorProfileDataModel> list = [];
  Future<List<VendorProfileDataModel>> browse() async {
    print("this is srvice ");
    final response = await apiService.getVendorProfileData();
    print("this is srvice ");
    Map<String, dynamic> map = jsonDecode(response.toString());
    if (response.statusCode == 200) {
      print("this is srvice VendorProfileService");
      print("APi Response");
      list.add(VendorProfileDataModel.fromJson(map));

      Overseer.vendorProfileImage = list[0].data!.imageUrl![0].toString();
      Overseer.vendorProfileEmail = list[0].data!.email.toString();
      Overseer.vendorProfileFName = list[0].data!.fName.toString();
      Overseer.vendorProfileLName = list[0].data!.lName.toString();

      print("VendorProfileService ${Overseer.vendorProfileImage}");
      print("VendorProfileService ${Overseer.vendorProfileEmail}");
      print("VendorProfileService ${Overseer.vendorProfileFName}");
      print("VendorProfileService ${Overseer.vendorProfileLName}");

      /// print Response Api
      print(response.toString());
    } else {
      print("Error");
    }

    return list;
  }
}
