import 'package:flutter/foundation.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';

import '../../notification/notification_service.dart';
import '../Admin_Panel/Order_Details/Order_Details/admin_order_details_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  splashScreenState createState() => splashScreenState();
}

class splashScreenState extends State<SplashScreen> {
  String deviceId = "";
  NotificationServices notificationServices = NotificationServices();
  @override
  void initState() {
    super.initState();
    notificationServices.requestNotificationPermission();
    notificationServices.firebaseInit(context);
    notificationServices.setupInteractMessage(context);
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print('device token');
        print(value);
      }
    });
    Timer(const Duration(seconds: 3), () async {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      SharedPreferences sharedR = await SharedPreferences.getInstance();
      String? userRole = sharedR.getString('userRole');
      String? userToken = sharedPreferences.getString('userToken');
      Overseer.adminProfileImg = sharedR.getString('userImg') ?? "";
      Overseer.adminProfileFName = sharedR.getString('userFName') ?? "";
      Overseer.adminProfileLName = sharedR.getString('userLName') ?? "";
      Overseer.adminProfileEmail = sharedR.getString('userEmail') ?? "";
      Overseer.adminProfilePhone = sharedR.getString('userPhone') ?? "";
      Overseer.userLoginID = sharedR.getString('userLoginID') ?? "";

      if (userToken == null) {
        Get.to(() => OnboardingScreen());
      } else {
        Overseer.userLoginType = userRole!;
        print("User token $userRole");
        if (Overseer.userLoginType == 'Admin') {
          Get.offAll(AdminOrderDetailsScreen());
        } else {
          Get.offAll(WelcomeScreen());
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
          width: double.infinity,
          child: Image.asset(
            "images/splash.png",
            fit: BoxFit.cover,
          )),
    );
  }
}
