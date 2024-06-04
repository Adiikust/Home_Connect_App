import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseManager.dart';
import 'package:vendor_app/Views/Home/User/Listing_ShowCase_User/ShowCase_Vendor/userShowcaseModel.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Add_ShowCase_Item/add_showCase_product.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Edit_ShowCase/edit_showcas_product.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import '../../../../../Utils/Exports/all_exports.dart';

class UserShowCaseScreen extends StatelessWidget {
  UserShowCaseScreen({Key? key}) : super(key: key);
  List img = [
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
    AppImages.BIRDSDETAILS2,
    AppImages.BIRDSDETAILS1,
  ];

  @override
  Widget build(BuildContext context) {
    UserShowCaseManager userShowCaseManager =
        Provider.of(context).fetch(UserShowCaseManager);

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Observer<List<UserShowCaseModel>>(
        stream: userShowCaseManager.mainList,
        onSuccess: (context, snapshot) {
          List<UserShowCaseModel>? data = snapshot;
          UserShowCaseModel modelData = data![0];
          return ListView.builder(
            itemCount: modelData.data!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20)),
                        height: 250,
                        width: double.infinity,
                        child: ImageSlideshow(
                          initialPage: 4,
                          indicatorColor: AppColors.kGreenColor,
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                            Image.asset(
                              img[index],
                              fit: BoxFit.cover,
                            ),
                          ],
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },
                          autoPlayInterval: 3000,
                          isLoop: true,
                        ),
                      ),
                      BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          BuildText(
                            text: modelData.data![index].name.toString(),
                            size: 18,
                            family: 'Montserrat-SemiBold',
                            fontWeight: FontWeight.bold,
                            color: AppColors.kTextColor1,
                          ),
                        ],
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: modelData.data![index].description.toString(),
                        size: 12,
                        family: 'Montserrat-Regular',
                        color: AppColors.kTextColor2,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    ],
                  ),
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
