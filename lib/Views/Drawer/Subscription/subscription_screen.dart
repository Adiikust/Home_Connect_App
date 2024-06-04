import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Drawer/Subscription/payment_method_screen.dart';
import 'package:vendor_app/Views/Widgets/Subscription_card.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import '../../Widgets/small_text_button.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _isList1Visible = 1;
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
                    text: "Subscription",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
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
                          text: 'Basic',
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
                          text: 'Standard',
                          clickCallback: () {
                            setState(() {
                              _isList1Visible = 2;
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SmallTextButton(
                          textColor: _isList1Visible == 3
                              ? AppColors.kWhiteColor
                              : AppColors.kWhiteColor,
                          buttonColor: _isList1Visible == 3
                              ? AppColors.kGreenColor
                              : AppColors.kCardDArkColor,
                          text: 'Premium',
                          clickCallback: () {
                            setState(() {
                              _isList1Visible = 3;
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: _isList1Visible == 1
                        ? SubscriptionCard(
                            image: Image.asset("images/subscription/sub3.png"),
                            title: "Basic",
                            subTitle: "A simple start for everyone",
                            buttonText: "Your Current Plan",
                            month: "Per month",
                            price: "0",
                            lText1: "Many Discounts",
                            lText2: "Free & Fast Delivery",
                            lText3: "Unlimited Orders",
                          )
                        : _isList1Visible == 2
                            ? SubscriptionCard(
                                image:
                                    Image.asset("images/subscription/sub2.png"),
                                title: "Standard",
                                subTitle: "A simple start for everyone",
                                buttonText: "Upgrade Plan",
                                month: "Per month",
                                price: "3000",
                                lText1: "Many Discounts",
                                lText2: "Free & Fast Delivery",
                                lText3: "Unlimited Orders",
                              )
                            : _isList1Visible == 3
                                ? SubscriptionCard(
                                    image: Image.asset(
                                        "images/subscription/sub1.png"),
                                    title: "Premium",
                                    subTitle: "A simple start for everyone",
                                    buttonText: "Upgrade Plan",
                                    month: "Per month",
                                    price: "6000",
                                    lText1: "Many Discounts",
                                    lText2: "Free & Fast Delivery",
                                    lText3: "Unlimited Orders",
                                  )
                                : Container()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
