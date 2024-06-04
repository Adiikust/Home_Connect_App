import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_model.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_service.dart';
import 'package:vendor_app/services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';

class UserInquiryFormViewManager with Myvalidation {
  late UserInquiryFormViewService userInquiryFormViewService =
      UserInquiryFormViewService();
  ApiService? apiService;

  UserInquiryFormViewManager({this.apiService});
  final BehaviorSubject<List<UserInquiryFormViewModel>> _main =
      BehaviorSubject<List<UserInquiryFormViewModel>>();

  Stream<List<UserInquiryFormViewModel>> get mainList async* {
    UserInquiryFormViewService userInquiryFormViewService =
        UserInquiryFormViewService();
    yield await userInquiryFormViewService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
