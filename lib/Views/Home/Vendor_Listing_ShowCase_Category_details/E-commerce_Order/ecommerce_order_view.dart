import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/E-commerce_Order/ecommercee_order_model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class EcommerceOrderView extends StatefulWidget {
  const EcommerceOrderView({Key? key}) : super(key: key);

  @override
  State<EcommerceOrderView> createState() => _EcommerceOrderViewState();
}

class _EcommerceOrderViewState extends State<EcommerceOrderView> {
  @override
  Widget build(BuildContext context) {
    EcommerceOrderManager ecommerceOrderManager =
        Provider.of(context).fetch(EcommerceOrderManager);
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
                        color: AppColors.kWhiteColor,
                      )),
                  BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "E-Commerce Order",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
              child: Observer<List<EcommerceOrderModel>>(
            stream: ecommerceOrderManager.mainList,
            onSuccess: (context, snapshot) {
              List<EcommerceOrderModel>? data = snapshot;
              EcommerceOrderModel modelData = data![0];
              return ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 3),
                          child: Container(
                            height: 150,
                            width: 140,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('images/garden/g1.png')),
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                        child: BuildText(
                                      text: "Table",
                                      size: 16,
                                      color: AppColors.kTextColor1,
                                      fontWeight: FontWeight.bold,
                                      family: 'Montserrat-SemiBold',
                                    )),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 5),
                                        child: OutlinedButton(
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: AppColors.kGreenColor,
                                                width: 1),
                                          ),
                                          onPressed: () {},
                                          child: BuildText(
                                            text: "pending",
                                            size: 12,
                                            color: AppColors.kGreenColor,
                                            fontWeight: FontWeight.bold,
                                            family: 'Montserrat-SemiBold',
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                              BuildText(
                                text: "Price: 200",
                                size: 12,
                                color: AppColors.kTextColor2,
                                family: 'Montserrat-Regular',
                              ),
                              SizedBox(height: 2),
                              BuildText(
                                text: "Delivery Day: 7",
                                size: 12,
                                color: AppColors.kTextColor2,
                                family: 'Montserrat-Regular',
                              ),
                              SizedBox(height: 2),
                              BuildText(
                                text: "Amount Status: Online",
                                size: 12,
                                color: AppColors.kTextColor2,
                                family: 'Montserrat-Regular',
                              ),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                              BuildText(
                                text: "Location",
                                size: 12,
                                color: AppColors.kTextColor2,
                                fontWeight: FontWeight.bold,
                                family: "Montserrat-SemiBold",
                              ),
                              BuildSizeBox(height: 3),
                              Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  "Finally, build and run your project to ensure everything is working correctly",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.kTextColor2,
                                    fontFamily: 'Montserrat-Regular',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            onWaiting: (context) {
              return const Center(child: CircularProgressIndicator());
            },
            onError: (context, error) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_15),
                    SvgPicture.asset(
                      "images/bklogo.svg",
                      height: 200,
                      width: 30,
                    ),
                  ],
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}
