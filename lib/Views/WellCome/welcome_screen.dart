import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_screen.dart';
import 'package:vendor_app/Views/Widgets/build_vendor_drawer.dart';
import '../Home/User/Inquiry_Form_Fill/select_categories.dart';
import '../Home/User/User_Profile/Get_User_Profile/user_profileManager.dart';
import '../Home/User/User_Profile/Get_User_Profile/user_profileModel.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Add_Item/add_listing_product.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_showcase_vendor_category_details.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_screen.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileManager.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileModel.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List screens = [
    const HomeScreen(),
    const SelectCategories(),
    const UserOrderScreen(),
  ];

  final _bottomNavigationBarController = BottomNavigationBarController();

  Future<bool> showWarning(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Do You Really Want to Exit the App?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: AppColors.kGreenColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kWhiteColor,
                              ),
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: AppColors.kBlackColor),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kBlackColor,
                              ),
                              child: const Text(
                                "Confirm",
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    VendorProfileManager vendorProfileManager =
        Provider.of(context).fetch(VendorProfileManager);
    UserProfileManager userProfileManager =
        Provider.of(context).fetch(UserProfileManager);
    vendorProfileManager.mainList;
    print("is user or vendor  >> ${Overseer.userLoginType}");

    if (Overseer.userLoginType.contains("Vendor")) {
      screens.removeAt(0);
      screens.insert(0, const ListingShowCaseVendorCategoryDetails());
    } else {
      screens.removeAt(0);
      screens.insert(0, const HomeScreen());
    }
    if (Overseer.userLoginType.contains("Vendor")) {
      screens.removeAt(1);
      screens.insert(1, const AddListingProduct());
    } else {
      screens.removeAt(1);
      screens.insert(1, const SelectCategories());
    }
    if (Overseer.userLoginType.contains("Vendor")) {
      screens.removeAt(2);
      screens.insert(2, const VendorOrderScreen());
    } else {
      screens.removeAt(2);
      screens.insert(2, const UserOrderScreen());
    }
    return WillPopScope(
      onWillPop: () async {
        final shouldPOp = await showWarning(context);
        return shouldPOp;
      },
      child: Obx(
        () => Scaffold(
          appBar: Overseer.userLoginType.contains("User")
              ? AppBar(
                  elevation: 0,
                  title: StreamBuilder<List<UserProfileDataModel>>(
                      stream: userProfileManager.mainList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text("${Overseer.userProfileName}",style: TextStyle(color: Colors.white),);
                        } else {
                          return Text("Loading...",style: TextStyle(color: Colors.white));
                        }
                      }),
                  backgroundColor: AppColors.kGreenColor,
                  iconTheme: IconThemeData(color: Colors.white, size: 30),
                )
              : AppBar(
                  elevation: 0,
                  title: StreamBuilder<List<VendorProfileDataModel>>(
                      stream: vendorProfileManager.mainList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Text(
                              "${Overseer.vendorProfileFName} ${Overseer.vendorProfileLName}",style: TextStyle(color: Colors.white));
                        } else {
                          return Text("Loading...",style: TextStyle(color: Colors.white));
                        }
                      }),
                  backgroundColor: AppColors.kGreenColor,
                  iconTheme: IconThemeData(color: Colors.white, size: 30),
                ),
          drawer: Overseer.userLoginType.contains("User")
              ? BuildUserDrawer()
              : BuildVendorDrawer(),
          body: screens[_bottomNavigationBarController.currentIndex.value],
          bottomNavigationBar: BuildBottomNavigationBar(
            currentIndex: _bottomNavigationBarController.currentIndex.value,
            onTap: (value) {
              _bottomNavigationBarController.changeScreen(value);
              return null;
            },
          ),
        ),
      ),
    );
  }
}
