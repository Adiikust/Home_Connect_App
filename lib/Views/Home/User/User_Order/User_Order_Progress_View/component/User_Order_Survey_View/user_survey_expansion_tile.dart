import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Survey_View/user_survey_form_images_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Survey_View/user_survey_form_videos_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../../Widgets/Outline_small_text_button.dart';

class UserSurveyExpansionTile extends StatelessWidget {
  final UserOrderDataModel userOrderDataModel;
  int userOrderDataIndex;
  UserSurveyExpansionTile(
      {Key? key,
      required this.userOrderDataModel,
      required this.userOrderDataIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: AppColors.kWhiteColor),
      child: ExpansionTile(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              children: [
                buildContainer(
                    "Name",
                    userOrderDataModel.data[userOrderDataIndex].survey.name
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Email",
                    userOrderDataModel.data[userOrderDataIndex].survey.email
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Phone",
                    userOrderDataModel.data[userOrderDataIndex].survey.phone
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "City",
                    userOrderDataModel.data[userOrderDataIndex].survey.city
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Area",
                    userOrderDataModel.data[userOrderDataIndex].survey.area
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Status",
                    userOrderDataModel.data[userOrderDataIndex].survey.status
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                Row(
                  children: [
                    Expanded(
                      child: OutLineSmallTextButton(
                        text: 'View Images',
                        clickCallback: () {
                          Get.to(
                            UserSurveyFormImagesScreen(
                              userOrderDataIndex: userOrderDataIndex,
                              userOrderDataModel: userOrderDataModel,
                            ),
                          );
                        },
                        textColor: AppColors.kGreenColor,
                      ),
                    ),
                    BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_2),
                    Expanded(
                      child: OutLineSmallTextButton(
                        text: 'View Videos',
                        clickCallback: () {
                          Get.to(
                            UserSurveyFormVideosScreen(
                              userOrderDataIndex: userOrderDataIndex,
                              userOrderDataModel: userOrderDataModel,
                            ),
                          );
                        },
                        textColor: AppColors.kGreenColor,
                      ),
                    ),
                  ],
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
              ],
            ),
          ),
        ],
        title: BuildText(text: "Survey Form", size: 18),
      ),
    );
  }

  Container buildContainer(String title, subtitle) {
    return Container(
      width: double.infinity,
      height: Get.height * 0.09,
      decoration: BoxDecoration(
          color: AppColors.kCardDArkColor,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BuildText(
                text: title,
                fontWeight: FontWeight.bold,
                size: 16,
                color: AppColors.kTextColor1,
                family: 'Montserrat-SemiBold'),
            BuildSizeBox(height: Get.height * 0.002),
            BuildText(
                text: subtitle,
                size: 14,
                color: AppColors.kTextColor2,
                family: 'Montserrat-Medium'),
          ],
        ),
      ),
    );
  }
}
