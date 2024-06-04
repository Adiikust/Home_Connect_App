import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
                          color: Colors.white,
                        )),
                    BuildSizeBox(
                      weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                    ),
                    BuildText(
                      text: "Payment",
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildText(
                    text: "Account Details",
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
                    text: "Account Number",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-Regular",
                    size: 12,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  TextFormField(
                    onChanged: (value) {},
                    // controller: _emailEditingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Account Number",
                      hintStyle: TextStyle(
                        color: AppColors.kTextColor2,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),

                  ///
                  BuildText(
                    text: "Validity",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-Regular",
                    size: 12,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: TextFormField(
                            onChanged: (value) {},
                            // controller: _emailEditingController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Year",
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
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 3),
                          child: TextFormField(
                            onChanged: (value) {},
                            // controller: _emailEditingController,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              hintText: "Month",
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
                        ),
                      ),
                    ],
                  ),

                  ///
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "Holder Name",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-Regular",
                    size: 12,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  TextFormField(
                    onChanged: (value) {},
                    // controller: _emailEditingController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      hintText: "Holder Name",
                      hintStyle: TextStyle(
                        color: AppColors.kTextColor2,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 11,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(width: 1, color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "Billing Information",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  buildRow("Product Name", "Home Furniture"),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  buildRow("Product ID", "2164243"),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  buildRow("Pierce", "Rs.2000"),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  const Divider(
                    thickness: 2,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  buildRow("Quantity", "02"),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  buildRow("Total", "Rs.400"),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextBottun(
                        text: "Pay Now",
                        clickCallback: () {
                          // Get.to(() => const PaymentScreen());
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row buildRow(String productTitle, productName) {
    return Row(
      children: [
        BuildText(
          text: productTitle,
          color: AppColors.kTextColor2,
          fontWeight: FontWeight.bold,
          family: "Montserrat-Regular",
          size: 14,
        ),
        BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_3),
        BuildText(
          text: productName,
          color: AppColors.kTextColor1,
          fontWeight: FontWeight.bold,
          family: "Montserrat-Regular",
          size: 14,
        )
      ],
    );
  }
}
