import '../Utils/Exports/all_exports.dart';

class ThemeNotifier with ChangeNotifier {
  final darkTheme = ThemeData(
    //useMaterial3: true,
    primaryColor: Colors.black,
    scaffoldBackgroundColor: Colors.black54,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    iconTheme: const IconThemeData(color: Colors.black),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xffFFFFFF))),
      labelColor: Color(0xffFFFFFF),
      unselectedLabelColor: Color(0xff9f9a9a),
    ),
    backgroundColor: const Color(0xffFFFFFF),
  );

  final lightTheme = ThemeData(
    //useMaterial3: true,
    primaryColor: const Color(0xff008000),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xff008000),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    tabBarTheme: const TabBarTheme(
      indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: Color(0xff008000))),
      labelColor: Color(0xff4DD969),
      unselectedLabelColor: Color(0xff008000),
    ),
    backgroundColor: const Color(0xff030303),
  );

  ThemeData? _themeData;

  ThemeData? getTheme() => _themeData;

  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      //print('value read from storage: ' + value.toString());
      AppConstants.themValue = value;
      //print("this is my theme${AppConstant.themValue.toString()}");
      var themeMode = value ?? false;
      if (themeMode == false) {
        _themeData = lightTheme;
        AppConstants.themValue = value;
        // print("waleed");
        notifyListeners();
      } else {
        //  print("waleed");
        notifyListeners();
        // print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
  }

  //Todo my code
  bool? _setTheme;

  bool? gettTheme() => _setTheme;

  void getStoreValue() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("themeValue") != null) {
      var themeBoolValue = prefs.getBool("themeValue");
      AppConstants.themValue = themeBoolValue!;
      // var  them = prefs.getBool("themeMode");
      // print("this is theme value ${them.toString()}");
      // AppConstant.themValue = them;
    } else {
      AppConstants.themValue = false;
    }
  }

  void setTheme({required bool themeValue}) async {
    _setTheme = themeValue;
    AppConstants.themValue = themeValue;
    if (themeValue == false) {
      _themeData = lightTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    } else {
      _themeData = darkTheme;
      StorageManager.saveData('themeMode', themeValue);
      notifyListeners();
    }
    notifyListeners();
  }
}
