import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorInquiryFormShowCaseScreen extends StatelessWidget {
  final VendorOrderDataModel vendorOrderDataModel;
  int vendorOrderDataIndex;
  VendorInquiryFormShowCaseScreen(
      {Key? key,
      required this.vendorOrderDataModel,
      required this.vendorOrderDataIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Inquiry View ShowCase",
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: vendorOrderDataModel
                      .data[vendorOrderDataIndex].inquiry.showcases.isNotEmpty
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: vendorOrderDataModel
                          .data[vendorOrderDataIndex].inquiry.showcases.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  height: 300,
                                  width: double.infinity,
                                  vendorOrderDataModel
                                      .data[vendorOrderDataIndex]
                                      .inquiry
                                      .showcases[index]
                                      .imageUrl[0]
                                      .toString(),
                                  fit: BoxFit.fill,
                                ),
                                BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_2,
                                ),
                                BuildText(
                                  text: vendorOrderDataModel
                                      .data[vendorOrderDataIndex]
                                      .inquiry
                                      .showcases[index]
                                      .name
                                      .toString(),
                                  color: AppColors.kTextColor1,
                                  fontWeight: FontWeight.bold,
                                  family: "Montserrat-SemiBold",
                                  size: 20,
                                ),
                                BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1,
                                ),
                                BuildText(
                                  text: vendorOrderDataModel
                                      .data[vendorOrderDataIndex]
                                      .inquiry
                                      .showcases[index]
                                      .description
                                      .toString(),
                                  color: AppColors.kTextColor2,
                                  family: "Montserrat-Regular",
                                  size: 14,
                                ),
                                BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Container(
                      height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                      child: Center(
                        child: BuildText(
                          text: "Inquiry ShowCase List is Empty",
                          color: AppColors.kTextColor1,
                          family: "Montserrat-Regular",
                          fontWeight: FontWeight.bold,
                          size: 18,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextBottun(
          text: "Back",
          clickCallback: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
