import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Add_ShowCase_Item/add_showCase_product.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Delete_showCase/delete_showcase_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Edit_ShowCase/edit_showcas_product.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseManager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/showcase_screen/vendorShowcaseModel.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../Utils/Exports/all_exports.dart';
import '../../View_Listing_&_ShowCase/ShowCase/view_showcase_screen.dart';

class VendorShowCaseScreen extends StatelessWidget {
  VendorShowCaseScreen({Key? key}) : super(key: key);
  final VendorShowCaseDeleteServices vendorShowCaseDeleteServices =
      VendorShowCaseDeleteServices();

  List img = [
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
  ];

  @override
  Widget build(BuildContext context) {
    VendorShowCaseManager vendorShowCaseManager =
        Provider.of(context).fetch(VendorShowCaseManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Observer<List<VendorShowCaseModel>>(
        stream: vendorShowCaseManager.mainList,
        onSuccess: (context, snapshot) {
          List<VendorShowCaseModel>? data = snapshot;
          VendorShowCaseModel modelData = data![0];
          return ListView.builder(
            itemCount: modelData.data!.length,
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
                        child: ImageSlideshow(
                          initialPage: 4,
                          indicatorColor: AppColors.kGreenColor,
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                          ],
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3000,
                          isLoop: true,
                        ),
                      ),
                      BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildText(
                            text: modelData.data![index].name.toString(),
                            size: 18,
                            family: 'Montserrat-SemiBold',
                            fontWeight: FontWeight.bold,
                            color: AppColors.kTextColor1,
                          ),
                          PopupMenuButton(
                            icon: new Icon(Icons.more_vert,
                                color: AppColors.kTextColor2),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8.0),
                                bottomRight: Radius.circular(8.0),
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            elevation: 10,
                            color: AppColors.kWhiteColor,
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  value: 0,
                                  child: BuildText(
                                    text: 'View',
                                    size: 12,
                                    color: AppColors.kTextColor2,
                                    family: 'Montserrat-Regular',
                                  ),
                                ),
                                PopupMenuItem(
                                  value: 1,
                                  child: BuildText(
                                    text: 'Edit',
                                    size: 12,
                                    color: AppColors.kTextColor2,
                                    family: 'Montserrat-Regular',
                                  ),
                                ),
                                PopupMenuItem(
                                  onTap: () {
                                    print(modelData.data![index].id.toString());
                                    vendorShowCaseDeleteServices
                                        .deleteVendorShowCase(
                                            context: context,
                                            subCategoriesId: modelData
                                                .data![index].id
                                                .toString());
                                  },
                                  value: 2,
                                  child: BuildText(
                                    text: 'Delete',
                                    size: 12,
                                    color: AppColors.kTextColor2,
                                    family: 'Montserrat-Regular',
                                  ),
                                )
                              ];
                            },
                            onSelected: (int value) {
                              value == 0
                                  ? Get.to(ViewShowCaseScreen(
                                      productID:
                                          modelData.data![index].id.toString(),
                                      productDescription: modelData
                                          .data![index].description
                                          .toString(),
                                      productTitle: modelData.data![index].name
                                          .toString(),
                                      dataList: modelData.data![index].imageUrl,
                                    ))
                                  : value == 1
                                      ? Get.to(EditShowCaseProduct(
                                          productID: modelData.data![index].id
                                              .toString(),
                                          productSubID: modelData
                                              .data![index].subCategoryId
                                              .toString(),
                                          productTitle: modelData
                                              .data![index].name
                                              .toString(),
                                          productDescription: modelData
                                              .data![index].description
                                              .toString(),
                                        ))
                                      : SizedBox();
                            },
                          ),
                        ],
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: modelData.data![index].description.toString(),
                        size: 12,
                        family: 'Montserrat-Regular',
                        color: AppColors.kTextColor2,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    ],
                  ),
                ),
              );
            },
          );
        },
        onWaiting: (context) {
          return const Center(
              child: CircularProgressIndicator(
            color: AppColors.kGreenColor,
          ));
        },
        onError: (context, error) {
          return Center(
            child: Text(
              "Sever Error",
              style: TextStyle(color: Colors.black),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kGreenColor,
        onPressed: () {
          Get.to(() => const AddShowCaseProduct());
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
