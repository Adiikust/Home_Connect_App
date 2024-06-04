import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Delete_Listing/delete_listing_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Edit_Listing_Product/edit_listing_product.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorListingModel.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorListingService.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorLstingManager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/View_Listing_&_ShowCase/Listing/view_listing_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../Utils/Exports/all_exports.dart';

class VendorListingScreen extends StatelessWidget {
  VendorListingScreen({Key? key}) : super(key: key);

  final VendorListingDeleteServices vendorListingDeleteServices =
      VendorListingDeleteServices();

  @override
  Widget build(BuildContext context) {
    VendorListingSubCategoriesIdManager vendorListingSubCategoriesIdManager =
        Provider.of(context).fetch(VendorListingSubCategoriesIdManager);
    vendorListingSubCategoriesIdManager.mainList;

    Future<void> _refresh() async {
      try {
        VendorListingSubCategoriesIdManager
            vendorListingSubCategoriesIdManager =
            Provider.of(context).fetch(VendorListingSubCategoriesIdManager);
        await vendorListingSubCategoriesIdManager.refresh();
        vendorListingSubCategoriesIdManager.mainList;
        print("Data refreshed successfully!");
      } catch (e) {
        print("Error refreshing data: $e");
      }
    }

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: RefreshIndicator(
        onRefresh: _refresh,
        color: AppColors.kWhiteColor,
        backgroundColor: AppColors.kGreenColor,
        displacement: 40.0,
        strokeWidth: 2.0,
        notificationPredicate: (notification) {
          return notification.depth == 0;
        },
        semanticsLabel: 'Refresh',
        semanticsValue: 'Refresh',
        child: Observer<List<VendorListingSubCategoriesIdModel>>(
          stream: vendorListingSubCategoriesIdManager.mainList,
          onSuccess: (context, snapshot) {
            List<VendorListingSubCategoriesIdModel>? data = snapshot;
            VendorListingSubCategoriesIdModel modelData = data![0];
            return ListView.builder(
              itemCount: modelData.data!.length,
              itemBuilder: (context, index) {
                final List<String>? dataList = modelData.data![index].imageUrl;
                return Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Card(
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
                                    image: NetworkImage(modelData
                                        .data![index].imageUrl![0]
                                        .toString())),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: BuildText(
                                      text: modelData.data![index].name
                                          .toString(),
                                      size: 16,
                                      color: AppColors.kTextColor1,
                                      fontWeight: FontWeight.bold,
                                      family: 'Montserrat-SemiBold',
                                    )),
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
                                            ? Get.to(ViewListingScreen(
                                                productID: modelData
                                                    .data![index].id
                                                    .toString(),
                                                productTitle: modelData
                                                    .data![index].name
                                                    .toString(),
                                                productPrice: modelData
                                                    .data![index].price
                                                    .toString(),
                                                productDescription: modelData
                                                    .data![index].description
                                                    .toString(),
                                                dataList: modelData
                                                    .data![index].imageUrl))
                                            : value == 1
                                                ? Get.to(EditListingProduct(
                                                    productID: modelData
                                                        .data![index].id
                                                        .toString(),
                                                    subCategoryID: modelData
                                                        .data![index]
                                                        .subCategoryId
                                                        .toString(),
                                                    productDescription:
                                                        modelData.data![index]
                                                            .description
                                                            .toString(),
                                                    productPrice: modelData
                                                        .data![index].price
                                                        .toString(),
                                                    productTitle: modelData
                                                        .data![index].name
                                                        .toString(),
                                                  ))
                                                : value == 2
                                                    ? vendorListingDeleteServices
                                                        .deleteVendorListing(
                                                            modelData.data![index].id.toString(),
                                                            context)
                                                    : Container();
                                        ;
                                      },
                                    ),
                                  ]),
                              BuildText(
                                text:
                                    "Price  ${modelData.data![index].price.toString()}",
                                size: 12,
                                color: AppColors.kTextColor2,
                                family: 'Montserrat-Regular',
                              ),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                              BuildText(
                                text: "DESCRIPTION",
                                size: 12,
                                color: AppColors.kTextColor2,
                                fontWeight: FontWeight.bold,
                                family: "Montserrat-SemiBold",
                              ),
                              BuildSizeBox(height: 3),
                              BuildText(
                                maxLines: 4,
                                text: modelData.data![index].description
                                    .toString(),
                                size: 12,
                                color: AppColors.kTextColor2,
                                family: 'Montserrat-Regular',
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          },
          onWaiting: (context) {
            return const Center(child: CircularProgressIndicator());
          },
          onError: (context, error) {
            print(error.toString());
            return Center(
              child: Text(
                "Sever Error",
                style: TextStyle(color: Colors.black),
              ),
            );
          },
        ),
      ),
    );
  }
}
