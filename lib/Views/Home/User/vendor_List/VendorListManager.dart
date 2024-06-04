import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/User/vendor_List/VendorListModel.dart';
import 'package:vendor_app/Views/Home/User/vendor_List/VendorListService.dart';
import 'package:vendor_app/services/apis_services.dart';

class VendorListManager with Myvalidation {
  late VendorListService vendorListService = VendorListService();
  ApiService? apiService;

  VendorListManager({this.apiService});
  final BehaviorSubject<List<VendorListModel>> _main =
      BehaviorSubject<List<VendorListModel>>();

  Stream<List<VendorListModel>> get mainList async* {
    VendorListService vendorListService = VendorListService();
    yield await vendorListService.browse();
  }

  categoriesListingVendorManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
