import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'choiceShowCaseManager.dart';
import 'choiceShowCaseModel.dart';

class ChoiceShowCaseScreen extends StatefulWidget {
  const ChoiceShowCaseScreen({Key? key}) : super(key: key);

  @override
  State<ChoiceShowCaseScreen> createState() => _ChoiceShowCaseScreenState();
}

class _ChoiceShowCaseScreenState extends State<ChoiceShowCaseScreen> {
  @override
  Widget build(BuildContext context) {
    ChoiceShowCaseManager choiceShowCaseManager =
        Provider.of(context).fetch(ChoiceShowCaseManager);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      text: "Select Choice Order",
                      color: AppColors.kWhiteColor,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer<List<ChoiceShowCaseListModel>>(
                stream: choiceShowCaseManager.mainList,
                onSuccess: (context, snapshot) {
                  List<ChoiceShowCaseListModel>? data = snapshot;
                  ChoiceShowCaseListModel modelData = data![0];
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: modelData.data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                height: 300,
                                width: double.infinity,
                                modelData.data![index].imageUrl![0].toString(),
                                fit: BoxFit.fill,
                              ),
                              BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_2,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  BuildText(
                                    text:
                                        modelData.data![index].name.toString(),
                                    color: AppColors.kTextColor1,
                                    fontWeight: FontWeight.bold,
                                    family: "Montserrat-SemiBold",
                                    size: 20,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        String idString = modelData
                                            .data![index].id
                                            .toString();
                                        if (Overseer.inquiryChoiceShowCaseIdList
                                            .contains(idString)) {
                                          Overseer.inquiryChoiceShowCaseIdList
                                              .remove(idString);
                                        } else {
                                          Overseer.inquiryChoiceShowCaseIdList
                                              .add(idString);
                                        }
                                        print(
                                            "inquirySubCategoriesVendorTypeIdList ############${Overseer.inquiryChoiceShowCaseIdList}");
                                      });
                                    },
                                    child: Overseer.inquiryChoiceShowCaseIdList
                                            .contains(modelData.data![index].id
                                                .toString())
                                        ? Icon(
                                            Icons.bookmark_outlined,
                                            color: AppColors.kGreenColor,
                                            size: 34,
                                          )
                                        : Icon(
                                            Icons.bookmark_border_outlined,
                                            color: AppColors.kGreenColor,
                                            size: 34,
                                          ),
                                  )
                                ],
                              ),
                              BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                              ),
                              BuildText(
                                text: modelData.data![index].description
                                    .toString(),
                                color: AppColors.kTextColor2,
                                family: "Montserrat-Regular",
                                size: 14,
                              ),
                              BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                              ),
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
                  print("###### $error");
                  return const Text(
                    AppConstants.WELCOM_HOME_TEXT,
                    style: TextStyle(
                        fontSize: 18, color: AppColors.kDArkBlackColor),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextBottun(
          text: "Back",
          clickCallback: () {
            Get.back();
          },
        ),
      ),
    );
  }
}
