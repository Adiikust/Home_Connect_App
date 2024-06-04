import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommerce_order_view.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_My_Order/vendor_my_orders.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';
import '../Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profile_screen.dart';

class BuildVendorDrawer extends StatefulWidget {
  const BuildVendorDrawer({Key? key}) : super(key: key);

  @override
  State<BuildVendorDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildVendorDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xffF5F5F5),
        child: Column(
          children: <Widget>[
            buildProfileSizedBox(
              child: Image.network(
                Overseer.vendorProfileImage,
                fit: BoxFit.cover,
              ),
              clickCallback: () {
                Get.to(const VendorProfileScreen());
              },
              email: Overseer.vendorProfileEmail,
              name:
                  "${Overseer.vendorProfileFName} ${Overseer.vendorProfileLName}",
            ),
            buildListTile(
              onTap: () {
                Navigator.pop(context);
              },
              icon: Icons.home_outlined,
              text: "Home",
            ),
            buildListTile(
              onTap: () {
                Get.to(EcommerceOrderView());
              },
              icon: Icons.food_bank_outlined,
              text: AppConstants.ORDER,
            ),
            // buildListTile(
            //   onTap: () {
            //     Get.to(VendorMyOrders());
            //   },
            //   icon: Icons.settings,
            //   text: AppConstants.SETTING,
            // ),
            const Spacer(),
            ListTile(
              leading: const Icon(
                Icons.logout,
                color: AppColors.kGreenColor,
              ),
              title: BuildText(
                text: AppConstants.LOGOUT,
                color: AppColors.kGreenColor,
                family: 'Montserrat-Medium',
                size: 15,
              ),
              onTap: () async {
                SharedPreferences sharedP =
                    await SharedPreferences.getInstance();
                sharedP.remove('userToken');
                SharedPreferences sharedR =
                    await SharedPreferences.getInstance();
                sharedR.remove('userRole');
                sharedR.remove('userLoginID');
                Get.offAll(() => LoginScreen());
                Get.snackbar(
                  "Congratulation",
                  backgroundColor: AppColors.kDArkBlackColor,
                  "Successfully LogOut",
                  icon: const Icon(Icons.error_outline, color: Colors.white),
                  snackPosition: SnackPosition.TOP,
                );
              },
            ),
            BuildSizeBox(height: 10),
            // Consumer<ThemeNotifier>(builder: (context, theme, child) {
            //   return SizedBox(
            //     height: 35,
            //     child: LiteRollingSwitch(
            //       value: AppConstants.themValue,
            //       textOnColor: Colors.white,
            //       textOn: 'Dark',
            //       textOff: 'Light',
            //       colorOn: AppColors.kBlackColor,
            //       colorOff: AppColors.kGreenColor,
            //       iconOn: Icons.shield_moon,
            //       iconOff: Icons.sunny,
            //       animationDuration: const Duration(milliseconds: 800),
            //       onChanged: (bool state) async {
            //         final prefs = await SharedPreferences.getInstance();
            //         prefs.setBool("themeValue", state);
            //         theme.setTheme(themeValue: state);
            //       },
            //       onTap: () {},
            //       onDoubleTap: () {},
            //       onSwipe: () {},
            //     ),
            //   );
            // }),
            BuildSizeBox(height: 20)
          ],
        ),
      ),
    );
  }

  SizedBox buildProfileSizedBox(
      {required Widget child,
      required String name,
      required String email,
      required void Function() clickCallback}) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BuildSizeBox(
            weight: Get.width * ScreenSizes.SCREEN_SIZE_5,
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kCardDArkColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: 100,
                child: child),
          ),
          BuildSizeBox(
            weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BuildText(
                  text: name,
                  color: AppColors.kTextColor1,
                  family: 'Montserrat-SemiBold',
                  size: 16,
                  fontWeight: FontWeight.bold,
                ),
                BuildText(
                  text: email,
                  color: AppColors.kTextColor2,
                  family: 'Montserrat-Medium',
                  size: 12,
                ),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, right: 100),
                  child: SmallTextButton(
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kGreenColor,
                    text: 'Edit',
                    clickCallback: clickCallback,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  ListTile buildListTile(
      {required IconData icon,
      required String text,
      required void Function() onTap}) {
    return ListTile(
      leading: Icon(icon, color: AppColors.kTextColor1),
      title: BuildText(
        text: text,
        color: AppColors.kTextColor1,
        family: 'Montserrat-Medium',
        size: 15,
      ),
      onTap: onTap,
    );
  }
}
