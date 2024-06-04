import 'package:flutter_svg/svg.dart';
import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryManager.dart';
import 'package:vendor_app/Views/Home/User/Home/homeUserDictionaryModel.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_Fill/select_sub_caegory_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class SelectCategories extends StatefulWidget {
  const SelectCategories({Key? key}) : super(key: key);

  @override
  State<SelectCategories> createState() => _SelectCategoriesState();
}

class _SelectCategoriesState extends State<SelectCategories> {
  final selectIndexController controller = Get.put(selectIndexController());
  final selectCategoriesController = Get.put(SelectCategoriesController());

  String? title;
  String? productID;
  String? stateId;

  @override
  Widget build(BuildContext context) {
    HomeUserDictionaryManager homeUserDictionaryManager =
        Provider.of(context).fetch(HomeUserDictionaryManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: SingleChildScrollView(
        child: SafeArea(
          child: GetBuilder<selectIndexController>(
            builder: (seletidex) {
              return Column(
                children: [
                  Container(
                      height: 60,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("images/small_appbar.png"),
                            fit: BoxFit.fill),
                      ),
                      alignment: Alignment.center,
                      child: BuildText(
                        text: "Choose Category",
                        size: 18,
                        color: AppColors.kWhiteColor,
                        family: 'Montserrat-SemiBold',
                        fontWeight: FontWeight.bold,
                      )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                        BuildText(
                          text: "Please Select the Category",
                          size: 20,
                          color: AppColors.kTextColor1,
                          family: 'Montserrat-SemiBold',
                          fontWeight: FontWeight.bold,
                        ),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                        BuildText(
                          text: "Select Any One to Continue",
                          size: 15,
                          color: AppColors.kTextColor2,
                          family: 'Montserrat-Regular',
                        ),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                        GetBuilder<selectIndexController>(
                            builder: (selectController) {
                          return Observer<List<HomeUserDictionaryModel>>(
                            stream: homeUserDictionaryManager.mainList,
                            onSuccess: (context, snapshot) {
                              List<HomeUserDictionaryModel>? data = snapshot;
                              HomeUserDictionaryModel modelData = data![0];
                              stateId = modelData.data.length.toString();
                              return GridView.builder(
                                itemCount: modelData.data.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: 3 / 4,
                                        crossAxisSpacing: 12,
                                        mainAxisSpacing: 20,
                                        crossAxisCount: 3),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      selectController.updateIndex(
                                          selectIndex: index);
                                      title =
                                          modelData.data[index].name.toString();
                                      productID =
                                          modelData.data[index].id.toString();
                                      Overseer.inquiryCategoriesID =
                                          modelData.data[index].id.toString();
                                      print(
                                          "***************${Overseer.inquiryCategoriesID.toString()}");
                                    },
                                    child: Stack(
                                      children: [
                                        Column(
                                          children: [
                                            Card(
                                                color: selectController
                                                            .selectedIndex ==
                                                        index
                                                    ? AppColors.kGreenColor
                                                    : AppColors.kWhiteColor,
                                                child: Image.network(
                                                  modelData.data[index].imageUrl
                                                      .toString(),
                                                  fit: BoxFit.cover,
                                                )),
                                            BuildSizeBox(
                                                height: Get.height *
                                                    ScreenSizes.SCREEN_SIZE_1),
                                            BuildText(
                                              text: modelData.data[index].name
                                                  .toString(),
                                              size: 12,
                                              family: 'Montserrat-Regular',
                                              color: AppColors.kTextColor2,
                                            )
                                          ],
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: AppColors.kWhiteColor,
                                                border: Border.all(width: 2),
                                                shape: BoxShape.circle),
                                            child: selectController
                                                        .selectedIndex ==
                                                    index
                                                ? const Icon(
                                                    Icons.check,
                                                    color:
                                                        AppColors.kGreenColor,
                                                  )
                                                : Container(
                                                    color:
                                                        AppColors.kWhiteColor,
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            onWaiting: (context) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            },
                            onError: (context, error) {
                              return Center(
                                child: Column(
                                  children: [
                                    BuildSizeBox(
                                      height: Get.height *
                                          ScreenSizes.SCREEN_SIZE_6,
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
                          );
                        }),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                        controller.selectedIndex != null
                            ? stateId != null
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    child: TextBottun(
                                      text: "Next",
                                      clickCallback: () {
                                        Overseer.mainCategoriesID =
                                            productID.toString();
                                        Get.to(SelectSubCategoriesScreen(
                                            title: title.toString()));
                                      },
                                    ),
                                  )
                                : Container()
                            : Container(),
                        BuildSizeBox(
                            height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                      ],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
