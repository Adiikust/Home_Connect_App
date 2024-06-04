import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/User/Shopping/shopping_model.dart';
import 'package:vendor_app/Views/Home/User/Shopping/shopping_service.dart';
import 'package:vendor_app/services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';

class ShoppingManager with Myvalidation {
  late ShoppingService shoppingService = ShoppingService();
  ApiService? apiService;

  ShoppingManager({this.apiService});
  final BehaviorSubject<List<ShoppingModel>> _main =
      BehaviorSubject<List<ShoppingModel>>();

  Stream<List<ShoppingModel>> get mainList async* {
    ShoppingService shoppingService = ShoppingService();
    yield await shoppingService.browse();
  }

  subCategoriesManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
