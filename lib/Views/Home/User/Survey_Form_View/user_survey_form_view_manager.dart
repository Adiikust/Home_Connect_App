import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/User/Survey_Form_View/user_survey_form_view_model.dart';
import 'package:vendor_app/Views/Home/User/Survey_Form_View/user_survey_form_view_service.dart';
import '../../../../services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';

class UserSurveyFormViewManager with Myvalidation {
  late UserSurveyFormViewService userSurveyFormViewService =
      UserSurveyFormViewService();
  ApiService? apiService;

  UserSurveyFormViewManager({this.apiService});
  final BehaviorSubject<List<UserSurveyFormViewModel>> _main =
      BehaviorSubject<List<UserSurveyFormViewModel>>();

  Stream<List<UserSurveyFormViewModel>> get mainList async* {
    UserSurveyFormViewService userSurveyFormViewService =
        UserSurveyFormViewService();
    yield await userSurveyFormViewService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
