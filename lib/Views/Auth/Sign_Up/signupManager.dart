import 'package:vendor_app/Views/Auth/Sign_Up/signupService.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

class SignUpFormManager with Myvalidation {
  late SignUpFormService signUpFormService = SignUpFormService();
  ApiService? apiService;
  SignUpFormManager({this.apiService});

  BehaviorSubject<String> _name = BehaviorSubject<String>();
  BehaviorSubject<String> _email = BehaviorSubject<String>();
  BehaviorSubject<String> _phone = BehaviorSubject<String>();
  BehaviorSubject<String> _password = BehaviorSubject<String>();

  ///Name
  Stream<String> get name$ => _name.stream.transform(validateName);
  Sink<String> get inName => _name.sink;

  ///Email
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  ///Password
  Stream<String> get password$ => _password.stream.transform(passwordLength);
  Sink<String> get inPassword => _password.sink;

  ///Conform Password
  Stream<String> get phoneNumber$ => _phone.stream.transform(phoneNumber);
  Sink<String> get inPhoneNumber => _phone.sink;

  ///clearData
  void clearData() {
    _name.close();
    _email.close();
    _phone.close();
    _password.close();

    _name = BehaviorSubject<String>();
    _email = BehaviorSubject<String>();
    _phone = BehaviorSubject<String>();
    _password = BehaviorSubject<String>();
  }

  Stream<bool> get isSignUpFormValid$ => CombineLatestStream(
      [name$, email$, phoneNumber$, password$], (values) => true);

  ///is Signup Form Submit
  Stream<bool> get isSignUpFormSubmit$ async* {
    String message = 'success';
    yield await signUpFormService
        .signUpSubmitForm(
      _name.value,
      _email.value,
      _phone.value,
      _password.value,
    )
        .then((value) {
      clearData();
      return value;
    });
  }
}
