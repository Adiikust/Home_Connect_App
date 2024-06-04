import 'dart:async';
import 'package:vendor_app/Utils/Exports/all_exports.dart';

mixin Myvalidation {
  ///Product Title
  static bool isProductTitle(String productTitle) => productTitle.length > 5;
  final validateProductTitle =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isProductTitle(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Enter Valid Product Name");
    }
  });

  ///Price
  static bool isPrice(String price) => price.length > 3; //name
  final validatePrice =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPrice(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Enter Product Price");
    }
  });

  ///Description HasValue
  static bool isHasValue(String hasValue) =>
      hasValue.length > 10 && hasValue.length <= 300;
  final hasValues =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isHasValue(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Enter Product Description");
    }
  });

  ///city HasValue
  static bool isCategoryId(String hasCityValue) => hasCityValue.isNotEmpty;
  final categoryId =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isCategoryId(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Select the Categories");
    }
  });
}
