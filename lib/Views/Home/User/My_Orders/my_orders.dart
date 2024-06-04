import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/My_Orders/Running_Order/running_order_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
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
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
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
                          text: 'Running',
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
                          text: 'History',
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
                _isList1Visible == 1
                    ? RunningOrderScreen()
                    : _isList1Visible == 2
                        ? RunningOrderScreen()
                        : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
