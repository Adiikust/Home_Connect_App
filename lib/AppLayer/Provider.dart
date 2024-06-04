import 'package:vendor_app/Utils/Exports/all_exports.dart';

class Provider extends InheritedWidget {
  final Overseer data;

  ///
  Provider({Key? key, Widget? child, required this.data})
      : super(key: key, child: child!);

  static Overseer of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>())!.data;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
