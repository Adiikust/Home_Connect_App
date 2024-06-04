import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Inquiry_View/User_inquiry_form_expansion_tile.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Order_Survey_View/user_survey_expansion_tile.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Steps_Images_And_Videos/user_steps_images_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Steps_Images_And_Videos/user_steps_videos_screen.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Screen/user_order_Model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class UserOrderProgressView extends StatefulWidget {
  final UserOrderDataModel userOrderDataModel;
  int userOrderDataIndex;
  UserOrderProgressView(
      {Key? key,
      required this.userOrderDataIndex,
      required this.userOrderDataModel})
      : super(key: key);

  @override
  _UserOrderProgressViewState createState() => _UserOrderProgressViewState();
}

class _UserOrderProgressViewState extends State<UserOrderProgressView> {
  String userName = "";
  String userID = "";

  @override
  Widget build(BuildContext context) {
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
                      text: "Inquiry Form",
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),

            //TODO: vendor Inquiry form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff203855).withOpacity(0.25),
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: UserInquiryFormExpansionTile(
                  userOrderDataModel: widget.userOrderDataModel,
                  userOrderDataIndex: widget.userOrderDataIndex,
                ),
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),

            //TODO: vendor survey form
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xff203855).withOpacity(0.25),
                      blurRadius: 5,
                      spreadRadius: 0,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: UserSurveyExpansionTile(
                  userOrderDataModel: widget.userOrderDataModel,
                  userOrderDataIndex: widget.userOrderDataIndex,
                ),
              ),
            ),

            //TODO: vendor Vendors form
            widget.userOrderDataModel.data[widget.userOrderDataIndex].vendors
                    .isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.userOrderDataModel
                        .data[widget.userOrderDataIndex].vendors.length,
                    itemBuilder: (context, index) {
                      userName = widget.userOrderDataModel
                          .data[widget.userOrderDataIndex].vendors[index].name
                          .toString();
                      userID = widget.userOrderDataModel
                          .data[widget.userOrderDataIndex].vendors[index].id
                          .toString();
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 8, right: 8, bottom: 40),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: [
                              BoxShadow(
                                color:
                                    const Color(0xff203855).withOpacity(0.25),
                                blurRadius: 5,
                                spreadRadius: 0,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ExpansionTile(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Column(
                                  children: [
                                    BuildSizeBox(
                                      height: Get.height *
                                          ScreenSizes.SCREEN_SIZE_2,
                                    ),
                                    widget
                                            .userOrderDataModel
                                            .data[widget.userOrderDataIndex]
                                            .vendors[index]
                                            .activities
                                            .isNotEmpty
                                        ? ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: widget
                                                .userOrderDataModel
                                                .data[widget.userOrderDataIndex]
                                                .vendors[index]
                                                .activities
                                                .length,
                                            itemBuilder: (context, indexX) {
                                              return Column(
                                                children: [
                                                  BuildVendorShowStepsData(
                                                      text:
                                                          "Task ${indexX + 1}",
                                                      dateTime: widget
                                                          .userOrderDataModel
                                                          .data[widget
                                                              .userOrderDataIndex]
                                                          .vendors[index]
                                                          .activities[indexX]
                                                          .createdAt
                                                          .toString(),
                                                      description: widget
                                                          .userOrderDataModel
                                                          .data[widget
                                                              .userOrderDataIndex]
                                                          .vendors[index]
                                                          .activities[indexX]
                                                          .comment
                                                          .toString()),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                              UserStepsImagesScreen(
                                                            userStepsImages: widget
                                                                .userOrderDataModel
                                                                .data[widget
                                                                    .userOrderDataIndex]
                                                                .vendors[index]
                                                                .activities[
                                                                    indexX]
                                                                .image,
                                                          ));
                                                        },
                                                        child: Icon(
                                                          Icons.image_outlined,
                                                          color: AppColors
                                                              .kGreenColor,
                                                          size: 25,
                                                        ),
                                                      ),
                                                      BuildSizeBox(
                                                        weight: Get.width *
                                                            ScreenSizes
                                                                .SCREEN_SIZE_5,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                              UserStepsVideosScreen(
                                                            userStepsVideos: widget
                                                                .userOrderDataModel
                                                                .data[widget
                                                                    .userOrderDataIndex]
                                                                .vendors[index]
                                                                .activities[
                                                                    indexX]
                                                                .video,
                                                          ));
                                                        },
                                                        child: Icon(
                                                          Icons
                                                              .video_library_outlined,
                                                          color: AppColors
                                                              .kGreenColor,
                                                          size: 25,
                                                        ),
                                                      ),
                                                      Spacer(),
                                                    ],
                                                  ),
                                                  const Divider(
                                                    thickness: 0,
                                                    color:
                                                        AppColors.kGreenColor,
                                                  ),
                                                  BuildSizeBox(
                                                    height: Get.height *
                                                        ScreenSizes
                                                            .SCREEN_SIZE_2,
                                                  ),
                                                ],
                                              );
                                            },
                                          )
                                        : Container(
                                            height: Get.height *
                                                ScreenSizes.SCREEN_SIZE_20,
                                            child: Center(
                                              child: BuildText(
                                                text: "Step List is Empty",
                                                color: AppColors.kTextColor1,
                                                family: "Montserrat-Regular",
                                                fontWeight: FontWeight.bold,
                                                size: 18,
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                            title: BuildText(text: userName, size: 18),
                          ),
                        ),
                      );
                    },
                  )
                : Container(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                    child: Center(
                      child: BuildText(
                        text: "Vendor Not Assign List is Empty",
                        color: AppColors.kTextColor1,
                        family: "Montserrat-Regular",
                        fontWeight: FontWeight.bold,
                        size: 18,
                      ),
                    ),
                  ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
          ],
        ),
      ),
    );
  }
}

class BuildVendorCreateStepsData extends StatelessWidget {
  String text;
  Color textColor;
  Color backGroundColor;
  String description;
  TextEditingController controller;
  BuildVendorCreateStepsData(
      {Key? key,
      required this.textColor,
      required this.backGroundColor,
      required this.description,
      required this.text,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: text,
          fontWeight: FontWeight.bold,
          size: 14,
          family: 'Montserrat-SemiBold',
          color: AppColors.kTextColor1,
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        BuildText(
          text: description,
          size: 12,
          family: 'Montserrat-Medium',
          color: AppColors.kTextColor2,
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        TextFormField(
          controller: controller,
          minLines: 3,
          maxLines: null,
          showCursor: true,
          keyboardType: TextInputType.multiline,
          cursorColor: AppColors.kGreenColor,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(12),
            hintText: "Add Comment",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: AppColors.kGreenColor)),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please add Commit';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class BuildVendorShowStepsData extends StatelessWidget {
  String text;
  String dateTime;
  String description;
  BuildVendorShowStepsData({
    Key? key,
    required this.description,
    required this.dateTime,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildText(
              text: text,
              fontWeight: FontWeight.bold,
              size: 14,
              color: AppColors.kTextColor1,
              family: 'Montserrat-SemiBold',
            ),
            BuildText(
              text: dateTime,
              color: AppColors.kGreenColor,
            ),
          ],
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        SizedBox(
            child: RichText(
          text: TextSpan(
            children: <TextSpan>[
              const TextSpan(
                  text: 'Comment : ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.kTextColor1)),
              TextSpan(
                  text: description,
                  style: const TextStyle(
                      fontSize: 11, color: AppColors.kTextColor2)),
            ],
          ),
        )),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
      ],
    );
  }
}

class BuildRowButton extends StatelessWidget {
  String title;
  final VoidCallback clickCallback;
  BuildRowButton({Key? key, required this.title, required this.clickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickCallback,
      child: Container(
        height: Get.height * 0.050,
        width: Get.width * 0.4,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(13)),
        child: Center(
            child: BuildText(
          text: title,
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
          size: 16,
        )),
      ),
    );
  }
}
