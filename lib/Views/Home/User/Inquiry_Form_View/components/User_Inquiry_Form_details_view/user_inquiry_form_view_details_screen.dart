import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../../Utils/Exports/all_exports.dart';
import '../../user_Inquiry_form_view_model.dart';

class UserInquiryFormViewDetailsScreen extends StatelessWidget {
  final UserInquiryFormViewModel modelData;
  int modelIndex;
  UserInquiryFormViewDetailsScreen(
      {Key? key, required this.modelData, required this.modelIndex})
      : super(key: key);
  //TODO:Capitalize First Char
  String capitalizeFirstChar(String s) {
    if (s == null || s.isEmpty) {
      return s;
    }
    return s[0].toUpperCase() + s.substring(1);
  }

  @override
  Widget build(BuildContext context) {
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
                      text: "Order Details",
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_4,
                  ),
                  BuildText(
                    text: "Order Detail",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  BuildRow(
                      title: "Order ID",
                      subTitle: modelData.data![modelIndex].id.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Date",
                      subTitle: modelData.data![modelIndex].createdAt
                          .toString()
                          .substring(0, 10)),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Name",
                      subTitle: modelData.data![modelIndex].name.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Email",
                      subTitle: modelData.data![modelIndex].email.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Phone",
                      subTitle: modelData.data![modelIndex].phone.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "City",
                      subTitle: modelData.data![modelIndex].city.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Area",
                      subTitle: modelData.data![modelIndex].area.toString()),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Status",
                      subTitle: capitalizeFirstChar(
                          modelData.data![modelIndex].status.toString()),
                      color1: AppColors.kGreenColor),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Vendor Type",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        modelData.data![modelIndex].vendorTypeName!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: BuildRow(
                            title: "Vendor Name",
                            subTitle: modelData
                                .data![modelIndex].vendorTypeName![index]
                                .toString()),
                      );
                    },
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                    title: "Images",
                    subTitle:
                        modelData.data![modelIndex].image!.length.toString(),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: modelData.data![modelIndex].image!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: 60,
                                width: 105,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage(modelData
                                            .data![modelIndex].image![index]
                                            .toString())),
                                    color: AppColors.kGreenColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                    title: "Videos",
                    subTitle:
                        modelData.data![modelIndex].video!.length.toString(),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Card(
                    elevation: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: modelData.data![modelIndex].video!.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                height: 60,
                                width: 105,
                                decoration: BoxDecoration(
                                    color: AppColors.kGreenColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12))),
                                child: Center(
                                    child: Icon(
                                  Icons.video_library_outlined,
                                  size: 50,
                                )),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Like ShowCase",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: modelData.data![modelIndex].showcases!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          BuildRow(
                              title: "Name",
                              subTitle: modelData
                                  .data![modelIndex].showcases![index].name
                                  .toString()),
                          BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                          ),
                          Card(
                            elevation: 0,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: modelData.data![modelIndex]
                                      .showcases![index].imageUrl!.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Container(
                                        height: 60,
                                        width: 105,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                fit: BoxFit.fill,
                                                image: NetworkImage(modelData
                                                    .data![modelIndex]
                                                    .showcases![index]
                                                    .imageUrl![index]
                                                    .toString())),
                                            color: AppColors.kGreenColor,
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12))),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildRow extends StatelessWidget {
  String title, subTitle;
  final Color? color1, color2;
  double? size;
  FontWeight? fontWeight;
  BuildRow(
      {Key? key,
      this.color1,
      this.fontWeight,
      this.color2,
      required this.subTitle,
      required this.title,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildText(
          text: title,
          color: color2 ?? AppColors.kTextColor2,
          family: "Montserrat-SemiBold",
          size: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        BuildText(
          text: subTitle,
          color: color1 ?? AppColors.kTextColor1,
          family: "Montserrat-SemiBold",
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
