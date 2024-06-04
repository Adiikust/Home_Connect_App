import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_model.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_service.dart';
import 'package:vendor_app/services/apis_services.dart';

class SubCategoriesManager with Myvalidation {
  late SubCategoriesService subCategoriesService = SubCategoriesService();
  ApiService? apiService;

  SubCategoriesManager({this.apiService});
  final BehaviorSubject<List<SubCategoriesModel>> _main =
      BehaviorSubject<List<SubCategoriesModel>>();

  Stream<List<SubCategoriesModel>> get mainList async* {
    SubCategoriesService subCategoriesService = SubCategoriesService();
    yield await subCategoriesService.browse();
  }

  subCategoriesManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
