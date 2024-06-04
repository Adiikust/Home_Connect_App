import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import '../Drawer/Subscription/payment_method_screen.dart';

class SubscriptionCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String price;
  final Image image;
  final String month;
  final String buttonText;
  final String lText1;
  final String lText2;
  final String lText3;

  const SubscriptionCard(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.image,
      required this.month,
      required this.buttonText,
      required this.price,
      required this.lText1,
      required this.lText2,
      required this.lText3})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Column(
              children: [
                image,
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                BuildText(
                  text: title,
                  fontWeight: FontWeight.bold,
                  size: 20,
                  family: 'Montserrat-SemiBold',
                  color: AppColors.kTextColor1,
                ),
                BuildText(
                  text: subTitle,
                  size: 12,
                  family: 'Montserrat-Regular',
                  color: AppColors.kTextColor2,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: "Rs. ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 35,
                            color: AppColors.kTextColor1),
                      ),
                      TextSpan(
                        text: price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kTextColor2,
                          fontSize: 35,
                        ),
                      ),
                    ],
                  ),
                ),
                BuildText(
                  text: month,
                  size: 12,
                  family: 'Montserrat-Regular',
                  color: AppColors.kTextColor2,
                ),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                buildRow(lText1),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildRow(lText2),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                buildRow(lText3),
                BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                TextBottun(
                    text: buttonText,
                    clickCallback: () {
                      Get.to(() => PaymentMethodScreen());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildRow(
    String ltext,
  ) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 4,
          backgroundColor: AppColors.kGreenColor,
        ),
        BuildSizeBox(
          weight: 10,
        ),
        BuildText(
          text: ltext,
          fontWeight: FontWeight.bold,
          size: 12,
          family: 'Montserrat-SemiBold',
          color: AppColors.kTextColor1,
        ),
      ],
    );
  }
}
