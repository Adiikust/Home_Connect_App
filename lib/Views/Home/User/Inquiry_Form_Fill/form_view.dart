import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_Fill/select_city.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class FormView extends StatefulWidget {
  const FormView({Key? key}) : super(key: key);

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    phoneController.dispose();
    nameController.dispose();
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
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Contact",
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
                child: SingleChildScrollView(
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
                        text: "Enter Your Name",
                        color: AppColors.kTextColor1,
                        family: "Montserrat-Regular",
                        fontWeight: FontWeight.bold,
                        size: 13,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter your Email Address",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.kGreenColor)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Your Name';
                          }
                          return null;
                        },
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: "Enter Your Phone Number",
                        color: AppColors.kTextColor1,
                        family: "Montserrat-Regular",
                        fontWeight: FontWeight.bold,
                        size: 13,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter your Phone Number",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.kGreenColor)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Phone Number';
                          }
                          if (!RegExp(r'^\d{11}$').hasMatch(value)) {
                            return 'Please Enter a Valid Phone Number';
                          }
                          return null;
                        },
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: "Enter Your Email",
                        color: AppColors.kTextColor1,
                        family: "Montserrat-Regular",
                        fontWeight: FontWeight.bold,
                        size: 13,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(10),
                          hintText: "Enter your Email Address",
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  width: 1, color: AppColors.kGreenColor)),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter your Email';
                          }
                          if (!RegExp(
                                  r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
                              .hasMatch(value)) {
                            return 'Please Enter a Valid Email Address';
                          }
                          return null;
                        },
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_4),
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
                                  Overseer.inquiryName =
                                      nameController.text.toString().trim();
                                  Overseer.inquiryEmail =
                                      emailController.text.toString().trim();
                                  Overseer.inquiryPhoneNumber =
                                      phoneController.text.toString().trim();
                                  Get.to(const SelectCity());
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
            ),
          ],
        ),
      ),
    );
  }
}
