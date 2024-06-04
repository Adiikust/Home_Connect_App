import 'package:provider/provider.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_Fill/video_play_screen.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'dart:io';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'Choice_ShowCase/choice_show_case_screen.dart';
import 'inquiry_form_services.dart';

class MultiImageUpload extends StatefulWidget {
  const MultiImageUpload({Key? key}) : super(key: key);

  @override
  State<MultiImageUpload> createState() => _MultiImageUploadState();
}

class _MultiImageUploadState extends State<MultiImageUpload> {
  showWarning(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Pick Images...",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                      decoration: const BoxDecoration(
                        color: AppColors.kGreenColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                pickImage(ImageSource.camera);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kWhiteColor,
                              ),
                              child: const Text(
                                "Camera",
                                style: TextStyle(color: AppColors.kBlackColor),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                selectImages();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kWhiteColor,
                              ),
                              child: const Text(
                                "Gallery",
                                style: TextStyle(color: AppColors.kBlackColor),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));

  final picker = ImagePicker();
  List<File> imageFile = [];
  List<File> selectedVideoPaths = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (XFile xFile in selectedImages) {
        File imageFileConverted = File(xFile.path);
        imageFile.add(imageFileConverted);
      }
    }
    setState(() {
      Get.back();
    });
  }

  Future<void> pickSelectVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    // final pickedFile = await picker.getVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        print("@@@@@@@@@@@@ Videos");
        selectedVideoPaths
            .add(File(pickedFile.path)); // Convert PickedFile to File.
      });
    } else {
      print("No Video");
    }
  }

  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicked = await ImagePicker().pickImage(source: source);
    if (imagePicked != null) {
      File imageFileConverted = File(imagePicked.path);
      imageFile.add(imageFileConverted);
      setState(() {});
      Get.back();
    } else {
      return;
    }
  }

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
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Images",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  BuildText(
                    text: "Image",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Please Upload An Image",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),

                  Container(
                    height: 300,
                    width: double.infinity,
                    color: AppColors.kWhiteColor,
                    child: imageFile.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              child: GridView.builder(
                                  itemCount: imageFile.length,
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 5),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onDoubleTap: () {
                                        Get.defaultDialog(
                                            title: "image",
                                            content: const Text(""),
                                            actions: [
                                              SizedBox(
                                                height: Get.height * 0.3,
                                                child: Image.file(
                                                    File(imageFile[index].path),
                                                    fit: BoxFit.contain),
                                              )
                                            ]);
                                      },
                                      child: Image.file(
                                          File(imageFile[index].path),
                                          fit: BoxFit.cover),
                                    );
                                  }),
                            ),
                          )
                        : Center(
                            child: BuildText(
                            text: "Empty Images",
                            color: AppColors.kTextColor2,
                            family: "Montserrat-Regular",
                            size: 18,
                          )),
                  ),

                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  BuildText(
                    text: "Videos",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Please Upload An Videos",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  Container(
                    height: 300,
                    width: double.infinity,
                    color: AppColors.kWhiteColor,
                    child: selectedVideoPaths.isNotEmpty
                        ? Padding(
                            padding: const EdgeInsets.only(left: 2, right: 2),
                            child: Container(
                              width: double.infinity,
                              child: ListView.builder(
                                itemCount: selectedVideoPaths.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    onTap: () {
                                      Get.to(VideoPlayScreen(
                                        videoFile: selectedVideoPaths[index],
                                      ));
                                    },
                                    leading: CircleAvatar(
                                        backgroundColor: AppColors.kWhiteColor,
                                        child: Icon(
                                          Icons.play_circle_outline_outlined,
                                          color: AppColors.kGreenColor,
                                        )),
                                    title: Text(
                                        selectedVideoPaths[index]
                                            .path
                                            .split('/')
                                            .last,
                                        maxLines: 1),
                                  );
                                },
                              ),
                            ),
                          )
                        : Center(
                            child: BuildText(
                            text: "Empty Videos",
                            color: AppColors.kTextColor2,
                            family: "Montserrat-Regular",
                            size: 18,
                          )),
                  ),
                  // Spacer(),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Consumer<InquiryFormService>(
              builder: (context, inquiryFormService, child) {
                return Expanded(
                  child: OutLineSmallTextButton(
                    text: "Order Place",
                    clickCallback: () {
                      if (imageFile.isNotEmpty) {
                        if (selectedVideoPaths.isNotEmpty) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: Consumer<InquiryFormService>(
                                  builder:
                                      (context, inquiryFormServiceData, child) {
                                    return CircularPercentIndicator(
                                      radius: 120.0,
                                      lineWidth: 13.0,
                                      animation: true,
                                      percent:
                                          inquiryFormServiceData.percentage /
                                              100,
                                      center: new Text(
                                        "${inquiryFormServiceData.percentage}%",
                                        style: new TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                      circularStrokeCap:
                                          CircularStrokeCap.round,
                                      progressColor: AppColors.kGreenColor,
                                    );
                                  },
                                ),
                              );
                            },
                            barrierDismissible: false,
                          );
                          inquiryFormService
                              .postInquiryFormData(
                            categoryId: Overseer.inquiryCategoriesID,
                            subCategoryId: Overseer.inquirySubCategoriesID,
                            vendorTypeId:
                                Overseer.inquirySubCategoriesVendorTypeIdList,
                            name: Overseer.inquiryName,
                            phone: Overseer.inquiryPhoneNumber,
                            email: Overseer.inquiryEmail,
                            city: Overseer.inquirySelectCityName,
                            area: Overseer.inquiryArea,
                            choiceIds: Overseer.inquiryChoiceShowCaseIdList,
                            latitude: Overseer.latitude,
                            long: Overseer.longitude,
                            images: imageFile,
                            videos: selectedVideoPaths,
                            context: context,
                          )
                              .then((value) {
                            Overseer.inquiryCategoriesID = '';
                            Overseer.inquirySubCategoriesID = '';
                            Overseer.inquirySubCategoriesVendorTypeIdList
                                .clear();
                            Overseer.inquiryName = '';
                            Overseer.inquiryPhoneNumber = '';
                            Overseer.inquiryEmail = '';
                            Overseer.inquirySelectCityName = '';
                            Overseer.inquiryArea = '';
                            Overseer.inquiryChoiceShowCaseIdList.clear();
                            Overseer.latitude = 0.0;
                            Overseer.longitude = 0.0;
                            imageFile.clear();
                            selectedVideoPaths.clear();
                          });
                        } else {
                          buildSnackbar(message: "Please Provide The Videos");
                        }
                      } else {
                        buildSnackbar(message: "Please Provide The Images");
                      }
                      print("category_id ${Overseer.inquiryCategoriesID}");
                      print(
                          "sub_category_id ${Overseer.inquirySubCategoriesID}");
                      print(
                          "vendor_type_id ${Overseer.inquirySubCategoriesVendorTypeIdList}");
                      print("name ${Overseer.inquiryName}");
                      print("phone ${Overseer.inquiryPhoneNumber}");
                      print("email ${Overseer.inquiryEmail}");
                      print("city ${Overseer.inquirySelectCityName}");
                      print("area ${Overseer.inquiryArea}");
                      print(
                          "choice_ids ${Overseer.inquiryChoiceShowCaseIdList}");
                      print("latitude ${Overseer.latitude}");
                      print("longitude ${Overseer.longitude}");
                      print("images ${imageFile}");
                      print("videos ${selectedVideoPaths}");
                      //Get.to(() => const WelcomeScreen());
                    },
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kGreenColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        spacing: 3,
        childPadding: const EdgeInsets.all(5),
        spaceBetweenChildren: 4,
        elevation: 8.0,
        animationCurve: Curves.elasticInOut,
        isOpenOnStart: false,
        children: [
          buildSpeedDialChild(
              backgroundColor: AppColors.kGreenColor,
              foregroundColor: AppColors.kWhiteColor,
              iconData: Icons.add,
              label: 'Choice order',
              onTap: () {
                Get.to(() => const ChoiceShowCaseScreen());
              }),
          buildSpeedDialChild(
              backgroundColor: AppColors.kGreenColor,
              foregroundColor: AppColors.kWhiteColor,
              iconData: Icons.video_library_outlined,
              label: 'Add Videos',
              onTap: () {
                pickSelectVideo();
              }),
          buildSpeedDialChild(
              backgroundColor: AppColors.kGreenColor,
              foregroundColor: AppColors.kWhiteColor,
              iconData: Icons.image_outlined,
              label: 'Add Images',
              onTap: () {
                showWarning(context);
              }),
        ],
      ),
    );
  }

  SnackbarController buildSnackbar({required String message}) {
    return Get.snackbar(
      "Message",
      backgroundColor: AppColors.kWhiteColor,
      message,
      colorText: AppColors.kGreenColor,
      icon: const Icon(Icons.error_outline, color: AppColors.kGreenColor),
      snackPosition: SnackPosition.TOP,
    );
  }

  SpeedDialChild buildSpeedDialChild(
      {required String label,
      void Function()? onTap,
      required Color foregroundColor,
      required IconData iconData,
      required Color backgroundColor}) {
    return SpeedDialChild(
      child: Icon(iconData),
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      label: label,
      onTap: onTap,
    );
  }
}
