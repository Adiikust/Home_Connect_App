import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Drawer/Subscription/payment_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class PaymentMethodScreen extends StatefulWidget {
  PaymentMethodScreen({Key? key}) : super(key: key);

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  late int _sellect = 0;
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
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Payment Methods",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
                child: Column(
              children: [
                Card(
                  elevation: 2,
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
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                Card(
                  elevation: 2,
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
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                Card(
                  elevation: 2,
                  child: ListTile(
                    leading: Icon(
                      Icons.food_bank_outlined,
                      color: _sellect == 2
                          ? AppColors.kGreenColor
                          : AppColors.kCardDArkColor,
                    ),
                    title: BuildText(
                      text: "EasyPisa",
                      color: _sellect == 2
                          ? AppColors.kGreenColor
                          : AppColors.kCardDArkColor,
                      family: "Montserrat-SemiBold",
                      size: 16,
                    ),
                    trailing: Radio(
                      value: 2,
                      activeColor: _sellect == 2
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
              ],
            )),
          ),
          BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextBottun(
                text: "Continue",
                clickCallback: () {
                  Get.to(() => const PaymentScreen());
                }),
          ),
        ],
      ),
    );
  }
}
