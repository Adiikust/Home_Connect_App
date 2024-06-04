import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/My_Orders/Order_Track/order_track_screen.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_My_Order/Order_Details/order_details_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:vendor_app/Views/Widgets/small_text_button.dart';

class RunningOrderScreen extends StatelessWidget {
  const RunningOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Get.to(OrderDetailsScreen());
          },
          child: Card(
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
                            image: AssetImage("images/catagories/home4.png")),
                        color: Colors.yellow,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                  ),
                  BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildText(
                            color: AppColors.kTextColor1,
                            text: "Order ID #21584",
                            size: 16,
                            family: 'Montserrat-SemiBold',
                            fontWeight: FontWeight.bold,
                          ),
                          BuildSizeBox(
                              weight: Get.width * ScreenSizes.SCREEN_SIZE_4),
                          Container(
                            width: 70,
                            height: 24,
                            child: SmallTextButton(
                              textColor: AppColors.kWhiteColor,
                              buttonColor: Color(0xff0C3469),
                              text: 'Pending',
                              size: 12,
                              clickCallback: () {},
                            ),
                          )
                        ],
                      ),
                      BuildText(
                        color: AppColors.kTextColor2,
                        text: "20 June 2023",
                        size: 13,
                        family: 'Montserrat-SemiBold',
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      Container(
                        width: 80,
                        height: 30,
                        child: SmallTextButton(
                          textColor: AppColors.kWhiteColor,
                          buttonColor: AppColors.kGreenColor,
                          text: 'Track Order',
                          size: 12,
                          clickCallback: () {
                            Get.to(OrderTrackScreen());
                          },
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
