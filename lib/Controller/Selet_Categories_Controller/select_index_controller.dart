import 'package:vendor_app/Utils/Exports/all_exports.dart';

class selectIndexController extends GetxController {
  late var selectedIndex = null;

  void updateIndex({required dynamic selectIndex}) {
    selectedIndex = selectIndex;
    update();
  }
}
