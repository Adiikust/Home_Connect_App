import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileManager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Profile/vendor_profileModel.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';

import '../../../../Utils/Exports/all_exports.dart';

class VendorProfileScreen extends StatefulWidget {
  const VendorProfileScreen({Key? key}) : super(key: key);

  @override
  State<VendorProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<VendorProfileScreen> {
  final TextEditingController _ShopNameEditingController =
      TextEditingController();
  final TextEditingController _fNmeEditingController = TextEditingController();
  final TextEditingController _lNameEditingController = TextEditingController();
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _addressEditingController =
      TextEditingController();
  final TextEditingController _phoneEditingController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    VendorProfileManager vendorProfileManager =
        Provider.of(context).fetch(VendorProfileManager);
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
                      text: "Vendor Edit Profile",
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
              child: Observer<List<VendorProfileDataModel>>(
                stream: vendorProfileManager.mainList,
                onSuccess: (context, snapshot) {
                  List<VendorProfileDataModel>? data = snapshot;
                  VendorProfileDataModel modelData = data![0];
                  _ShopNameEditingController.text =
                      modelData.data!.name.toString();
                  _emailEditingController.text =
                      modelData.data!.email.toString();
                  _fNmeEditingController.text =
                      modelData.data!.fName.toString();
                  _lNameEditingController.text =
                      modelData.data!.lName.toString();
                  _addressEditingController.text =
                      modelData.data!.restaurants![0].address.toString();
                  _phoneEditingController.text =
                      modelData.data!.restaurants![0].phone.toString();

                  return Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                              width: Get.width * ScreenSizes.SCREEN_SIZE_30,
                              height: Get.width * ScreenSizes.SCREEN_SIZE_30,
                              decoration: BoxDecoration(
                                color: AppColors.kGreenColor,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: NetworkImage(
                                      modelData.data!.imageUrl![0].toString()),
                                ),
                              )),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: InkWell(
                                onTap: () {},
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
                            text: "Shop Name",
                            color: AppColors.kTextColor1,
                            fontWeight: FontWeight.bold,
                            family: "Montserrat-Medium",
                            size: 12,
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          TextFormField(
                            controller: _ShopNameEditingController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Shop Name",
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          BuildText(
                            text: "First Name",
                            color: AppColors.kTextColor1,
                            fontWeight: FontWeight.bold,
                            family: "Montserrat-Medium",
                            size: 12,
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          TextFormField(
                            controller: _fNmeEditingController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "First Name",
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          BuildText(
                            text: "Last Name",
                            color: AppColors.kTextColor1,
                            fontWeight: FontWeight.bold,
                            family: "Montserrat-Medium",
                            size: 12,
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          TextFormField(
                            controller: _lNameEditingController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Last Name",
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
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
                            onChanged: (value) {},
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
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
                            onChanged: (value) {},
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
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
                            onChanged: (value) {},
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
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.grey)),
                            ),
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
                                      clickCallback: () {}),
                                ),
                              ),
                            ],
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                        ],
                      ),
                    ],
                  );
                },
                onWaiting: (context) {
                  return const Center(child: CircularProgressIndicator());
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
            ),
          ],
        ),
      ),
    );
  }
}
