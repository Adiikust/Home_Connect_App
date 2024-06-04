import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Add_Step/vendor_add_step_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Add_Step/vendor_add_step_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Step_Delete/vendor_step_delete_services.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Steps_Images_And_Videos/vendor_steps_images_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Progress_View/component/Vendor_Steps_Images_And_Videos/vendor_steps_videos_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Order/Vendor_Order_Screen/vendor_order_Model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'component/Vendor_Order_Inquiry_View/Vendor_inquiry_form_expansion_tile.dart';
import 'component/Vendor_Order_Survey_View/vendor_survey_expansion_tile.dart';

class VendorOrderProgressView extends StatefulWidget {
  final VendorOrderDataModel vendorOrderDataModel;
  int vendorOrderDataIndex;
  VendorOrderProgressView(
      {Key? key,
      required this.vendorOrderDataIndex,
      required this.vendorOrderDataModel})
      : super(key: key);

  @override
  _VendorOrderProgressViewState createState() =>
      _VendorOrderProgressViewState();
}

class _VendorOrderProgressViewState extends State<VendorOrderProgressView> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _taskAddController = TextEditingController();

  String vendorName = "";
  String vendorID = "";

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
                child: VendorInquiryFormExpansionTile(
                  vendorOrderDataModel: widget.vendorOrderDataModel,
                  vendorOrderDataIndex: widget.vendorOrderDataIndex,
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
                child: VendorSurveyExpansionTile(
                  vendorOrderDataModel: widget.vendorOrderDataModel,
                  vendorOrderDataIndex: widget.vendorOrderDataIndex,
                ),
              ),
            ),

            //TODO: vendor Vendors form
            widget.vendorOrderDataModel.data[widget.vendorOrderDataIndex]
                    .vendors.isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: widget.vendorOrderDataModel
                        .data[widget.vendorOrderDataIndex].vendors.length,
                    itemBuilder: (context, index) {
                      vendorName = widget.vendorOrderDataModel
                          .data[widget.vendorOrderDataIndex].vendors[index].name
                          .toString();
                      vendorID = widget.vendorOrderDataModel
                          .data[widget.vendorOrderDataIndex].vendors[index].id
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
                                    Overseer.userLoginID == vendorID
                                        ? Form(
                                            key: _formKey,
                                            child: BuildVendorCreateStepsData(
                                              text: "Add Task",
                                              description:
                                                  "I am A Flutter developer",
                                              controller: _taskAddController,
                                              textColor: AppColors.kWhiteColor,
                                              backGroundColor:
                                                  AppColors.kGreenColor,
                                            ),
                                          )
                                        : SizedBox(),
                                    BuildSizeBox(
                                        height: Get.height *
                                            ScreenSizes.SCREEN_SIZE_2),
                                    Overseer.userLoginID == vendorID
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              BuildRowButton(
                                                  title: "+ Gallery",
                                                  clickCallback: () {
                                                    Get.to(
                                                        VendorAddStepScreen());
                                                  }),
                                              Consumer<
                                                  VendorAddStepFormService>(
                                                builder: (context,
                                                    vendorAddStepFormData,
                                                    child) {
                                                  return BuildRowButton(
                                                      title: "Submit",
                                                      clickCallback: () {
                                                        if (Overseer
                                                                .vendorOrderAddStepImageFile
                                                                .isNotEmpty ||
                                                            Overseer
                                                                .vendorOrderAddStepVideosFile
                                                                .isNotEmpty) {
                                                          if (_formKey
                                                              .currentState!
                                                              .validate()) {
                                                            showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return Center(
                                                                      child:
                                                                          CircularPercentIndicator(
                                                                    radius:
                                                                        120.0,
                                                                    lineWidth:
                                                                        13.0,
                                                                    animation:
                                                                        true,
                                                                    percent:
                                                                        vendorAddStepFormData.percentage /
                                                                            100,
                                                                    center:
                                                                        new Text(
                                                                      "${vendorAddStepFormData.percentage}%",
                                                                      style: new TextStyle(
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              20.0),
                                                                    ),
                                                                    circularStrokeCap:
                                                                        CircularStrokeCap
                                                                            .round,
                                                                    progressColor:
                                                                        AppColors
                                                                            .kGreenColor,
                                                                  ));
                                                                },
                                                                barrierDismissible:
                                                                    false);
                                                            vendorAddStepFormData
                                                                .postVendorAddStepData(
                                                                    inquiryId: widget
                                                                        .vendorOrderDataModel
                                                                        .data[widget
                                                                            .vendorOrderDataIndex]
                                                                        .id
                                                                        .toString(),
                                                                    userId: widget
                                                                        .vendorOrderDataModel
                                                                        .data[widget
                                                                            .vendorOrderDataIndex]
                                                                        .inquiry
                                                                        .userId
                                                                        .toString(),
                                                                    comment: _taskAddController
                                                                        .text
                                                                        .toString()
                                                                        .trim(),
                                                                    images: Overseer
                                                                        .vendorOrderAddStepImageFile,
                                                                    videos: Overseer
                                                                        .vendorOrderAddStepVideosFile,
                                                                    audios: Overseer
                                                                        .vendorOrderAddStepAudioFile,
                                                                    context:
                                                                        context)
                                                                .then((value) {
                                                              _taskAddController
                                                                  .clear();
                                                              Overseer
                                                                  .vendorOrderAddStepImageFile
                                                                  .clear();
                                                              Overseer
                                                                  .vendorOrderAddStepVideosFile
                                                                  .clear();
                                                              Overseer
                                                                  .vendorOrderAddStepAudioFile
                                                                  .clear();
                                                            });
                                                          }
                                                        } else {
                                                          Get.snackbar(
                                                            "Message",
                                                            backgroundColor:
                                                                AppColors
                                                                    .kDArkBlackColor,
                                                            "Please Add Gallery Data",
                                                            icon: const Icon(
                                                                Icons
                                                                    .error_outline,
                                                                color: Colors
                                                                    .white),
                                                            snackPosition:
                                                                SnackPosition
                                                                    .TOP,
                                                          );
                                                        }
                                                      });
                                                },
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    Overseer.userLoginID == vendorID
                                        ? BuildSizeBox(
                                            height: Get.height *
                                                ScreenSizes.SCREEN_SIZE_2,
                                          )
                                        : SizedBox(),
                                    Overseer.userLoginID == vendorID
                                        ? const Divider(
                                            color: AppColors.kGreenColor,
                                          )
                                        : SizedBox(),
                                    widget
                                            .vendorOrderDataModel
                                            .data[widget.vendorOrderDataIndex]
                                            .vendors[index]
                                            .activities
                                            .isNotEmpty
                                        ? ListView.builder(
                                            physics:
                                                NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: widget
                                                .vendorOrderDataModel
                                                .data[
                                                    widget.vendorOrderDataIndex]
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
                                                          .vendorOrderDataModel
                                                          .data[widget
                                                              .vendorOrderDataIndex]
                                                          .vendors[index]
                                                          .activities[indexX]
                                                          .createdAt
                                                          .toString(),
                                                      description: widget
                                                          .vendorOrderDataModel
                                                          .data[widget
                                                              .vendorOrderDataIndex]
                                                          .vendors[index]
                                                          .activities[indexX]
                                                          .comment
                                                          .toString()),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          Get.to(
                                                              VendorStepsImagesScreen(
                                                            vendorStepsImages: widget
                                                                .vendorOrderDataModel
                                                                .data[widget
                                                                    .vendorOrderDataIndex]
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
                                                              VendorStepsVideosScreen(
                                                            vendorStepsVideos: widget
                                                                .vendorOrderDataModel
                                                                .data[widget
                                                                    .vendorOrderDataIndex]
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
                                                      Overseer.userLoginID ==
                                                              widget
                                                                  .vendorOrderDataModel
                                                                  .data[widget
                                                                      .vendorOrderDataIndex]
                                                                  .vendors[
                                                                      index]
                                                                  .activities[
                                                                      indexX]
                                                                  .vendorId
                                                                  .toString()
                                                          ? Consumer<
                                                              VendorStepsDeleteService>(
                                                              builder: (context,
                                                                  vendorStepsDelete,
                                                                  child) {
                                                                return GestureDetector(
                                                                  onTap: () {
                                                                    showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Center(
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                AppColors.kGreenColor,
                                                                          ),
                                                                        );
                                                                      },
                                                                      barrierDismissible:
                                                                          false,
                                                                    );
                                                                    vendorStepsDelete.deleteVendorStepsData(
                                                                        activityId: widget
                                                                            .vendorOrderDataModel
                                                                            .data[widget
                                                                                .vendorOrderDataIndex]
                                                                            .vendors[
                                                                                index]
                                                                            .activities[
                                                                                indexX]
                                                                            .id
                                                                            .toString(),
                                                                        inquiryId: widget
                                                                            .vendorOrderDataModel
                                                                            .data[widget
                                                                                .vendorOrderDataIndex]
                                                                            .id
                                                                            .toString(),
                                                                        context:
                                                                            context);
                                                                  },
                                                                  child: Icon(
                                                                    Icons
                                                                        .delete,
                                                                    color: AppColors
                                                                        .kGreenColor,
                                                                    size: 25,
                                                                  ),
                                                                );
                                                              },
                                                            )
                                                          : SizedBox(),
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
                            title: BuildText(text: vendorName, size: 18),
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
