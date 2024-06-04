import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Myvalidation.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseModel.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseService.dart';
import 'package:vendor_app/services/apis_services.dart';

class VendorShowCaseManager with Myvalidation {
  late VendorShowCaseServices vendorShowCaseServices = VendorShowCaseServices();
  ApiService? apiService;

  VendorShowCaseManager({this.apiService});
  final BehaviorSubject<List<VendorShowCaseModel>> _main =
      BehaviorSubject<List<VendorShowCaseModel>>();

  Stream<List<VendorShowCaseModel>> get mainList async* {
    VendorShowCaseServices vendorShowCaseServices = VendorShowCaseServices();
    yield await vendorShowCaseServices.browse();
  }

  userListingManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
