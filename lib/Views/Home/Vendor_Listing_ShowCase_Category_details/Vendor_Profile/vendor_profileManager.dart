import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileModel.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileService.dart';
import '../../../../services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';

class VendorProfileManager with Myvalidation {
  late VendorProfileService vendorProfileService = VendorProfileService();
  ApiService? apiService;

  VendorProfileManager({this.apiService});
  final BehaviorSubject<List<VendorProfileDataModel>> _main =
      BehaviorSubject<List<VendorProfileDataModel>>();

  Stream<List<VendorProfileDataModel>> get mainList async* {
    VendorProfileService vendorProfileService = VendorProfileService();
    yield await vendorProfileService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
