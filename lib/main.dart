import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Theme/theme_manager.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/AppLayer/Provider.dart' as pro;
import 'package:vendor_app/Views/Home/User/Buy_Product/buy_listing_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Add_Step/vendor_add_step_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Step_Delete/vendor_step_delete_services.dart';
import 'Views/Admin_Panel/Auth/admin_login_service.dart';
import 'Views/Admin_Panel/Order_Details/component/Admin_Survey_Form/admin_survey_form_services.dart';
import 'Views/Home/User/Inquiry_Form_Fill/inquiry_form_services.dart';
import 'notification/notification_service.dart';

// Future<void> backgroundHandler(RemoteMessage message) async {
//   print(message.data.toString());
//   print('Handle a Background Data ${message.messageId}');
//   await Firebase.initializeApp(
//       name: 'Vendor-app', options: DefaultFirebaseOptions.currentPlatform);
// }
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  await Firebase.initializeApp();
}

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//     'high_importance_channel', 'High Importance Notifications',
//     importance: Importance.high, playSound: true);

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey =
      "pk_test_51LTgYjGvKD8UhlGpjjPxstUAjeSXkKhFHFIcX93Vmo7X0vZmMfk2LMJAgWyZYyVLsbWSOVAuJv401uOlD4FBNPzg00Z9Yxe2Fz";
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // await Firebase.initializeApp(
  //     name: 'Vendor-app', options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.getInitialMessage();
  // FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  // await flutterLocalNotificationsPlugin
  //     .resolvePlatformSpecificImplementation<
  //         AndroidFlutterLocalNotificationsPlugin>()
  //     ?.createNotificationChannel(channel);
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // final localizationController = Get.put(LocalizationController());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeNotifier()),
        ChangeNotifierProvider(create: (_) => InquiryFormService()),
        ChangeNotifierProvider(create: (_) => AdminAuthService()),
        ChangeNotifierProvider(create: (_) => AdminSurveyFormService()),
        ChangeNotifierProvider(create: (_) => VendorStepsDeleteService()),
        ChangeNotifierProvider(create: (_) => VendorAddStepFormService()),
        ChangeNotifierProvider(create: (_) => BuyListingService()),
      ],
      child: Builder(
        builder: (BuildContext context) {
          return Consumer<ThemeNotifier>(builder: (key, theme, child) {
            return pro.Provider(
              data: Overseer(),
              child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Home Connect App',
                // theme: ThemeData(
                //
                //   primarySwatch: Colors.green,
                //
                // ),
                theme: theme.getTheme(),
                home: const SplashScreen(),
              ),
            );
          });
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// import 'dart:io';
// import 'package:vendor_app/Theme/theme_manager.dart';
// import 'package:vendor_app/Utils/Exports/all_exports.dart';
// import 'package:vendor_app/AppLayer/Provider.dart' as pro;
//
// Future<void> main() async {
//   HttpOverrides.global = MyHttpOverrides();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ThemeNotifier()),
//       ],
//       child: Builder(builder: (BuildContext context) {
//         return Consumer<ThemeNotifier>(builder: (key, theme, child) {
//           return pro.Provider(
//             data: Overseer(),
//             child: GetMaterialApp(
//               title: 'Vendor App',
//               theme: ThemeData(
//                 primarySwatch: Colors.green,
//               ),
//               debugShowCheckedModeBanner: false,
//               home:
//                   //VendorCategoryDetails(),
//                   //WelcomeScreen(),
//                   //SignupScreen()
//                   //LoginScreen(),
//                   const SplashScreen(),
//             ),
//           );
//         });
//       }),
//     );
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
