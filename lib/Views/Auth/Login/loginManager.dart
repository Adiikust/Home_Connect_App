import 'dart:async';

import 'package:vendor_app/Views/Auth/Login/loginService.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

class LoginFormManager with Myvalidation {
  late LoginFormService newPasswordFormService = LoginFormService();
  ApiService? apiService;
  LoginFormManager({this.apiService});

  BehaviorSubject<String> _phone = BehaviorSubject<String>();
  BehaviorSubject<String> _password = BehaviorSubject<String>();
  // final _hasValue = BehaviorSubject<bool>();

  ///email
  Stream<String> get phone$ => _phone.stream.transform(phoneNumber);
  Sink<String> get inPhone => _phone.sink;

  ///password
  Stream<String> get password$ => _password.stream.transform(passwordLength);
  Sink<String> get inPassword => _password.sink;

  // ///Has value
  // Stream<bool> get hasValue$ => _hasValue.stream.transform(hasValue);
  // StreamSink<bool> get inHasValue => _hasValue.sink;
  ///clearData
  void clearData() {
    _phone.close();
    _password.close();

    _phone = BehaviorSubject<String>();
    _password = BehaviorSubject<String>();
  }

  ///Object
  Stream<bool> get isLoginFormValid$ =>
      CombineLatestStream([phone$, password$], (values) => true);

  ///is Login Form Submit
  Stream<bool> get isLoginFormSubmit$ async* {
    yield await newPasswordFormService
        .loginSubmitForm(_phone.value, _password.value)
        .then((value) {
      clearData();
      return value;
    });
  }
}
