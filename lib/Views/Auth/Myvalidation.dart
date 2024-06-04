import 'dart:async';
import 'package:email_validator/email_validator.dart';

mixin Myvalidation {
  ///name
  static bool isName(String name) => name.length > 5; //name
  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isName(value)) {
      print("name length > $value");
      sink.add(value);
    } else {
      sink.addError("Enter your Full Name");
    }
  });

  ///email
  static bool isEmail(String email) => EmailValidator.validate(email);
  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isEmail(value)) {
      print("email length > $value");
      sink.add(value);
    } else {
      sink.addError("Email id is not valid");
    }
  });

  ///Password
  static bool isPasswordValidLength(String password) => password.length >= 6;
  final passwordLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPasswordValidLength(value)) {
      print("pasword length > $value");
      sink.add(value);
    } else {
      print("password length > $value");

      sink.addError("Password must be of 6 characters or higher");
    }
  });

  ///phone number
  static bool isPhoneNumberLength(String phone) => phone.length == 11;
  final phoneNumber =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isPhoneNumberLength(value)) {
      print("phone length > $value");
      sink.add(value);
    } else {
      print("phone number length > $value");

      sink.addError("Please Enter the valid phone Number");
    }
  });

  ///OTP
  static bool isOTPValidLength(String otp) => otp.length >= 4;
  final oTPLength =
      StreamTransformer<String, String>.fromHandlers(handleData: (value, sink) {
    if (isOTPValidLength(value)) {
      sink.add(value);
    } else {
      sink.addError("OTP enter must be  4 digit");
    }
  });

  ///HasValue
  static bool hasVlaue(bool password) => true;
  final hasValue =
      StreamTransformer<bool, bool>.fromHandlers(handleData: (value, sink) {
    if (hasVlaue(value)) {
      sink.add(value);
    } else {
      sink.addError("Please select a role");
    }
  });
}
