import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Myvalidation.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorListingModel.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorListingService.dart';
import 'package:vendor_app/services/apis_services.dart';

class VendorListingSubCategoriesIdManager with Myvalidation {
  late VendorListingSubCategoriesIdServices
      vendorListingSubCategoriesIdServices =
      VendorListingSubCategoriesIdServices();
  ApiService? apiService;

  VendorListingSubCategoriesIdManager({this.apiService});
  final BehaviorSubject<List<VendorListingSubCategoriesIdModel>> _main =
      BehaviorSubject<List<VendorListingSubCategoriesIdModel>>();

  Stream<List<VendorListingSubCategoriesIdModel>> get mainList async* {
    VendorListingSubCategoriesIdServices vendorListingSubCategoriesIdServices =
        VendorListingSubCategoriesIdServices();
    yield await vendorListingSubCategoriesIdServices.browse();
  }

  userListingManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }

  Future<void> refresh() async {
    try {
      List<VendorListingSubCategoriesIdModel> newData =
          await vendorListingSubCategoriesIdServices.browse();
      _main.add(newData); // Add the new data to the stream
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
}
