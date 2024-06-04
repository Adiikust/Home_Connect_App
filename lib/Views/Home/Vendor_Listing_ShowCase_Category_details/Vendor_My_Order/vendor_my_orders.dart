import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_My_Order/Order_Details/order_details_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';

class VendorMyOrders extends StatefulWidget {
  const VendorMyOrders({Key? key}) : super(key: key);

  @override
  State<VendorMyOrders> createState() => _VendorMyOrdersState();
}

class _VendorMyOrdersState extends State<VendorMyOrders> {
  bool isSwitched = false;
  int tappedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Column(
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
                    text: "My Orders",
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
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_6,
                ),
                Container(
                  height: 65,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BuildText(
                          text: "Restaurant Temporarily Closed",
                          color: AppColors.kTextColor1,
                          family: "Montserrat-SemiBold",
                          size: 14,
                        ),
                        Switch(
                          value: isSwitched,
                          onChanged: (value) {
                            setState(() {
                              isSwitched = value;
                              print(isSwitched);
                            });
                          },
                          activeTrackColor: AppColors.kGreenColor,
                          activeColor: AppColors.kWhiteColor,
                        ),
                      ],
                    ),
                  ),
                ),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                ),
                Container(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_25,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: Column(
                    children: [
                      BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_balance_wallet_outlined,
                            size: 65,
                            color: AppColors.kTextColor1,
                          ),
                          BuildSizeBox(
                            weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildText(
                                text: "Today",
                                color: AppColors.kTextColor2,
                                family: "Montserrat-SemiBold",
                                size: 14,
                              ),
                              BuildSizeBox(
                                height: 2,
                              ),
                              BuildText(
                                text: "Rs. 200",
                                color: AppColors.kTextColor1,
                                family: "Montserrat-SemiBold",
                                fontWeight: FontWeight.bold,
                                size: 20,
                              ),
                            ],
                          )
                        ],
                      ),
                      BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildText(
                                text: "This Week",
                                color: AppColors.kTextColor2,
                                family: "Montserrat-SemiBold",
                                size: 14,
                              ),
                              BuildSizeBox(
                                height: 2,
                              ),
                              BuildText(
                                text: "Rs. 200",
                                color: AppColors.kTextColor1,
                                family: "Montserrat-SemiBold",
                                fontWeight: FontWeight.bold,
                                size: 20,
                              ),
                            ],
                          ),
                          Container(
                            color: AppColors.kGreenColor,
                            width: 2,
                            height: Get.height * ScreenSizes.SCREEN_SIZE_8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildText(
                                text: "This Month",
                                color: AppColors.kTextColor2,
                                family: "Montserrat-SemiBold",
                                size: 14,
                              ),
                              BuildSizeBox(
                                height: 2,
                              ),
                              BuildText(
                                text: "Rs. 200",
                                color: AppColors.kTextColor1,
                                family: "Montserrat-SemiBold",
                                fontWeight: FontWeight.bold,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_4,
                ),
                Container(
                  width: double.infinity,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                tappedIndex = index;
                              });
                            },
                            child: Container(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_3,
                              width: Get.width * ScreenSizes.SCREEN_SIZE_30,
                              decoration: BoxDecoration(
                                color: tappedIndex == index
                                    ? AppColors.kGreenColor
                                    : AppColors.kWhiteColor,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.kGreenColor, width: 1),
                              ),
                              child: Center(
                                  child: BuildText(
                                color: tappedIndex == index
                                    ? AppColors.kWhiteColor
                                    : AppColors.kTextColor2,
                                size: 12,
                                text: "Categories $index",
                                fontWeight: FontWeight.bold,
                                family: "Montserrat-Regular",
                              )),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                BuildSizeBox(
                  height: Get.height * ScreenSizes.SCREEN_SIZE_4,
                ),
                Container(
                  width: double.infinity,
                  height: Get.height * ScreenSizes.SCREEN_SIZE_10,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: ListTile(
                    onTap: () {
                      Get.to(OrderDetailsScreen());
                    },
                    title: Row(
                      children: [
                        BuildText(
                          text: "Order ID #21584",
                          color: AppColors.kTextColor1,
                          family: "Montserrat-SemiBold",
                          fontWeight: FontWeight.bold,
                          size: 16,
                        ),
                        BuildSizeBox(
                          weight: Get.width * ScreenSizes.SCREEN_SIZE_6,
                        ),
                        Container(
                          width: 70,
                          height: 24,
                          child: SmallTextButton(
                            textColor: AppColors.kWhiteColor,
                            buttonColor: Color(0xff0C3469),
                            text: 'Delivery',
                            size: 12,
                            clickCallback: () {},
                          ),
                        )
                      ],
                    ),
                    subtitle: BuildText(
                      text: "20 June 2023",
                      color: AppColors.kTextColor2,
                      family: "Montserrat-SemiBold",
                      size: 14,
                    ),
                    trailing: Icon(Icons.arrow_forward_ios,
                        size: 18, color: AppColors.kTextColor2),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
