import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:slider_button/slider_button.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
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
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Order Details",
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
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_4,
                  ),
                  BuildText(
                    text: "Order Detail",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  BuildRow(title: "Order ID", subTitle: "21584"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Date", subTitle: "20 June 2023 - 12:05 PM"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Payment", subTitle: "Cash On Delivery"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                      title: "Status",
                      subTitle: "Confirmed",
                      color1: AppColors.kGreenColor),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(
                    title: "Items",
                    subTitle: "01",
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/catagories/home4.png")),
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          BuildSizeBox(
                              weight: Get.width * ScreenSizes.SCREEN_SIZE_3),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BuildText(
                                    color: AppColors.kTextColor1,
                                    text: "Chicken Biryani",
                                    size: 16,
                                    family: 'Montserrat-SemiBold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                  BuildSizeBox(
                                      weight: Get.width *
                                          ScreenSizes.SCREEN_SIZE_8),
                                  BuildText(
                                    color: AppColors.kTextColor2,
                                    text: "Quantity: 1",
                                    size: 14,
                                    family: 'Montserrat-SemiBold',
                                  ),
                                ],
                              ),
                              BuildSizeBox(height: 5),
                              BuildText(
                                color: AppColors.kTextColor1,
                                text: "Price 200",
                                size: 13,
                                family: 'Montserrat-SemiBold',
                              ),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  BuildText(
                    text: "Customer Detail",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "images/catagories/home4.png")),
                                color: Colors.yellow,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                          ),
                          BuildSizeBox(
                              weight: Get.width * ScreenSizes.SCREEN_SIZE_3),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildText(
                                color: AppColors.kTextColor1,
                                text: "Adnan Hameed",
                                size: 16,
                                family: 'Montserrat-SemiBold',
                                fontWeight: FontWeight.bold,
                              ),
                              BuildSizeBox(height: 5),
                              BuildText(
                                color: AppColors.kTextColor2,
                                text: "Double Road Rawalpindi",
                                size: 13,
                                family: 'Montserrat-SemiBold',
                              ),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                  ),
                  BuildText(
                    text: "Payment Summary",
                    color: AppColors.kTextColor1,
                    family: "Montserrat-SemiBold",
                    size: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Item Price", subTitle: "Rs.200"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Addons", subTitle: "Rs.00"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Subtotal", subTitle: "Rs.200"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Discount", subTitle: "Rs.100"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "VAT/ TAX", subTitle: "Rs.10"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildRow(title: "Delivery Fee", subTitle: "Rs.0"),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                  ),
                  Divider(),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                  ),
                  BuildRow(
                      title: "Total Amount",
                      subTitle: "Rs.110",
                      size: 16,
                      fontWeight: FontWeight.bold,
                      color2: AppColors.kTextColor1),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  // SliderButton(
                  //   action: () {
                  //     ///Do something here OnSlide
                  //   },
                  //   label: Text(
                  //     "Swipe to Cooking !",
                  //     style: TextStyle(
                  //         color: Color(0xff4a4a4a),
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 17),
                  //   ),
                  //   icon: Center(
                  //       child: Icon(
                  //     Icons.keyboard_double_arrow_right_outlined,
                  //     color: Colors.white,
                  //     size: 40.0,
                  //   )),
                  //   width: double.infinity,
                  //   radius: 15,
                  //   buttonColor: AppColors.kGreenColor,
                  //   backgroundColor: AppColors.kWhiteColor,
                  //   highlightedColor: AppColors.kGreenColor,
                  //   baseColor: AppColors.kGreenColor,
                  // ),
                  BuildSizeBox(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BuildRow extends StatelessWidget {
  String title, subTitle;
  final Color? color1, color2;
  double? size;
  FontWeight? fontWeight;
  BuildRow(
      {Key? key,
      this.color1,
      this.fontWeight,
      this.color2,
      required this.subTitle,
      required this.title,
      this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildText(
          text: title,
          color: color2 ?? AppColors.kTextColor2,
          family: "Montserrat-SemiBold",
          size: size ?? 14,
          fontWeight: fontWeight ?? FontWeight.normal,
        ),
        BuildText(
          text: subTitle,
          color: color1 ?? AppColors.kTextColor1,
          family: "Montserrat-SemiBold",
          size: 14,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
