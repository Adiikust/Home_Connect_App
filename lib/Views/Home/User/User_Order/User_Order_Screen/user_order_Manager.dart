import 'package:rxdart/rxdart.dart';
import 'package:vendor_app/Views/Auth/Myvalidation.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Model.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Service.dart';
import 'package:vendor_app/services/apis_services.dart';

class UserOrderManager with Myvalidation {
  late UserOrderService userOrderService = UserOrderService();
  ApiService? apiService;

  UserOrderManager({this.apiService});
  final BehaviorSubject<List<UserOrderDataModel>> _main =
      BehaviorSubject<List<UserOrderDataModel>>();

  Stream<List<UserOrderDataModel>> get mainList async* {
    UserOrderService userOrderService = UserOrderService();
    yield await userOrderService.browse();
  }

  homeUserManager() {
    // mainList.listen((value) => _main.addStream(mainList));
  }
}
