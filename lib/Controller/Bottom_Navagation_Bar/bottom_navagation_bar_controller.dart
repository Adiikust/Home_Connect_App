import '../../Utils/Exports/all_exports.dart';

class BottomNavigationBarController extends GetxController {
  var currentIndex = 0.obs;

  void changeScreen(value) {
    currentIndex.value = value;
  }
}
