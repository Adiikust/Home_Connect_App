import 'dart:convert';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/View_Listing_&_ShowCase/Listing/component/delete_listing_image_model.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:vendor_app/services/network_client.dart';
import '../../../../../../Utils/Exports/all_exports.dart';

class DeleteListingImageServices {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));

  List<DeleteListingImageModel> deleteListingImageModel = [];

  Future<bool> deleteListingImagesData({
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

    final response = await apiService.postListingImagesDeleteData({
      'product_id': categoriesId.toString(),
      'image_url': imgUrl.toString(),
    });

    String content = response.toString();
    print(content.toString());
    print("this is srvice ");

    Map<String, dynamic> map = jsonDecode(response.toString());

    if (response.statusCode == 200) {
      deleteListingImageModel.clear();
      print("APi Response");
      deleteListingImageModel.add(DeleteListingImageModel.fromJson(map));
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(deleteListingImageModel[0].message.toString()),
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
