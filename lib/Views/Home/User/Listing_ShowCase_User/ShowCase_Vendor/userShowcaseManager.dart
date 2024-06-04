import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseModel.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseService.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Myvalidation.dart';

import 'package:vendor_app/services/apis_services.dart';

class UserShowCaseManager with Myvalidation {
  late UserShowCaseService userShowCaseService = UserShowCaseService();
  ApiService? apiService;

  UserShowCaseManager({this.apiService});
  final BehaviorSubject<List<UserShowCaseModel>> _main =
      BehaviorSubject<List<UserShowCaseModel>>();

  Stream<List<UserShowCaseModel>> get mainList async* {
    UserShowCaseService userShowCaseService = UserShowCaseService();
    yield await userShowCaseService.browse();
  }

  userShowCaseManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
