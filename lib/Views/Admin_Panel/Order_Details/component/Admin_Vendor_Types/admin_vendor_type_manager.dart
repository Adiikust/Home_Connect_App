import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Admin_Panel/Order_Details/component/Admin_Vendor_Types/admin_vendor_type_services.dart';
import '../../../../../services/apis_services.dart';
import '../../../../Auth/Myvalidation.dart';
import 'admin_vendor_type_model.dart';

class AdminVendorTypeManager with Myvalidation {
  late AdminVendorTypeService adminVendorTypeService = AdminVendorTypeService();
  ApiService? apiService;

  AdminVendorTypeManager({this.apiService});
  final BehaviorSubject<List<AdminVendorTypeModel>> _main =
      BehaviorSubject<List<AdminVendorTypeModel>>();

  Stream<List<AdminVendorTypeModel>> get mainList async* {
    AdminVendorTypeService adminVendorTypeService = AdminVendorTypeService();
    yield await adminVendorTypeService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
