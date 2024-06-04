import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/User/Buy_Product/buy_product_screen.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/Listing_User/userLstingManager.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../Utils/Exports/all_exports.dart';
import 'userListingModel.dart';

class UserListingScreen extends StatelessWidget {
  UserListingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserListingManager userListingManager =
        Provider.of(context).fetch(UserListingManager);

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Observer<List<UserListingModel>>(
        stream: userListingManager.mainList,
        onSuccess: (context, snapshot) {
          List<UserListingModel>? data = snapshot;
          UserListingModel modelData = data![0];
          return ListView.builder(
            itemCount: modelData.data!.length,
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
                                image: NetworkImage(modelData
                                    .data![index].imageUrl![0]
                                    .toString())),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                    child: BuildText(
                                  text: modelData.data![index].name.toString(),
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
                                      onPressed: () {
                                        Get.to(BuyProductScreen(
                                          index: index,
                                          modelData: modelData,
                                        ));
                                      },
                                      child: BuildText(
                                        text: "Buy",
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
                            text:
                                "Price  ${modelData.data![index].price.toString()}",
                            size: 12,
                            color: AppColors.kTextColor2,
                            family: 'Montserrat-Regular',
                          ),
                          BuildSizeBox(
                              height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                          BuildText(
                            text: "DESCRIPTION",
                            size: 12,
                            color: AppColors.kTextColor2,
                            fontWeight: FontWeight.bold,
                            family: "Montserrat-SemiBold",
                          ),
                          BuildSizeBox(height: 3),
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Text(
                              maxLines: 4,
                              modelData.data![index].description.toString(),
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
                SvgPicture.asset(
                  "images/bklogo.svg",
                  height: 200,
                  width: 30,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
