import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_model.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_service.dart';
import 'package:vendor_app/services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';

class EcommerceOrderManager with Myvalidation {
  late EcommerceOrderService ecommerceOrderService = EcommerceOrderService();
  ApiService? apiService;

  EcommerceOrderManager({this.apiService});
  final BehaviorSubject<List<EcommerceOrderModel>> _main =
      BehaviorSubject<List<EcommerceOrderModel>>();

  Stream<List<EcommerceOrderModel>> get mainList async* {
    late EcommerceOrderService ecommerceOrderService = EcommerceOrderService();
    yield await ecommerceOrderService.browse();
  }

  subCategoriesManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
