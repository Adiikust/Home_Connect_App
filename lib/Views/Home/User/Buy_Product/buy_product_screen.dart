import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:vendor_app/AppLayer/Overseer.dart';
import 'package:vendor_app/Utils/Colors/app_color.dart';
import 'package:vendor_app/Utils/Screen_Size/screen_sizes.dart';
import 'package:vendor_app/Views/Home/User/Buy_Product/buy_listing_services.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/Listing_User/userListingModel.dart';
import 'package:vendor_app/Views/Widgets/build_size_box.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:http/http.dart' as http;
import 'package:vendor_app/Views/Widgets/overlay_loader_widget.dart';
import 'package:vendor_app/Views/Widgets/text_button.dart';
import 'package:vendor_app/Views/Widgets/toaster.dart';

class BuyProductScreen extends StatefulWidget {
  final UserListingModel modelData;
  final int index;

  BuyProductScreen({Key? key, required this.modelData, required this.index})
      : super(key: key);

  @override
  State<BuyProductScreen> createState() => _BuyProductScreenState();
}

class _BuyProductScreenState extends State<BuyProductScreen> {
  String file = "";

  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final provider = Provider.of<BuyListingService>(context, listen: false);
    provider.totalCartValue = 0;
    provider.totalProductQuantity = 1;
    provider.selectedOption = "";
    provider.PaymentDone = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Buy Product",
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
            Container(
              child: file == ""
                  ? Image.network(
                      widget.modelData.data?[widget.index].imageUrl![0]
                              .toString() ??
                          "",
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      file.toString(),
                      fit: BoxFit.cover,
                    ),
              decoration: BoxDecoration(
                color: AppColors.kGreenColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
              height: 250,
              width: double.infinity,
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
            Container(
              height: 70,
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget
                              .modelData.data?[widget.index].imageUrl?.length ??
                          0,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            file = widget.modelData.data?[widget.index]
                                    .imageUrl?[index]
                                    .toString() ??
                                "";
                            setState(() {});
                          },
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.network(
                                widget.modelData.data?[widget.index]
                                        .imageUrl?[index]
                                        .toString() ??
                                    "",
                                width: 70,
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BuildText(
                        text: widget.modelData.data?[widget.index].name
                                .toString() ??
                            "",
                        color: AppColors.kTextColor1,
                        fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 22,
                      ),
                      BuildText(
                        text:
                            "Rs.${widget.modelData.data?[widget.index].price.toString() ?? ""}/=",
                        color: AppColors.kTextColor1,
                        fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 18,
                      ),
                    ],
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "Description",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 16,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: widget.modelData.data?[widget.index].description
                            .toString() ??
                        "",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextBottun(
            text: "Buy",
            clickCallback: () {
              showModal(
                productID:
                    widget.modelData.data?[widget.index].id.toString() ?? "",
                productDescription: widget
                        .modelData.data?[widget.index].description
                        .toString() ??
                    "",
                productName:
                    widget.modelData.data?[widget.index].name.toString() ?? "",
                productPrice:
                    widget.modelData.data?[widget.index].price.toString() ?? "",
                context: context,
              );
            }),
      ),
    );
  }

  void showModal(
      {required BuildContext context,
      required String productName,
      required String productPrice,
      required String productID,
      required String productDescription}) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Color(0xffF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            topEnd: Radius.circular(20),
            topStart: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Container(
            padding: EdgeInsets.all(8),
            height: 600,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(
                              Icons.cancel_outlined,
                              color: AppColors.kTextColor1,
                            ))
                      ],
                    ),
                    TextFormField(
                      controller: addressController,
                      minLines: 3,
                      maxLines: null,
                      keyboardType: TextInputType.multiline,
                      cursorColor: AppColors.kGreenColor,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Enter your Delivery Address",
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
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildText(
                          color: AppColors.kTextColor1,
                          text: "Quantity",
                          size: 14,
                          family: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                        Consumer<BuyListingService>(
                          builder: (context, buyListingServiceData, child) {
                            return Row(
                              children: [
                                GestureDetector(
                                    onTap: () => buyListingServiceData
                                        .removeItem(price: productPrice),
                                    child: buildCircleAvatar("-")),
                                BuildSizeBox(
                                    weight:
                                        Get.width * ScreenSizes.SCREEN_SIZE_2),
                                BuildText(
                                  color: AppColors.kTextColor1,
                                  text: buyListingServiceData
                                      .totalProductQuantity
                                      .toString(),
                                  size: 16,
                                  family: 'Montserrat-SemiBold',
                                ),
                                BuildSizeBox(
                                    weight:
                                        Get.width * ScreenSizes.SCREEN_SIZE_2),
                                GestureDetector(
                                    onTap: () => buyListingServiceData.addItem(
                                        price: productPrice),
                                    child: buildCircleAvatar("+")),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    Row(
                      children: [
                        BuildText(
                          color: AppColors.kTextColor1,
                          text: "Product price:",
                          size: 14,
                          family: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                        BuildText(
                          color: AppColors.kGreenColor,
                          text: " Rs.${productPrice}",
                          size: 16,
                          family: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    SizedBox(height: 3),
                    Row(
                      children: [
                        BuildText(
                          color: AppColors.kTextColor1,
                          text: "Total Amount:",
                          size: 14,
                          family: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                        Consumer<BuyListingService>(
                          builder: (context, buyListingServiceData, child) {
                            return BuildText(
                              color: AppColors.kGreenColor,
                              text:
                                  " Rs.${buyListingServiceData.totalCartValue == 0 ? productPrice : buyListingServiceData.totalCartValue}",
                              size: 16,
                              family: 'Montserrat-SemiBold',
                              fontWeight: FontWeight.bold,
                            );
                          },
                        )
                      ],
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    Consumer<BuyListingService>(
                        builder: (context, buyListingServiceData, child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: RadioListTile(
                              title: Text('Cash On Delivery'),
                              value: '0',
                              groupValue: buyListingServiceData.selectedOption,
                              activeColor: AppColors.kGreenColor,
                              onChanged: (value) {
                                buyListingServiceData.updatePaymentMethod(
                                    value: value!);
                              },
                            ),
                          ),
                          BuildSizeBox(
                              weight: Get.width * ScreenSizes.SCREEN_SIZE_3),
                          Expanded(
                            child: RadioListTile(
                              title: Text('Online Payment'),
                              value: '1',
                              groupValue: buyListingServiceData.selectedOption,
                              activeColor: AppColors.kGreenColor,
                              onChanged: (value) {
                                buyListingServiceData.updatePaymentMethod(
                                    value: value!);
                              },
                            ),
                          ),
                        ],
                      );
                    }),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    Consumer<BuyListingService>(
                      builder: (context, buyListingServiceData, child) {
                        return buyListingServiceData.selectedOption == ''
                            ? SizedBox.shrink()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  if (buyListingServiceData.selectedOption !=
                                      "0")
                                    Expanded(
                                      child: TextBottun(
                                        text: "Add Card",
                                        clickCallback: () async {
                                          await buyListingServiceData
                                              .makePayment(
                                                  amount: buyListingServiceData
                                                              .totalCartValue ==
                                                          0
                                                      ? productPrice
                                                      : buyListingServiceData
                                                          .totalCartValue
                                                          .toString());
                                        },
                                      ),
                                    ),
                                  SizedBox(width: 10),
                                  Expanded(
                                    child: TextBottun(
                                      text: "Place Order",
                                      clickCallback: () async {
                                        if (addressController.text.isNotEmpty) {
                                          if (buyListingServiceData
                                                  .selectedOption ==
                                              "0") {
                                            OverlayLoader.instance
                                                .show(context);
                                            buyListingServiceData.postBuyListingPaymentData(
                                                amount: buyListingServiceData
                                                            .totalCartValue ==
                                                        0
                                                    ? productPrice
                                                    : buyListingServiceData
                                                        .totalCartValue
                                                        .toString(),
                                                quantity: buyListingServiceData
                                                    .totalProductQuantity
                                                    .toString(),
                                                userID: Overseer.userLoginID,
                                                address: addressController.text
                                                    .trim()
                                                    .toString(),
                                                vendorId:
                                                    Overseer.vendorListingID,
                                                ItemId: productID,
                                                context: context);
                                          } else if (buyListingServiceData
                                                      .selectedOption ==
                                                  "1" &&
                                              buyListingServiceData
                                                      .PaymentDone ==
                                                  true) {
                                            OverlayLoader.instance
                                                .show(context);
                                            buyListingServiceData.postBuyListingPaymentData(
                                                amount: buyListingServiceData
                                                            .totalCartValue ==
                                                        0
                                                    ? productPrice
                                                    : buyListingServiceData
                                                        .totalCartValue
                                                        .toString(),
                                                quantity: buyListingServiceData
                                                    .totalProductQuantity
                                                    .toString(),
                                                userID: Overseer.userLoginID,
                                                address: addressController.text
                                                    .trim()
                                                    .toString(),
                                                vendorId:
                                                    Overseer.vendorListingID,
                                                ItemId: productID,
                                                context: context);
                                          } else {
                                            Get.snackbar(
                                              "Information",
                                              "Please First Add Card Payment than place Order",
                                              backgroundColor: Colors.grey,
                                              icon: const Icon(
                                                  Icons.error_outline,
                                                  color: Colors.white),
                                              snackPosition: SnackPosition.TOP,
                                            );
                                          }
                                        } else {
                                          Get.snackbar(
                                            "Massage",
                                            "Please add your delivery address",
                                            backgroundColor: Colors.grey,
                                            icon: const Icon(
                                                Icons.error_outline,
                                                color: Colors.white),
                                            snackPosition: SnackPosition.TOP,
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              );
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  ],
                ),
              ),
            ),
          );
        });
  }

  CircleAvatar buildCircleAvatar(String sign) {
    return CircleAvatar(
      radius: 18,
      backgroundColor: AppColors.kWhiteColor,
      child: BuildText(
        color: AppColors.kTextColor1,
        text: sign,
        size: 20,
        family: 'Montserrat-SemiBold',
      ),
    );
  }
}
