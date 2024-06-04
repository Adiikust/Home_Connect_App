import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

import 'package:vendor_app/services/apis_services.dart';

import 'userListingModel.dart';
import 'userListingService.dart';

class UserListingManager with Myvalidation {
  late UserListingService userListingService = UserListingService();
  ApiService? apiService;

  UserListingManager({this.apiService});
  final BehaviorSubject<List<UserListingModel>> _main =
      BehaviorSubject<List<UserListingModel>>();

  Stream<List<UserListingModel>> get mainList async* {
    UserListingService userListingService = UserListingService();
    yield await userListingService.browse();
  }

  userListingManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
