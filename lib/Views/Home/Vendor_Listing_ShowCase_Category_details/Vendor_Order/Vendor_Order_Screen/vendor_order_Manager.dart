import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Service.dart';
import 'package:vendor_app/services/apis_services.dart';

class VendorOrderManager with Myvalidation {
  late VendorOrderService vendorOrderService = VendorOrderService();
  ApiService? apiService;

  VendorOrderManager({this.apiService});
  final BehaviorSubject<List<VendorOrderDataModel>> _main =
      BehaviorSubject<List<VendorOrderDataModel>>();

  Stream<List<VendorOrderDataModel>> get mainList async* {
    VendorOrderService vendorOrderService = VendorOrderService();
    yield await vendorOrderService.browse();
  }

  homeUserManager() {
    // mainList.listen((value) => _main.addStream(mainList));
  }
}
