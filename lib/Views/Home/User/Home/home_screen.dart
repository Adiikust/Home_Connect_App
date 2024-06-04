import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryManager.dart';
import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryModel.dart';
import 'package:vendor_app/Views/Home/User/Sub_Categories/sub_categories_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

final selectCategoriesController = Get.put(SelectCategoriesController());

class _HomeScreenState extends State<HomeScreen> {
  String getFirstName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.length > 0) {
      return nameParts[0];
    }
    return '';
  }

  @override
  Widget build(BuildContext context) {
    var _crossAxisSpacing = 8;
    var _screenWidth = MediaQuery.of(context).size.width;
    var _crossAxisCount = 3;
    var _width = (_screenWidth - ((_crossAxisCount - 1) * _crossAxisSpacing)) /
        _crossAxisCount;
    var cellHeight = 140;
    var _aspectRatio = _width / cellHeight;

    HomeUserDictionaryManager homeUserDictionaryManager =
        Provider.of(context).fetch(HomeUserDictionaryManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("images/big_appbar.png"),
                        fit: BoxFit.fill),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BuildText(
                            text:
                                "Hello ${getFirstName(Overseer.userProfileName)}",
                            color: AppColors.kWhiteColor,
                            fontWeight: FontWeight.bold,
                            family: "Montserrat-SemiBold",
                            size: 28,
                          ),
                          BuildText(
                            text: "What Service do you need?",
                            color: AppColors.kCardDArkColor,
                            family: "Montserrat-Regular",
                            size: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: Get.height * ScreenSizes.SCREEN_SIZE_38,
                    child: Image.asset("images/home7.png"),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Observer<List<HomeUserDictionaryModel>>(
                stream: homeUserDictionaryManager.mainList,
                onSuccess: (context, snapshot) {
                  List<HomeUserDictionaryModel>? data = snapshot;
                  HomeUserDictionaryModel modelData = data![0];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BuildText(
                        text: AppConstants.CATAGORIES,
                        color: AppColors.kTextColor1,
                        fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 20,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      BuildText(
                        text: "Select Category for More!",
                        color: AppColors.kTextColor2,
                        //fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 15,
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      SizedBox(
                        width: double.infinity,
                        child: GridView.builder(
                          itemCount: modelData.data.length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: _aspectRatio,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Overseer.mainCategoriesID =
                                    modelData.data[index].id.toString();
                                Get.to(SubCategoriesScreen(
                                  title: modelData.data[index].name.toString(),
                                ));
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    Card(
                                        child: Image.network(
                                      modelData.data[index].imageUrl.toString(),
                                      fit: BoxFit.cover,
                                      height: 150,
                                    )),
                                    Spacer(),
                                    BuildText(
                                      text:
                                          modelData.data[index].name.toString(),
                                      size: 14,
                                      color: AppColors.kTextColor2,
                                      family: 'Montserrat-Regular',
                                    ),
                                    BuildSizeBox(
                                        height: Get.height *
                                            ScreenSizes.SCREEN_SIZE_1),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      BuildSizeBox(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_3),
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
            ),
          ],
        ),
      ),
    );
  }
}
