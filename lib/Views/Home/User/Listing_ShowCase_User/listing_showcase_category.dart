import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_icon_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'Listing_User/user_listing_screen.dart';
import 'ShowCase_Vendor/user_showCase_screen.dart';

class ListingShowCaseCategory extends StatefulWidget {
  String? title;
  ListingShowCaseCategory({Key? key, this.title}) : super(key: key);

  @override
  State<ListingShowCaseCategory> createState() =>
      _ListingShowCaseCategoryState();
}

class _ListingShowCaseCategoryState extends State<ListingShowCaseCategory> {
  bool _isList1Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
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
                  BuildIconButton(
                      clickCallback: () {
                        Get.back();
                      },
                      color: AppColors.kWhiteColor,
                      iconData: Icons.arrow_back_ios),
                  BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_4),
                  BuildText(
                    text: widget.title,
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: OutLineSmallTextButton(
                            textColor: _isList1Visible == true
                                ? AppColors.kWhiteColor
                                : AppColors.kTextColor2,
                            buttonColor: _isList1Visible == true
                                ? AppColors.kGreenColor
                                : AppColors.kWhiteColor,
                            text: 'Listing',
                            clickCallback: () {
                              setState(() {
                                _isList1Visible = true;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: OutLineSmallTextButton(
                          textColor: _isList1Visible == false
                              ? AppColors.kWhiteColor
                              : AppColors.kTextColor2,
                          buttonColor: _isList1Visible == false
                              ? AppColors.kGreenColor
                              : AppColors.kWhiteColor,
                          text: 'Show Case',
                          clickCallback: () {
                            setState(() {
                              _isList1Visible = false;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: _isList1Visible
                        ? UserListingScreen()
                        : UserShowCaseScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
