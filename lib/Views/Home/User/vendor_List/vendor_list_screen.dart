import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/listing_showcase_category.dart';
import 'package:vendor_app/Views/Home/User/vendor_List/VendorListManager.dart';
import 'package:vendor_app/Views/Home/User/vendor_List/VendorListModel.dart';
import 'package:vendor_app/Views/Widgets/build_icon_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class CategoriesVendorScreen extends StatefulWidget {
  String? title;
  CategoriesVendorScreen({Key? key, this.title}) : super(key: key);

  @override
  State<CategoriesVendorScreen> createState() => _CategoriesVendorScreenState();
}

class _CategoriesVendorScreenState extends State<CategoriesVendorScreen> {
  @override
  Widget build(BuildContext context) {
    VendorListManager vendorListManager =
        Provider.of(context).fetch(VendorListManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer<List<VendorListModel>>(
                stream: vendorListManager.mainList,
                onSuccess: (context, snapshot) {
                  List<VendorListModel>? data = snapshot;
                  VendorListModel modelData = data![0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: "Home Decoration",
                        color: AppColors.kTextColor1,
                        fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 20,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: "Choose Any One to Continue",
                        color: AppColors.kTextColor2,
                        family: "Montserrat-SemiBold",
                        size: 15,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: modelData.data.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Overseer.vendorListingID =
                                  modelData.data[index].id.toString();
                              Get.to(ListingShowCaseCategory(
                                title: modelData.data[index].name,
                              ));
                            },
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 3),
                                      child: Container(
                                        height: 150,
                                        width: 140,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.cover,
                                                image: NetworkImage(
                                                  modelData.data[index].imageUrl
                                                      .toString(),
                                                )),
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    BuildSizeBox(
                                        weight: Get.width *
                                            ScreenSizes.SCREEN_SIZE_1),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BuildText(
                                            text: modelData.data[index].name
                                                .toString(),
                                            color: AppColors.kTextColor1,
                                            fontWeight: FontWeight.bold,
                                            family: "Montserrat-SemiBold",
                                            size: 16,
                                          ),
                                          BuildSizeBox(
                                              height: Get.height *
                                                  ScreenSizes.SCREEN_SIZE_1),
                                          BuildText(
                                            text: "DESCRIPTION",
                                            color: AppColors.kTextColor2,
                                            fontWeight: FontWeight.bold,
                                            family: "Montserrat-SemiBold",
                                            size: 12,
                                          ),
                                          BuildSizeBox(height: 3),
                                          BuildText(
                                            text:
                                                "modelData.data!.vendorlistingData![index].description.toString()",
                                            color: AppColors.kTextColor2,
                                            family: "Montserrat-Regular",
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
                onWaiting: (context) {
                  return const Center(child: CircularProgressIndicator());
                },
                onError: (context, error) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_15),
                        SvgPicture.asset(
                          "images/bklogo.svg",
                          height: 200,
                          width: 30,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
