import 'dart:convert';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../../../Utils/Exports/all_exports.dart';
import 'delete_showCase_images_model.dart';

class DeleteShowCaseImageServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));

  List<DeleteShowCaseImageModel> deleteShowCaseImageModel = [];

  Future<bool> deleteShowCaseImagesData({
    required String categoriesId,
    required String imgUrl,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
          ),
        );
      },
      barrierDismissible: false,
    );
    print("this is srvice ");

    final response = await apiService.postShowCaseImagesDeleteData({
      'product_id': categoriesId.toString(),
      'image_url': imgUrl.toString(),
    });

    String content = response.toString();
    print(content.toString());
    print("this is srvice ");

    Map<String, dynamic> map = jsonDecode(response.toString());

    if (response.statusCode == 200) {
      deleteShowCaseImageModel.clear();
      print("APi Response");
      deleteShowCaseImageModel.add(DeleteShowCaseImageModel.fromJson(map));
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(deleteShowCaseImageModel[0].message.toString()),
        ),
      );

      /// print Response Api
      print(response.toString());
    } else {
      Navigator.pop(context);
      print('Error during POST request');
      print('Status Code: ${response.statusCode}');
    }
    return false;
  }
}
