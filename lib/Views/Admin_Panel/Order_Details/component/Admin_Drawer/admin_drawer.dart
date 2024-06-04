import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class AdminBuildDrawer extends StatefulWidget {
  const AdminBuildDrawer({Key? key}) : super(key: key);

  @override
  State<AdminBuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<AdminBuildDrawer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xffF5F5F5),
        child: Column(
          children: <Widget>[
            buildProfileSizedBox(
              child: Image.network(
                Overseer.adminProfileImg,
                fit: BoxFit.cover,
              ),
              email: Overseer.adminProfileEmail,
              name:
                  "${Overseer.adminProfileFName} ${Overseer.adminProfileLName}",
              phone: Overseer.adminProfilePhone,
            ),
            buildListTile(
              onTap: () {
                Get.back();
              },
              icon: Icons.home,
              text: "Home",
            ),
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
                sharedR.remove('userImg');
                sharedR.remove('userFName');
                sharedR.remove('userLName');
                sharedR.remove('userEmail');
                sharedR.remove('userPhone');
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
            BuildSizeBox(
              height: 10,
            ),
            BuildSizeBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  SizedBox buildProfileSizedBox({
    required Widget child,
    required String name,
    required String email,
    required String phone,
  }) {
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
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_1,
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
                BuildText(
                  text: phone,
                  color: AppColors.kTextColor2,
                  family: 'Montserrat-Medium',
                  size: 12,
                ),
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
