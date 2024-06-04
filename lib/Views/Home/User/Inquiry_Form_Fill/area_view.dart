import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'multi_image_upload.dart';

class AreaView extends StatefulWidget {
  const AreaView({Key? key}) : super(key: key);

  @override
  State<AreaView> createState() => _AreaViewState();
}

class _AreaViewState extends State<AreaView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController areaController = TextEditingController();
  String? area;

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
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
                          color: AppColors.kWhiteColor,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Area",
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Inquiry Form",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 20,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "Please Provide Correct Information",
                      color: AppColors.kTextColor2,
                      family: "Montserrat-Regular",
                      size: 14,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Enter Area",
                      color: AppColors.kTextColor1,
                      family: "Montserrat-Regular",
                      fontWeight: FontWeight.bold,
                      size: 13,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    TextFormField(
                      controller: areaController,
                      minLines: 3,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      cursorColor: AppColors.kGreenColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Enter yur area size like width and height",
                        hintStyle: TextStyle(
                          color: AppColors.kTextColor2,
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 11,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kGreenColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.kGreenColor)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please Enter Your Area';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.030,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutLineSmallTextButton(
                            text: "Back",
                            clickCallback: () {
                              Get.back();
                            },
                            textColor: AppColors.kGreenColor,
                            buttonColor: AppColors.kWhiteColor,
                          ),
                        ),
                        BuildSizeBox(
                            weight: Get.width * ScreenSizes.SCREEN_SIZE_5),
                        Expanded(
                          child: OutLineSmallTextButton(
                            text: "Next",
                            clickCallback: () {
                              if (_formKey.currentState!.validate()) {
                                Overseer.inquiryArea =
                                    areaController.text.toString().trim();
                                Get.to(() => const MultiImageUpload());
                              } else {
                                Get.snackbar(
                                  "Message",
                                  backgroundColor: AppColors.kWhiteColor,
                                  colorText: AppColors.kGreenColor,
                                  "Please Enter The Area",
                                  icon: const Icon(Icons.error_outline,
                                      color: AppColors.kGreenColor),
                                  snackPosition: SnackPosition.TOP,
                                );
                              }
                            },
                            textColor: AppColors.kWhiteColor,
                            buttonColor: AppColors.kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
