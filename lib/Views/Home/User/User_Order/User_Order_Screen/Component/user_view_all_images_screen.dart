import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class UserViewAllImagesScreen extends StatelessWidget {
  UserViewAllImagesScreen({Key? key}) : super(key: key);
  List img = [
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
  ];

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    String dateStr = datetime.toString();
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/small_appbar.png"),
                  fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "View All Images",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: img.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            height: 250,
                            width: double.infinity,
                            child: Image.asset(
                              img[index],
                              fit: BoxFit.fill,
                            )),
                        BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                        ),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                        buildRow("Update Time", dateStr),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                        buildRow("Update By", "Vendor"),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow(String? key, dateStr) {
    return Row(
      children: [
        BuildText(
          text: key,
          size: 12,
          family: 'Montserrat-Regular',
          fontWeight: FontWeight.bold,
          color: AppColors.kTextColor1,
        ),
        BuildSizeBox(
          weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
        ),
        BuildText(
          text: dateStr,
          size: 12,
          family: 'Montserrat-Regular',
          color: AppColors.kTextColor2,
        ),
      ],
    );
  }
}
