import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  int _isList1Visible = 1;
  late int _sellect = 0;
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
                        text: "Checkout",
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SmallTextButton(
                              textColor: _isList1Visible == 1
                                  ? AppColors.kWhiteColor
                                  : AppColors.kWhiteColor,
                              buttonColor: _isList1Visible == 1
                                  ? AppColors.kGreenColor
                                  : AppColors.kCardDArkColor,
                              text: 'Delivery',
                              clickCallback: () {
                                setState(() {
                                  _isList1Visible = 1;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SmallTextButton(
                              textColor: _isList1Visible == 2
                                  ? AppColors.kWhiteColor
                                  : AppColors.kWhiteColor,
                              buttonColor: _isList1Visible == 2
                                  ? AppColors.kGreenColor
                                  : AppColors.kCardDArkColor,
                              text: 'Pick-Up',
                              clickCallback: () {
                                setState(() {
                                  _isList1Visible = 2;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),

                    ///Deliver to
                    _isList1Visible == 1
                        ? Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 11),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    BuildText(
                                      color: AppColors.kBlackColor,
                                      text: "Deliver To",
                                      size: 16,
                                      family: 'Montserrat-SemiBold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                    Container(
                                      width: 60,
                                      height: 24,
                                      child: SmallTextButton(
                                        textColor: AppColors.kWhiteColor,
                                        buttonColor: AppColors.kGreenColor,
                                        text: 'Add',
                                        clickCallback: () {},
                                      ),
                                    )
                                  ],
                                ),
                                BuildSizeBox(
                                    height:
                                        Get.height * ScreenSizes.SCREEN_SIZE_2),
                                Container(
                                  height: 80,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        BuildText(
                                          color: AppColors.kTextColor1,
                                          text: "Others",
                                          size: 16,
                                          family: 'Montserrat-SemiBold',
                                          fontWeight: FontWeight.bold,
                                        ),
                                        BuildSizeBox(
                                            height: Get.height *
                                                ScreenSizes.SCREEN_SIZE_1),
                                        Container(
                                          child: BuildText(
                                            color: AppColors.kTextColor2,
                                            text:
                                                "Asad Hammed Road, Rawalpindi",
                                            size: 12,
                                            family: 'Montserrat-SemiBold',
                                            // fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                BuildSizeBox(
                                    height:
                                        Get.height * ScreenSizes.SCREEN_SIZE_2),
                                TextFormField(
                                  maxLines: 4,
                                  // controller: _descriptionController,
                                  onChanged: (value) {},
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText: "Leave A Note",
                                    hintStyle: TextStyle(
                                      color: AppColors.kTextColor2,
                                      fontFamily: 'Montserrat-Regular',
                                      fontSize: 11,
                                    ),
                                    border: const OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      borderSide: BorderSide(
                                          width: 1, color: Colors.grey),
                                    ),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 1, color: Colors.grey)),
                                  ),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    _isList1Visible == 1
                        ? BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_2)
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 11),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildText(
                            color: AppColors.kBlackColor,
                            text: "Choose Payment Method",
                            size: 16,
                            family: 'Montserrat-SemiBold',
                            fontWeight: FontWeight.bold,
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                          Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.credit_card_outlined,
                                color: _sellect == 0
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                              ),
                              title: BuildText(
                                text: "Credit Card",
                                color: _sellect == 0
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                                family: "Montserrat-SemiBold",
                                size: 16,
                              ),
                              trailing: Radio(
                                activeColor: _sellect == 0
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                                value: 0,
                                onChanged: (value) {
                                  setState(() {
                                    _sellect = value!;
                                  });
                                },
                                groupValue: _sellect,
                              ),
                            ),
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          Card(
                            child: ListTile(
                              leading: Icon(
                                Icons.paypal_outlined,
                                color: _sellect == 1
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                              ),
                              title: BuildText(
                                text: "PayPal",
                                color: _sellect == 1
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                                family: "Montserrat-SemiBold",
                                size: 16,
                              ),
                              trailing: Radio(
                                value: 1,
                                activeColor: _sellect == 1
                                    ? AppColors.kGreenColor
                                    : AppColors.kCardDArkColor,
                                onChanged: (value) {
                                  setState(() {
                                    _sellect = value!;
                                  });
                                },
                                groupValue: _sellect,
                              ),
                            ),
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                          Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: AppColors.kCardDArkColor),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: TextFormField(
                                    // controller: _descriptionController,
                                    onChanged: (value) {},
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: const EdgeInsets.all(10),
                                      hintText: "Leave A Note",
                                      hintStyle: TextStyle(
                                        color: AppColors.kTextColor2,
                                        fontFamily: 'Montserrat-Regular',
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: AppColors.kGreenColor,
                                        border: Border.all(
                                          color: AppColors.kGreenColor,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: BuildText(
                                        text: "Apply",
                                        family: "Montserrat-SemiBold",
                                        size: 14,
                                        color: AppColors.kWhiteColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextBottun(text: "Confirm Order", clickCallback: () {}),
        ));
  }
}
