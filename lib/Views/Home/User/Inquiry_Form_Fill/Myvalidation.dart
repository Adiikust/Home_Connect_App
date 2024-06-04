import 'dart:async';

import 'package:email_validator/email_validator.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';

mixin Myvalidation {
  ///email
  static bool isEmail(String email) =>
      EmailValidator.validate(email); //email.contains('@');
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("getting text");
      sink.add(value);
    } else {
      print("getting text");

      sink.addError("email id is not valid");
    }
  });

  ///phone
  static bool isPhone(String phone) => phone.length == 11;
  final validatePhoneNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPhone(value)) {
      print("getting text");
      sink.add(value);
    } else {
      print("getting text");
      sink.addError("Enter Your Phone Number");
    }
  });

  ///name
  static bool isName(String name) => name.length > 5; //name
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isName(value)) {
      print("getting text");
      sink.add(value);
    } else {
      print("getting text");
      sink.addError("Enter your Full Name");
    }
  });

  ///password
  static bool isPasswordValidLength(String password) => password.length >= 4;
  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      sink.add(value);
    } else {
      print("password length > $value");

      sink.addError("Password must be of 10 characters or higher");
    }
  });

  ///Area HasValue
  static bool isHasValue(String hasValue) =>
      hasValue.length > 10 && hasValue.length <= 300;
  final hasValues =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isHasValue(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Enter Area");
    }
  });

  ///city HasValue
  static bool isCityHasValue(String hasCityValue) => hasCityValue.isNotEmpty;
  final cityHasValues =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isCityHasValue(value)) {
      sink.add(value);
    } else {
      sink.addError("Please Select the Option");
    }
  });
}
