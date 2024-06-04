import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'forgotService.dart';

class ForgotFormManager with Myvalidation {
  late ForgotFormService forgotFormService = ForgotFormService();
  ApiService? apiService;
  ForgotFormManager({this.apiService});

  final _email = BehaviorSubject<String>();

  ///Email
  Stream<String> get email$ => _email.stream.transform(validateEmail);
  Sink<String> get inEmail => _email.sink;

  Stream<bool> get isForgotFormValid$ =>
      CombineLatestStream([email$], (values) => true);
}
