import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Order_Inquiry_View/vendor_inquiry_form_images_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Order_Inquiry_View/vendor_inquiry_form_showcase_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Order_Inquiry_View/vendor_inquiry_form_videos_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorInquiryFormExpansionTile extends StatelessWidget {
  final VendorOrderDataModel vendorOrderDataModel;
  int vendorOrderDataIndex;
  VendorInquiryFormExpansionTile(
      {Key? key,
      required this.vendorOrderDataModel,
      required this.vendorOrderDataIndex})
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
                    vendorOrderDataModel.data[vendorOrderDataIndex].inquiry.name
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Email",
                    vendorOrderDataModel
                        .data[vendorOrderDataIndex].inquiry.email
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Phone",
                    vendorOrderDataModel
                        .data[vendorOrderDataIndex].inquiry.phone
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "City",
                    vendorOrderDataModel.data[vendorOrderDataIndex].inquiry.city
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "Area",
                    vendorOrderDataModel.data[vendorOrderDataIndex].inquiry.area
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildContainer(
                    "status",
                    vendorOrderDataModel
                        .data[vendorOrderDataIndex].inquiry.status
                        .toString()),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                Row(
                  children: [
                    Expanded(
                      child: OutLineSmallTextButton(
                        text: 'Images',
                        clickCallback: () {
                          Get.to(
                            VendorInquiryFormImagesScreen(
                              vendorOrderDataIndex: vendorOrderDataIndex,
                              vendorOrderDataModel: vendorOrderDataModel,
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
                            VendorInquiryFormVideosScreen(
                              vendorOrderDataIndex: vendorOrderDataIndex,
                              vendorOrderDataModel: vendorOrderDataModel,
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
                            VendorInquiryFormShowCaseScreen(
                              vendorOrderDataIndex: vendorOrderDataIndex,
                              vendorOrderDataModel: vendorOrderDataModel,
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
