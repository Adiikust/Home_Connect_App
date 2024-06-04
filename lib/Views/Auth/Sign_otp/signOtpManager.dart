import 'package:vendor_app/Views/Auth/NewPassword/newpasswordService.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

class SignOtpFormManager with Myvalidation {
  late NewPasswordFormService newPasswordFormService = NewPasswordFormService();
  ApiService? apiService;
  SignOtpFormManager({this.apiService});

  final _phone = BehaviorSubject<String>();
  final _otp = BehaviorSubject<String>();

  ///phone number
  Stream<String> get phone$ => _phone.stream.transform(phoneNumber);
  Sink<String> get inphone => _phone.sink;

  ///otp
  Stream<String> get otp$ => _otp.stream.transform(oTPLength);
  Sink<String> get inOtp => _otp.sink;

  Stream<bool> get isSignOtpFormValid$ =>
      CombineLatestStream([phone$, otp$], (values) => true);
}
