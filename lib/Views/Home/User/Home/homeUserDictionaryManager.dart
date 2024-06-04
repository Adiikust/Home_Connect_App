import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';

import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryService.dart';
import 'package:vendor_app/services/apis_services.dart';

import 'homeUserDictionaryModel.dart';

class HomeUserDictionaryManager with Myvalidation {
  late HomeUserDictionaryService userService = HomeUserDictionaryService();
  ApiService? apiService;

  HomeUserDictionaryManager({this.apiService});
  final BehaviorSubject<List<HomeUserDictionaryModel>> _main =
      BehaviorSubject<List<HomeUserDictionaryModel>>();

  Stream<List<HomeUserDictionaryModel>> get mainList async* {
    HomeUserDictionaryService homeUserDictionaryService =
        HomeUserDictionaryService();
    yield await homeUserDictionaryService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
