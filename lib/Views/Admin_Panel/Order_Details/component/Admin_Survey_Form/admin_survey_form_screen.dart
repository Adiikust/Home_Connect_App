import 'dart:io';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../../Utils/Exports/all_exports.dart';
import '../../../../Home/User/Inquiry_Form_Fill/video_play_screen.dart';
import '../../../../Widgets/Outline_small_text_button.dart';
import '../../../../Widgets/build_text.dart';
import '../../Order_Details/admin_order_details_model.dart';
import '../Admin_Vendor_Types/admin_vendor_type_screen.dart';
import 'admin_survey_form_services.dart';

class AdminSurveyFormScreen extends StatefulWidget {
  final AdminOrderDetailsModel modelData;
  int modelIndex;
  AdminSurveyFormScreen(
      {Key? key, required this.modelData, required this.modelIndex})
      : super(key: key);

  @override
  State<AdminSurveyFormScreen> createState() => _AdminSurveyFormScreenState();
}

class _AdminSurveyFormScreenState extends State<AdminSurveyFormScreen> {
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

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _areaController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  final picker = ImagePicker();
  List<File> surveyImageFile = [];
  List<File> surveySelectedVideoPaths = [];

  void selectImages() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (XFile xFile in selectedImages) {
        File imageFileConverted = File(xFile.path);
        surveyImageFile.add(imageFileConverted);
      }
    }
    setState(() {
      Get.back();
    });
  }

  Future<void> pickSelectVideo() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        print("@@@@@@@@@@@@ Videos");
        surveySelectedVideoPaths
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
      surveyImageFile.add(imageFileConverted);
      setState(() {});
      Get.back();
    } else {
      return;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    _nameController.dispose();
    _areaController.dispose();
    _cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _emailController.text =
        widget.modelData.data![widget.modelIndex].email.toString();
    _nameController.text =
        widget.modelData.data![widget.modelIndex].name.toString();
    _phoneController.text =
        widget.modelData.data![widget.modelIndex].phone.toString();
    _areaController.text =
        widget.modelData.data![widget.modelIndex].area.toString();
    _cityController.text =
        widget.modelData.data![widget.modelIndex].city.toString();

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                BuildText(
                  text: "Survey Form",
                  color: AppColors.kTextColor1,
                  fontWeight: FontWeight.bold,
                  family: "Montserrat-SemiBold",
                  size: 20,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                BuildText(
                  text: "Please Provide Correct Information",
                  color: AppColors.kTextColor2,
                  family: "Montserrat-Regular",
                  size: 14,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                BuildText(
                  text: "Enter Name",
                  color: AppColors.kTextColor1,
                  family: "Montserrat-Regular",
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildTextFormField(
                  hintText: "Enter Name",
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Name';
                    }
                    return null;
                  },
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Enter Phone Number",
                  color: AppColors.kTextColor1,
                  family: "Montserrat-Regular",
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildTextFormField(
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  hintText: "Enter Phone Number",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter  Phone Number';
                    }
                    if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                      return 'Please Enter a Valid Phone Number';
                    }
                    return null;
                  },
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Enter  Email Address",
                  color: AppColors.kTextColor1,
                  family: "Montserrat-Regular",
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildTextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  hintText: "Enter Email Address",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter email address';
                    }
                    if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                        .hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Enter Area",
                  color: AppColors.kTextColor1,
                  family: "Montserrat-Regular",
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildTextFormField(
                  maxLines: 3,
                  keyboardType: TextInputType.text,
                  controller: _areaController,
                  hintText: "Enter PArea",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter Area';
                    }
                    return null;
                  },
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Enter City Name",
                  color: AppColors.kTextColor1,
                  family: "Montserrat-Regular",
                  fontWeight: FontWeight.bold,
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildTextFormField(
                  keyboardType: TextInputType.text,
                  controller: _cityController,
                  hintText: "Enter City Name",
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter City Name';
                    }
                    return null;
                  },
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Images",
                  color: AppColors.kTextColor1,
                  fontWeight: FontWeight.bold,
                  family: "Montserrat-Regular",
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: AppColors.kWhiteColor,
                  child: surveyImageFile.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: double.infinity,
                            child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: surveyImageFile.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 5),
                                itemBuilder: (BuildContext context, int index) {
                                  return GestureDetector(
                                    onDoubleTap: () {
                                      Get.defaultDialog(
                                          title: "Image",
                                          content: const Text(""),
                                          actions: [
                                            SizedBox(
                                              height: Get.height * 0.3,
                                              child: Image.file(
                                                  File(surveyImageFile[index]
                                                      .path),
                                                  fit: BoxFit.contain),
                                            )
                                          ]);
                                    },
                                    child: Image.file(
                                        File(surveyImageFile[index].path),
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
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: "Videos",
                  color: AppColors.kTextColor1,
                  fontWeight: FontWeight.bold,
                  family: "Montserrat-Regular",
                  size: 13,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                Container(
                  height: 300,
                  width: double.infinity,
                  color: AppColors.kWhiteColor,
                  child: surveySelectedVideoPaths.isNotEmpty
                      ? Padding(
                          padding: const EdgeInsets.only(left: 2, right: 2),
                          child: Container(
                            width: double.infinity,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: surveySelectedVideoPaths.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    Get.to(VideoPlayScreen(
                                      videoFile:
                                          surveySelectedVideoPaths[index],
                                    ));
                                  },
                                  leading: CircleAvatar(
                                      backgroundColor: AppColors.kWhiteColor,
                                      child: Icon(
                                        Icons.play_circle_outline_outlined,
                                        color: AppColors.kGreenColor,
                                      )),
                                  title: Text(
                                      surveySelectedVideoPaths[index]
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
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Consumer<AdminSurveyFormService>(
                builder: (context, adminSurveyFormData, child) {
                  return OutLineSmallTextButton(
                    textColor: AppColors.kWhiteColor,
                    buttonColor: AppColors.kGreenColor,
                    text: "Survey Submit",
                    clickCallback: () {
                      if (_formKey.currentState!.validate()) {
                        adminSurveyFormData.percentage = 0.0;
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                              child: CircularPercentIndicator(
                                radius: 120.0,
                                lineWidth: 13.0,
                                animation: true,
                                percent: adminSurveyFormData.percentage / 100,
                                center: new Text(
                                  "${adminSurveyFormData.percentage}%",
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor: AppColors.kGreenColor,
                              ),
                            );
                          },
                          barrierDismissible: false,
                        );
                        adminSurveyFormData
                            .postAdminSurveyFormData(
                                orderId: Overseer
                                    .adminOrderDetailsIDByShowVendorType,
                                name: _nameController.text.toString().trim(),
                                phone: _phoneController.text.toString().trim(),
                                email: _emailController.text.toString().trim(),
                                city: _cityController.text.toString().trim(),
                                area: _areaController.text.toString().trim(),
                                vendorTypeId:
                                    Overseer.addAdminVendorTypesIdList,
                                images: surveyImageFile,
                                videos: surveySelectedVideoPaths,
                                context: context)
                            .then((value) {
                          Get.back();
                        });
                      }
                    },
                  );
                },
              ),
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
                Get.to(() => const AdminVendorTypeScreen());
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

  TextFormField buildTextFormField(
      {required TextEditingController controller,
      required String hintText,
      TextInputType? keyboardType,
      int? maxLines = 1,
      required String? Function(String?) validator}) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kTextColor2,
          fontFamily: 'Montserrat-Regular',
          fontSize: 11,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(width: 1, color: AppColors.kGreenColor),
        ),
        focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: AppColors.kGreenColor)),
      ),
      validator: validator,
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
