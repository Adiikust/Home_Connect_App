import 'package:rxdart/rxdart.dart';
import '../../../../services/apis_services.dart';
import '../../../Auth/Myvalidation.dart';
import 'admin_order_details_model.dart';
import 'admin_order_details_services.dart';

class AdminOrderDetailsManager with Myvalidation {
  late AdminOrderDetailsService adminOrderDetailsService =
      AdminOrderDetailsService();
  ApiService? apiService;

  AdminOrderDetailsManager({this.apiService});
  final BehaviorSubject<List<AdminOrderDetailsModel>> _main =
      BehaviorSubject<List<AdminOrderDetailsModel>>();

  Stream<List<AdminOrderDetailsModel>> get mainList async* {
    AdminOrderDetailsService adminOrderDetailsService =
        AdminOrderDetailsService();
    yield await adminOrderDetailsService.browse();
  }

  homeUserManager() {
    mainList.listen((value) => _main.addStream(mainList));
  }
}
