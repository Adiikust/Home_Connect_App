import 'dart:async';
import 'package:vendor_app/Utils/Exports/all_exports.dart';

class BirdsManager {
  Stream<List<BirdsModel>> get logsList async* {
    yield await BirdsService.log();
  }
}
