import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_manager.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_model.dart';
import 'package:vendor_app/Views/Home/User/Vendor_type/vendor_type_screen.dart';
import 'package:vendor_app/Views/Widgets/build_icon_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class SubCategoriesScreen extends StatelessWidget {
  String title;
  SubCategoriesScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 140;
    var _aspectRatio = _width / cellHeight;

    SubCategoriesManager subCategoriesManager =
        Provider.of(context).fetch(SubCategoriesManager);

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                  BuildIconButton(
                      clickCallback: () {
                        Get.back();
                      },
                      color: AppColors.kWhiteColor,
                      iconData: Icons.arrow_back_ios),
                  BuildSizeBox(weight: Get.width * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: title,
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Observer<List<SubCategoriesModel>>(
              stream: subCategoriesManager.mainList,
              onSuccess: (context, snapshot) {
                List<SubCategoriesModel>? data = snapshot;
                SubCategoriesModel modelData = data![0];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "Choose Area",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 20,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "Choose Any One to Continue",
                      color: AppColors.kTextColor2,
                      family: "Montserrat-SemiBold",
                      size: 15,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: GridView.builder(
                        itemCount: modelData.data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: _aspectRatio,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Overseer.categoriesVendorTypeID =
                                  modelData.data[index].id.toString();
                              print(
                                  "Sub catalogers ${Overseer.categoriesVendorTypeID.toString()}");
                              Get.to(VendorTypeScreen(
                                  title: modelData.data[index].name));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Card(
                                      child: Image.network(
                                    modelData.data[index].imageUrl.toString(),
                                    fit: BoxFit.cover,
                                    height: 160,
                                  )),
                                  BuildSizeBox(
                                      height: Get.height *
                                          ScreenSizes.SCREEN_SIZE_1),
                                  Text(
                                    maxLines: 1,
                                    modelData.data[index].name.toString(),
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColors.kTextColor2,
                                      fontFamily: 'Montserrat-Regular',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              onWaiting: (context) {
                return const Center(child: CircularProgressIndicator());
              },
              onError: (context, error) {
                return Center(
                  child: Column(
                    children: [
                      BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_6,
                      ),
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
          )
        ],
      ),
    );
  }
}
