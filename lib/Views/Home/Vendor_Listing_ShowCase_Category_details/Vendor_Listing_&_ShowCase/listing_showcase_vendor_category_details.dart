import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendor_listing_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendor_showCase_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileManager.dart';
import 'package:vendor_app/Views/Widgets/Vebdor_Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_model.dart';

class ListingShowCaseVendorCategoryDetails extends StatefulWidget {
  const ListingShowCaseVendorCategoryDetails({Key? key}) : super(key: key);

  @override
  State<ListingShowCaseVendorCategoryDetails> createState() =>
      _ListingShowCaseVendorCategoryDetailsState();
}

class _ListingShowCaseVendorCategoryDetailsState
    extends State<ListingShowCaseVendorCategoryDetails> {
  bool _isList1Visible = true;
  late int tappedIndex;

  @override
  void initState() {
    super.initState();
    tappedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    SubCategoriesIdBaseListingShowManager
        subCategoriesIdBaseListingShowManager =
        Provider.of(context).fetch(SubCategoriesIdBaseListingShowManager);

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Column(
        children: [
          Container(
            height: 40,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/small_appbar.png"),
                  fit: BoxFit.fill),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: VendorOutLineSmallTextButton(
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
                      Expanded(
                        child: VendorOutLineSmallTextButton(
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
                    ],
                  ),
                ),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                ),
                _isList1Visible
                    ? Observer<List<SubCategoriesIdBaseListingShowModel>>(
                        stream: subCategoriesIdBaseListingShowManager.mainList,
                        onSuccess: (context, snapshot) {
                          List<SubCategoriesIdBaseListingShowModel>? data =
                              snapshot;
                          SubCategoriesIdBaseListingShowModel modelData =
                              data![0];
                          Overseer.vendorListingSubCategoriesID1 =
                              modelData.data[0].id.toString();
                          print(
                              "######## vendorListingSubCategoriesID 1 ${Overseer.vendorListingSubCategoriesID1.toString()}");
                          return Container(
                            width: double.infinity,
                            height: 30,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: modelData.data.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          tappedIndex = index;
                                          Overseer.vendorListingSubCategoriesID =
                                              modelData.data[index].id
                                                  .toString();
                                          Overseer.vendorListingSubCategoriesID1 =
                                              "";
                                          print(
                                              "######## vendorListingSubCategoriesID 2 ${Overseer.vendorListingSubCategoriesID.toString()}");
                                        });
                                      },
                                      child: Container(
                                        height: Get.height *
                                            ScreenSizes.SCREEN_SIZE_3,
                                        width: Get.width *
                                            ScreenSizes.SCREEN_SIZE_40,
                                        decoration: BoxDecoration(
                                          color: tappedIndex == index
                                              ? AppColors.kGreenColor
                                              : AppColors.kWhiteColor,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                              color: AppColors.kGreenColor,
                                              width: 1),
                                        ),
                                        child: Center(
                                            child: BuildText(
                                          color: tappedIndex == index
                                              ? AppColors.kWhiteColor
                                              : AppColors.kTextColor2,
                                          size: 12,
                                          text: modelData.data[index].name
                                              .toString(),
                                          fontWeight: FontWeight.bold,
                                          family: "Montserrat-Regular",
                                        )),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                        onWaiting: (context) {
                          return const Center(
                              child: CircularProgressIndicator());
                        },
                        onError: (context, error) {
                          return Center(
                            child: Text(
                              "Sever Error",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        },
                      )
                    : Container(),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                ),
                Expanded(
                    child: _isList1Visible
                        ? VendorListingScreen()
                        : VendorShowCaseScreen()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
