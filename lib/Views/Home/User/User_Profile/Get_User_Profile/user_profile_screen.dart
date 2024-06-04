import 'dart:io';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Get_User_Profile/user_profileManager.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Get_User_Profile/user_profileModel.dart';
import 'package:vendor_app/Views/Home/User/User_Profile/Update_User_Profile/update_user_profile_services.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../Widgets/small_text_button.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _addressEditingController =
      TextEditingController();
  final TextEditingController _cityEditingController = TextEditingController();
  final TextEditingController _areaEditingController = TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  final UpdateUserFormService updateUserFormService = UpdateUserFormService();

  List<File> imageFile = [];
  final picker = ImagePicker();

  ///Images Pic
  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicked = await ImagePicker().pickImage(source: source);
    if (imagePicked != null) {
      imageFile.clear();
      File imageFileConverted = File(imagePicked.path);
      imageFile.add(imageFileConverted);
      setState(() {});
      Get.back();
    } else {
      return;
    }
  }

  ///Function pop
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
                                pickImage(ImageSource.gallery);
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

  @override
  Widget build(BuildContext context) {
    UserProfileManager userProfileManager =
        Provider.of(context).fetch(UserProfileManager);
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
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
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    BuildText(
                      text: "Edit Profile",
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
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              child: Observer<List<UserProfileDataModel>>(
                stream: userProfileManager.mainList,
                onSuccess: (context, snapshot) {
                  List<UserProfileDataModel>? data = snapshot;
                  UserProfileDataModel modelData = data![0];
                  _emailEditingController.text =
                      modelData.data!.email.toString();
                  _nameEditingController.text = modelData.data!.name.toString();
                  _addressEditingController.text =
                      modelData.data!.address.toString();
                  _phoneEditingController.text =
                      modelData.data!.phone.toString();
                  _areaEditingController.text = modelData.data!.area.toString();
                  _addressEditingController.text =
                      modelData.data!.address.toString();
                  _cityEditingController.text = modelData.data!.city.toString();

                  return Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            CircleAvatar(
                              radius: 50,
                              // width: Get.width * ScreenSizes.SCREEN_SIZE_30,
                              // height: Get.width * ScreenSizes.SCREEN_SIZE_30,
                              child: imageFile.isNotEmpty
                                  ? Image.file(
                                      imageFile[0],
                                      height: 80,
                                      width: 60,
                                    )
                                  : Image.network(
                                      modelData.data!.imageUrl.toString(),
                                      height: 80,
                                      width: 60,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    showWarning(context);
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.kWhiteColor,
                                    child: Icon(
                                      Icons.edit,
                                      color: AppColors.kTextColor2,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            BuildText(
                              text: "Enter Your Name",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              controller: _nameEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Full Name",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name';
                                }
                                if (value.length < 3) {
                                  return 'Name must be at least 3 characters long';
                                }
                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            BuildText(
                              text: "Email",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              readOnly: true,
                              controller: _emailEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Your Email Address",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            BuildText(
                              text: "Address",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              controller: _addressEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Address",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                if (value.length < 5) {
                                  return 'Please enter a more complete address';
                                }
                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            BuildText(
                              text: "City",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              controller: _cityEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "City",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your city';
                                }

                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            BuildText(
                              text: "Area",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              controller: _areaEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Area",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Area';
                                }

                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            BuildText(
                              text: "Phone Number",
                              color: AppColors.kTextColor1,
                              fontWeight: FontWeight.bold,
                              family: "Montserrat-Medium",
                              size: 12,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                            TextFormField(
                              readOnly: true,
                              controller: _phoneEditingController,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                hintText: "Phone Number",
                                hintStyle: TextStyle(
                                  color: AppColors.kTextColor2,
                                  fontFamily: 'Montserrat-Regular',
                                  fontSize: 11,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey)),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your address';
                                }
                                if (value.length < 10) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                            Row(
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SmallTextButton(
                                      textColor: AppColors.kWhiteColor,
                                      buttonColor: AppColors.kCardDArkColor,
                                      text: 'Cancel',
                                      clickCallback: () {
                                        Get.back();
                                      },
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SmallTextButton(
                                        buttonColor: AppColors.kGreenColor,
                                        textColor: AppColors.kWhiteColor,
                                        text: "Update",
                                        clickCallback: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color:
                                                        AppColors.kGreenColor,
                                                  ),
                                                );
                                              },
                                              barrierDismissible: false,
                                            );
                                            updateUserFormService
                                                .postUserProfileFormData(
                                                    name: _nameEditingController
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                    phone:
                                                        _phoneEditingController
                                                            .text
                                                            .toString()
                                                            .trim(),
                                                    email:
                                                        _emailEditingController
                                                            .text
                                                            .toString()
                                                            .trim(),
                                                    city: _cityEditingController
                                                        .text
                                                        .toString()
                                                        .trim(),
                                                    area:
                                                        _areaEditingController
                                                            .text
                                                            .toString()
                                                            .trim(),
                                                    address:
                                                        _addressEditingController
                                                            .text
                                                            .toString()
                                                            .trim(),
                                                    profileImg:
                                                        imageFile.isNotEmpty
                                                            ? imageFile[0].path
                                                            : "",
                                                    context: context);
                                          }
                                        }),
                                  ),
                                ),
                              ],
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                onWaiting: (context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.kGreenColor,
                  ));
                },
                onError: (context) {
                  return const Text(
                    AppConstants.WELCOM_HOME_TEXT,
                    style: TextStyle(
                        fontSize: 18, color: AppColors.kDArkBlackColor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
