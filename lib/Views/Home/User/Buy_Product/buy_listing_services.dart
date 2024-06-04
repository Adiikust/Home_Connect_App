import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vendor_app/Views/Widgets/overlay_loader_widget.dart';
import '../../../../services/exception.dart';

class BuyListingService extends ChangeNotifier {
  Dio _dio = Dio();
  Future<void> postBuyListingPaymentData({
    required final amount,
    required final quantity,
    required final userID,
    required final address,
    required final vendorId,
    required final ItemId,
    required BuildContext context,
  }) async {
    SharedPreferences sharedP = await SharedPreferences.getInstance();
    String? userToken = sharedP.getString('userToken');

    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));

    Response response;
    try {
      //TODO: COD
      if (selectedOption == "0") {
        var formData = FormData.fromMap({
          'user_id': userID,
          'delivery_address': address,
          'listing_id': ItemId,
          'quantity': quantity,
          'amount': amount,
          'vendor_id': vendorId
        });

        response = await _dio.post(
            'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/customer/order/cash-on-delivery',
            data: formData, onSendProgress: (startValue, endValue) {
          double multiPValue = startValue / endValue;
          double percentData = multiPValue * 1;
          double showPercent = multiPValue * 100;
          int roundedInt = showPercent.round();
          double roundedDouble = roundedInt.toDouble();
          print('Sending progress: ${roundedDouble}');
          notifyListeners();
        },
            options: Options(
              responseType: ResponseType.json,
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $userToken"
              },
            ));

        if (response.statusCode == 200) {
          print("#############%%%%%%%%%%%%%%%%%%%%${response.statusCode}");
          Map<String, dynamic> map = jsonDecode(response.toString());
          OverlayLoader.instance.hide();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Order Successfully place"),
              duration: Duration(seconds: 3),
            ),
          );

          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          print("===This is Else=== ");
        }
      }
      //TODO: Online Payment
      else {
        var formData = FormData.fromMap({
          'user_id': userID,
          'delivery_address': address,
          'listing_id': ItemId,
          'quantity': quantity,
          'amount': amount,
          'vendor_id': vendorId
        });

        response = await _dio.post(
            'https://learnunstoppable.com/homepro-connect/home-pro/public/api/v1/customer/order/card-payment',
            data: formData, onSendProgress: (startValue, endValue) {
          double multiPValue = startValue / endValue;
          double percentData = multiPValue * 1;
          double showPercent = multiPValue * 100;
          int roundedInt = showPercent.round();
          double roundedDouble = roundedInt.toDouble();
          print('Sending progress: ${roundedDouble}');
          notifyListeners();
        },
            options: Options(
              responseType: ResponseType.json,
              headers: {
                "Accept": "application/json",
                "Authorization": "Bearer $userToken"
              },
            ));

        if (response.statusCode == 200) {
          print("#############%%%%%%%%%%%%%%%%%%%%${response.statusCode}");
          Map<String, dynamic> map = jsonDecode(response.toString());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Order Successfully place"),
              duration: Duration(seconds: 3),
            ),
          );
        } else {
          Navigator.pop(context);
          print("===This is Else=== ");
        }
      }
    } on DioError catch (exception) {
      Navigator.pop(context);
      String content = exception.response.toString();
      print(' Dio error login method api service3 ${DateTime.now().second}');
      print("This is dio error response ${content.toString()}");
      throw RemoteException(dioError: exception);
    }
  }

  String selectedOption = '';
  updatePaymentMethod({required String value}) {
    selectedOption = value;
    notifyListeners();
  }

  double totalCartValue = 0;

  int totalProductQuantity = 1;
  addItem({required String price}) {
    totalProductQuantity++;
    final rate = int.parse(price);
    totalProductPrice(price: rate);
    notifyListeners();
  }

  removeItem({required String price}) {
    if (totalProductQuantity > 1) {
      totalProductQuantity--;
      final rate = int.parse(price);
      totalProductPrice(price: rate);
    }
    notifyListeners();
  }

  totalProductPrice({required int price}) {
    totalCartValue = 0;
    totalCartValue += price * totalProductQuantity;
  }
}
