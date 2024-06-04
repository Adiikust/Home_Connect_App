import 'package:vendor_app/Utils/Exports/all_exports.dart';

class AuthController extends GetxController {
  var isObscurePass = true.obs;
  var isObscureConPass = true.obs;
  var isObscureFlower = true.obs;
  var isObscureNewPassword = true.obs;

  void obscurePassword() {
    isObscurePass.value = !isObscurePass.value;
  }

  void obscureNewPassword() {
    isObscureNewPassword.value = !isObscureNewPassword.value;
  }

  void obscureConformPassword() {
    isObscureConPass.value = !isObscureConPass.value;
  }

  void obscureFlowerPassword() {
    isObscureFlower.value = !isObscureFlower.value;
  }
}
