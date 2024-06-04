import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/User/Vendor_type/vendor_type_manager.dart';
import 'package:vendor_app/Views/Home/User/Vendor_type/vendor_type_model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../Utils/Exports/all_exports.dart';
import '../../../Widgets/build_icon_button.dart';
import 'form_view.dart';

class SelectVendorTypeScreen extends StatefulWidget {
  String title;
  SelectVendorTypeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<SelectVendorTypeScreen> createState() => _SelectVendorTypeScreenState();
}

class _SelectVendorTypeScreenState extends State<SelectVendorTypeScreen> {
  @override
  Widget build(BuildContext context) {
    VendorTypeManager vendorTypeManager =
        Provider.of(context).fetch(VendorTypeManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_2),
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
              child: Observer<List<VendorTypeModel>>(
                stream: vendorTypeManager.mainList,
                onSuccess: (context, snapshot) {
                  List<VendorTypeModel>? data = snapshot;
                  VendorTypeModel modelData = data![0];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: widget.title,
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
                          return index % 2 == 0
                              ? InkWell(
                                  onTap: () {
                                    setState(() {
                                      String idString =
                                          modelData.data[index].id.toString();
                                      if (Overseer
                                          .inquirySubCategoriesVendorTypeIdList
                                          .contains(idString)) {
                                        Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .remove(idString);
                                      } else {
                                        Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .add(idString);
                                      }
                                      print(
                                          "inquirySubCategoriesVendorTypeIdList ############${Overseer.inquirySubCategoriesVendorTypeIdList}");
                                    });
                                  },
                                  child: Card(
                                    color: Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .contains(modelData.data[index].id
                                                .toString())
                                        ? AppColors.kGreenColor
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                                        modelData.data[index]
                                                            .imageUrl
                                                            .toString(),
                                                      )),
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                  text: modelData
                                                      .data[index].name
                                                      .toString(),
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor1,
                                                  fontWeight: FontWeight.bold,
                                                  family: "Montserrat-SemiBold",
                                                  size: 16,
                                                ),
                                                BuildSizeBox(
                                                    height: Get.height *
                                                        ScreenSizes
                                                            .SCREEN_SIZE_1),
                                                BuildText(
                                                  text: "DESCRIPTION",
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor2,
                                                  fontWeight: FontWeight.bold,
                                                  family: "Montserrat-SemiBold",
                                                  size: 12,
                                                ),
                                                BuildSizeBox(height: 3),
                                                BuildText(
                                                  text: modelData
                                                      .data[index].description
                                                      .toString(),
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor2,
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
                                )
                              : InkWell(
                                  onTap: () {
                                    setState(() {
                                      String idString =
                                          modelData.data[index].id.toString();
                                      if (Overseer
                                          .inquirySubCategoriesVendorTypeIdList
                                          .contains(idString)) {
                                        Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .remove(idString);
                                      } else {
                                        Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .add(idString);
                                      }
                                      print(
                                          "inquirySubCategoriesVendorTypeIdList ############${Overseer.inquirySubCategoriesVendorTypeIdList}");
                                    });
                                  },
                                  child: Card(
                                    color: Overseer
                                            .inquirySubCategoriesVendorTypeIdList
                                            .contains(modelData.data[index].id
                                                .toString())
                                        ? AppColors.kGreenColor
                                        : Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          BuildSizeBox(
                                              weight: Get.width *
                                                  ScreenSizes.SCREEN_SIZE_1),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BuildText(
                                                  text: modelData
                                                      .data[index].name
                                                      .toString(),
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor1,
                                                  fontWeight: FontWeight.bold,
                                                  family: "Montserrat-SemiBold",
                                                  size: 16,
                                                ),
                                                BuildSizeBox(
                                                    height: Get.height *
                                                        ScreenSizes
                                                            .SCREEN_SIZE_1),
                                                BuildText(
                                                  text: "DESCRIPTION",
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor2,
                                                  fontWeight: FontWeight.bold,
                                                  family: "Montserrat-SemiBold",
                                                  size: 12,
                                                ),
                                                BuildSizeBox(height: 3),
                                                BuildText(
                                                  text: modelData
                                                      .data[index].description
                                                      .toString(),
                                                  color: Overseer
                                                          .inquirySubCategoriesVendorTypeIdList
                                                          .contains(modelData
                                                              .data[index].id
                                                              .toString())
                                                      ? AppColors.kWhiteColor
                                                      : AppColors.kTextColor2,
                                                  family: "Montserrat-Regular",
                                                  size: 12,
                                                ),
                                              ],
                                            ),
                                          ),
                                          BuildSizeBox(
                                              weight: Get.width *
                                                  ScreenSizes.SCREEN_SIZE_1),
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
                                                        modelData.data[index]
                                                            .imageUrl
                                                            .toString(),
                                                      )),
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            ),
                                          ),
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
                      children: [
                        BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_6,
                        ),
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
            )
          ],
        ),
      ),
      bottomNavigationBar:
          Overseer.inquirySubCategoriesVendorTypeIdList.length != 0
              ? Container(
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextBottun(
                        text: 'Continue',
                        clickCallback: () {
                          Get.to(FormView());
                        }),
                  ),
                )
              : Container(height: 0, color: AppColors.kWhiteColor),
    );
  }
}
