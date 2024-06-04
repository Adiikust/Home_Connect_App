import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Inquiry_View/user_inquiry_form_images_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Inquiry_View/user_inquiry_form_showcase_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Inquiry_View/user_inquiry_form_videos_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Model.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class UserInquiryFormExpansionTile extends StatelessWidget {
  final UserOrderDataModel userOrderDataModel;
  int userOrderDataIndex;
  UserInquiryFormExpansionTile(
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
                    userOrderDataModel.data[userOrderDataIndex].inquiry.name
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Email",
                    userOrderDataModel.data[userOrderDataIndex].inquiry.email
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Phone",
                    userOrderDataModel.data[userOrderDataIndex].inquiry.phone
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "City",
                    userOrderDataModel.data[userOrderDataIndex].inquiry.city
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Area",
                    userOrderDataModel.data[userOrderDataIndex].inquiry.area
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "status",
                    userOrderDataModel.data[userOrderDataIndex].inquiry.status
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                Row(
                  children: [
                    Expanded(
                      child: OutLineSmallTextButton(
                        text: 'Images',
                        clickCallback: () {
                          Get.to(
                            UserInquiryFormImagesScreen(
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
                        text: 'Videos',
                        clickCallback: () {
                          Get.to(
                            UserInquiryFormVideosScreen(
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
                        text: 'ShowCase',
                        clickCallback: () {
                          Get.to(
                            UserInquiryFormShowCaseScreen(
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
        title: BuildText(text: "Inquiry Form", size: 18),
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
            BuildSizeBox(height: Get.height * 0.004),
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
