import 'package:vendor_app/services/apis_services.dart';
import '../../../../services/network_client.dart';
import 'package:get/get.dart';

class NewPasswordFormService {
  late ApiService apiService =
      ApiService(networkClient: Get.put(NetworkClient()));
}
