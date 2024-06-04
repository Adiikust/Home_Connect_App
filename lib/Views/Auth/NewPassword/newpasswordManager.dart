import 'package:vendor_app/Views/Auth/NewPassword/newpasswordService.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

class NewPasswordFormManager with Myvalidation {
  late NewPasswordFormService newPasswordFormService = NewPasswordFormService();
  ApiService? apiService;
  NewPasswordFormManager({this.apiService});

  final _newPssword = BehaviorSubject<String>();

  ///Email
  Stream<String> get newPassword$ =>
      _newPssword.stream.transform(passwordLength);
  Sink<String> get inNewPassword => _newPssword.sink;

  Stream<bool> get isNewPasswordFormValid$ =>
      CombineLatestStream([newPassword$], (values) => true);
}
