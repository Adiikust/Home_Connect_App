import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_model.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_services.dart';

import '../../../../../services/apis_services.dart';

class SubCategoriesIdBaseListingShowManager with Myvalidation {
  late SubCategoriesIdBaseListingShowServices
      subCategoriesIdBaseListingShowServices =
      SubCategoriesIdBaseListingShowServices();
  ApiService? apiService;

  SubCategoriesIdBaseListingShowManager({this.apiService});
  final BehaviorSubject<List<SubCategoriesIdBaseListingShowModel>> _main =
      BehaviorSubject<List<SubCategoriesIdBaseListingShowModel>>();

  Stream<List<SubCategoriesIdBaseListingShowModel>> get mainList async* {
    SubCategoriesIdBaseListingShowServices
        subCategoriesIdBaseListingShowServices =
        SubCategoriesIdBaseListingShowServices();
    yield await subCategoriesIdBaseListingShowServices.browse();
  }

  userListingManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
