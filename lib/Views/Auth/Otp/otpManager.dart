import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

import 'otpService.dart';

class OTPFormManager with Myvalidation {
  late OTPFormService oTPFormService = OTPFormService();
  ApiService? apiService;
  OTPFormManager({this.apiService});

  final _otp = BehaviorSubject<String>();

  ///OTP
  Stream<String> get otp$ => _otp.stream.transform(oTPLength);
  Sink<String> get inOtp => _otp.sink;

  Stream<bool> get isOtpFormValid$ =>
      CombineLatestStream([otp$], (values) => true);
}
