import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/services/apis_services.dart';
import 'choiceShowCaseModel.dart';
import 'choiceShowCaseService.dart';

class ChoiceShowCaseManager with Myvalidation {
  late ChoiceShowCaseService choiceShowCaseService = ChoiceShowCaseService();
  ApiService? apiService;

  ChoiceShowCaseManager({this.apiService});
  final BehaviorSubject<List<ChoiceShowCaseListModel>> _main =
      BehaviorSubject<List<ChoiceShowCaseListModel>>();

  Stream<List<ChoiceShowCaseListModel>> get mainList async* {
    ChoiceShowCaseService choiceShowCaseService = ChoiceShowCaseService();
    yield await choiceShowCaseService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
