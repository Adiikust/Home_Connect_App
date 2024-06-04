import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Get_User_Profile/user_profileModel.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Get_User_Profile/user_profileService.dart';
import 'package:vendor_app/services/apis_services.dart';

class UserProfileManager with Myvalidation {
  late UserProfileService userProfileService = UserProfileService();
  ApiService? apiService;

  UserProfileManager({this.apiService});
  final BehaviorSubject<List<UserProfileDataModel>> _main =
      BehaviorSubject<List<UserProfileDataModel>>();

  Stream<List<UserProfileDataModel>> get mainList async* {
    UserProfileService userProfileService = UserProfileService();
    yield await userProfileService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
