import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vendor_app/Utils/Colors/app_color.dart';

class CustomToaster {
  static void Toaster(
      {required String title, Color backgroundColor = AppColors.kGreenColor}) {
    Get.rawSnackbar(
      messageText: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
              child: Text(title,
                  maxLines: 3, style: TextStyle(color: Colors.white))),
        ],
      ),
      duration: Duration(seconds: 3),
      backgroundColor: backgroundColor,
      isDismissible: true,
    );
  }

  static void ToasterTopError(
      {required String title, Color backgroundColor = AppColors.kGreenColor}) {
    Get.rawSnackbar(
      margin: EdgeInsets.all(10),
      messageText: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.white),
          SizedBox(width: 8),
          Text(
            title,
            maxLines: 3,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
      duration: Duration(seconds: 3),
      backgroundColor: backgroundColor,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void ToasterTopSuccess(
      {required String title, Color backgroundColor = AppColors.kGreenColor}) {
    Get.rawSnackbar(
      margin: EdgeInsets.all(10),
      messageText: Row(
        children: [
          Text(
            title,
            maxLines: 3,
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
      duration: Duration(seconds: 3),
      backgroundColor: backgroundColor,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
    );
  }

  static void showNoInternetToaster() {
    Get.rawSnackbar(
      messageText: Row(
        children: [
          Icon(Icons.network_check_outlined, color: Colors.white),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              'No internet connection',
              maxLines: 3,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      duration: null,
      backgroundColor: Colors.red,
      isDismissible: false,
    );
  }

  static void hideToaster() {
    Get.back();
  }
}
