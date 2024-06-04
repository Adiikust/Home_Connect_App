import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/My_Carts/Checkout/checkout_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class MyCarts extends StatefulWidget {
  const MyCarts({Key? key}) : super(key: key);

  @override
  State<MyCarts> createState() => _MyCartsState();
}

class _MyCartsState extends State<MyCarts> {
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
                    text: "My Cart",
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BuildText(
                                  color: AppColors.kTextColor1,
                                  text: "Chicken Biryani",
                                  size: 16,
                                  family: 'Montserrat-SemiBold',
                                  fontWeight: FontWeight.bold,
                                ),
                                GestureDetector(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.favorite,
                                    color: AppColors.kGreenColor,
                                  ),
                                )
                              ],
                            ),
                            BuildText(
                              color: Colors.black,
                              text: "Rs.200",
                              size: 16,
                              family: 'Montserrat-Medium',
                              fontWeight: FontWeight.bold,
                            ),
                            BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                            Row(
                              children: [
                                buildCircleAvatar("-"),
                                BuildSizeBox(
                                    weight:
                                        Get.width * ScreenSizes.SCREEN_SIZE_2),
                                BuildText(
                                  color: AppColors.kTextColor1,
                                  text: "01",
                                  size: 16,
                                  family: 'Montserrat-SemiBold',
                                ),
                                BuildSizeBox(
                                    weight:
                                        Get.width * ScreenSizes.SCREEN_SIZE_2),
                                buildCircleAvatar("+"),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                BuildText(
                  color: AppColors.kBlackColor,
                  text: "Payment Summary",
                  size: 16,
                  family: 'Montserrat-SemiBold',
                  fontWeight: FontWeight.bold,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                buildRow("Item Price", "Rs.200"),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                buildRow("Item Price", "Rs.00"),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                Divider(color: Color(0xffEAEAEA)),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                buildRow("Sub Total", "Rs.200"),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextBottun(
            text: "Proceed to Checkout",
            clickCallback: () {
              Get.to(CheckOutScreen());
            }),
      ),
    );
  }

  Row buildRow(String title, price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BuildText(
          color: AppColors.kTextColor2,
          text: title,
          size: 14,
          family: 'Montserrat-SemiBold',
        ),
        BuildText(
          color: AppColors.kTextColor1,
          text: price,
          size: 14,
          family: 'Montserrat-SemiBold',
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }

  Container buildCircleAvatar(String sign) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(25)),
      child: Center(
        child: BuildText(
          color: AppColors.kTextColor1,
          text: sign,
          size: 20,
          family: 'Montserrat-SemiBold',
        ),
      ),
    );
  }
}
