import 'package:vendor_app/Utils/Exports/all_exports.dart';

class ProfileController extends GetxController {
  List<ProfileModel> getProfileData = [
    // ProfileModel(
    //     headerText: "",
    //     title: "Scanned ID cards",
    //     icon: const Icon(Icons.important_devices_outlined)),
    // ProfileModel(
    //     headerText: "Phone Number",
    //     title: "+14 35 6 456 1234",
    //     icon: const Icon(Icons.mobile_friendly_outlined)),
    ProfileModel(
        headerText: "Email address",
        title: "adnan.hameed277@gmail.com",
        icon: const Icon(Icons.email_outlined)),
    ProfileModel(
        headerText: "Name",
        title: "Adnan Hameed",
        icon: const Icon(Icons.person_outlined)),
    ProfileModel(
        headerText: "Address",
        title: "Abc",
        icon: const Icon(Icons.location_on_outlined)),
    ProfileModel(
        headerText: "City",
        title: "kohat",
        icon: const Icon(Icons.location_city_outlined)),
    ProfileModel(
        headerText: "Phone Number",
        title: "123456789",
        icon: const Icon(Icons.share_location_outlined)),
    ProfileModel(
        headerText: "Area", title: "area", icon: const Icon(Icons.area_chart)),
    // ProfileModel(
    //     headerText: "Document ID",
    //     title: "6453458746",
    //     icon: const Icon(Icons.important_devices_outlined)),
  ];
}
