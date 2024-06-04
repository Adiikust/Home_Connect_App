import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/Component/vendor_view_all_images_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/Component/vendor_view_all_videos_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/vendor_order_progress_view.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorOrderScreen extends StatefulWidget {
  const VendorOrderScreen({Key? key}) : super(key: key);

  @override
  State<VendorOrderScreen> createState() => _VendorOrderScreenState();
}

class _VendorOrderScreenState extends State<VendorOrderScreen> {
  bool _isList1Visible = true;
  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();

    VendorOrderManager vendorOrderManager =
        Provider.of(context).fetch(VendorOrderManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "Your Orders",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "All Your Orders Will Show Here",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-SemiBold",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  Observer<List<VendorOrderDataModel>>(
                    stream: vendorOrderManager.mainList,
                    onSuccess: (context, snapshot) {
                      List<VendorOrderDataModel>? data = snapshot;
                      VendorOrderDataModel modelData = data![0];
                      if (modelData.data.isNotEmpty) {
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: modelData.data.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(VendorOrderProgressView(
                                  vendorOrderDataIndex: index,
                                  vendorOrderDataModel: modelData,
                                ));
                              },
                              child: Card(
                                elevation: 2,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          BuildText(
                                            fontWeight: FontWeight.bold,
                                            text: "Order Id : ",
                                            color: AppColors.kTextColor1,
                                            family: 'Montserrat-SemiBold',
                                            size: 12,
                                          ),
                                          BuildText(
                                            fontWeight: FontWeight.bold,
                                            text: modelData.data[index].id
                                                .toString(),
                                            color: AppColors.kTextColor2,
                                            family: 'Montserrat-Regular',
                                            size: 12,
                                          ),
                                          BuildSizeBox(
                                              weight: Get.width *
                                                  ScreenSizes.SCREEN_SIZE_010),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: buildContainerButton(
                                                datetime,
                                                "Image",
                                                "Update Time",
                                                "Update By : Admin",
                                                _isList1Visible == true
                                                    ? AppColors.kGreenColor
                                                    : AppColors.kCardDArkColor,
                                                _isList1Visible == true
                                                    ? AppColors.kWhiteColor
                                                    : AppColors.kWhiteColor,
                                                () {
                                                  setState(() {
                                                    _isList1Visible = true;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: buildContainerButton(
                                                datetime,
                                                "Video",
                                                "Update Time",
                                                "Update By : Admin",
                                                _isList1Visible == false
                                                    ? AppColors.kGreenColor
                                                    : AppColors.kCardDArkColor,
                                                _isList1Visible == false
                                                    ? AppColors.kWhiteColor
                                                    : AppColors.kWhiteColor,
                                                () {
                                                  setState(() {
                                                    _isList1Visible = false;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Stack(
                                        children: [
                                          //TODO:Video Method is Missing
                                          _isList1Visible
                                              ? modelData.data[index].vendors[0]
                                                          .activities.length !=
                                                      0
                                                  ? Image.network(
                                                      modelData
                                                          .data[index]
                                                          .vendors[0]
                                                          .activities[0]
                                                          .image[0]
                                                          .toString(),
                                                      height: 200,
                                                      width: double.infinity,
                                                      fit: BoxFit.cover,
                                                    )
                                                  : buildImage()
                                              : buildImage(),
                                          Positioned(
                                            right: 0,
                                            child: IconButton(
                                              onPressed: () {
                                                _isList1Visible
                                                    ? Get.defaultDialog(
                                                        title: "Image",
                                                        content: const Text(""),
                                                        actions: [
                                                          SizedBox(
                                                            height: Get.height *
                                                                ScreenSizes
                                                                    .SCREEN_SIZE_40,
                                                            width:
                                                                double.infinity,
                                                            child: modelData
                                                                        .data[
                                                                            index]
                                                                        .vendors[
                                                                            0]
                                                                        .activities
                                                                        .length !=
                                                                    0
                                                                ? Image.network(
                                                                    modelData
                                                                        .data[
                                                                            index]
                                                                        .vendors[
                                                                            0]
                                                                        .activities[
                                                                            0]
                                                                        .image[
                                                                            0]
                                                                        .toString(),
                                                                    fit: BoxFit
                                                                        .contain)
                                                                : Image.asset(
                                                                    width: double
                                                                        .infinity,
                                                                    AppImages
                                                                        .BIRDSDETAILS1,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                          ),
                                                        ],
                                                      )
                                                    : Get.defaultDialog(
                                                        title: "Video",
                                                        content: const Text(""),
                                                        actions: [
                                                            SizedBox(
                                                              height: Get
                                                                      .height *
                                                                  ScreenSizes
                                                                      .SCREEN_SIZE_40,
                                                              width: double
                                                                  .infinity,
                                                              child: SizedBox(),
                                                            )
                                                          ]);
                                              },
                                              icon: Icon(
                                                Icons.remove_red_eye,
                                                color: AppColors.kGreenColor,
                                                size: 30,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 0,
                                            bottom: 0,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20, right: 5),
                                              child: OutlinedButton(
                                                style: OutlinedButton.styleFrom(
                                                  side: BorderSide(
                                                      color:
                                                          AppColors.kGreenColor,
                                                      width: 1),
                                                ),
                                                onPressed: () {
                                                  _isList1Visible
                                                      ? Get.to(
                                                          VendorViewAllImagesScreen(
                                                              activitiesImages:
                                                                  modelData
                                                                      .data[
                                                                          index]
                                                                      .vendors[
                                                                          0]
                                                                      .activities))
                                                      : Get.to(
                                                          VendorViewAllVideosScreen(
                                                          activitiesVideos:
                                                              modelData
                                                                  .data[index]
                                                                  .vendors[0]
                                                                  .activities,
                                                        ));
                                                },
                                                child: BuildText(
                                                  text: "View All",
                                                  size: 12,
                                                  color: AppColors.kGreenColor,
                                                  fontWeight: FontWeight.bold,
                                                  family: 'Montserrat-SemiBold',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      BuildSizeBox(
                                          height: Get.height *
                                              ScreenSizes.SCREEN_SIZE_1),
                                      myRow(
                                          key: "Latest Update : ",
                                          value: modelData
                                                      .data[index]
                                                      .vendors[0]
                                                      .activities
                                                      .length !=
                                                  0
                                              ? modelData.data[index].vendors[0]
                                                  .activities[0].comment
                                                  .toString()
                                              : "No Updated Comment"),
                                      myRow(
                                          key: "Update Time  : ",
                                          value: modelData
                                                      .data[index]
                                                      .vendors[0]
                                                      .activities
                                                      .length !=
                                                  0
                                              ? "${modelData.data[index].vendors[0].activities[0].createdAt.toString()} : ${modelData.data[index].vendors[0].name.toString()}"
                                              : "No Update Time "),
                                      BuildSizeBox(
                                          height: Get.height *
                                              ScreenSizes.SCREEN_SIZE_010),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        return Container(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                          child: Center(
                            child: BuildText(
                              text: "No Order Found",
                              color: AppColors.kTextColor1,
                              family: "Montserrat-Regular",
                              fontWeight: FontWeight.bold,
                              size: 18,
                            ),
                          ),
                        );
                      }
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Image buildImage() {
    return Image.asset(
      height: 200,
      width: double.infinity,
      AppImages.BIRDSDETAILS1,
      fit: BoxFit.cover,
    );
  }

  InkWell buildContainerButton(DateTime datetime, String title, time, name,
      Color color, Color tColor, VoidCallback clickCallback) {
    return InkWell(
      onTap: clickCallback,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        width: double.infinity,
        child: Column(
          children: [
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
            BuildText(
              text: title,
              color: tColor,
              family: "Montserrat-SemiBold",
              size: 16,
              fontWeight: FontWeight.bold,
            ),
            BuildText(
              text:
                  "${time} : ${datetime.hour.toString() + ":" + datetime.minute.toString() + ":" + datetime.second.toString()}",
              color: tColor,
              family: "Montserrat-Regular",
              size: 10,
            ),
            BuildText(
              text: name,
              color: tColor,
              family: "Montserrat-Regular",
              size: 10,
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
          ],
        ),
      ),
    );
  }

  Widget myRow({required String key, required String value}) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
              text: key,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.kTextColor1,
                  fontFamily: 'Montserrat-Regular',
                  fontSize: 11)),
          TextSpan(
              text: value,
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.kTextColor2,
                fontFamily: 'Montserrat-Regular',
              )),
        ],
      ),
    );
  }
}
