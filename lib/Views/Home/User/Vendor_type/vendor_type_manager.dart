import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/User/Vendor_type/vendor_type_service.dart';
import 'package:vendor_app/services/apis_services.dart';

import 'vendor_type_model.dart';

class VendorTypeManager with Myvalidation {
  late VendorTypeService vendorTypeService = VendorTypeService();
  ApiService? apiService;

  VendorTypeManager({this.apiService});
  final BehaviorSubject<List<VendorTypeModel>> _main =
      BehaviorSubject<List<VendorTypeModel>>();

  Stream<List<VendorTypeModel>> get mainList async* {
    VendorTypeService vendorTypeService = VendorTypeService();
    yield await vendorTypeService.browse();
  }

  vendorTypeManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
