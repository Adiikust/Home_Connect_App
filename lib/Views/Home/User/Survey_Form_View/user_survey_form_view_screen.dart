import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Home/User/Survey_Form_View/user_survey_form_view_manager.dart';
import 'package:vendor_app/Views/Home/User/Survey_Form_View/user_survey_form_view_model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../Utils/Exports/all_exports.dart';
import 'compenent/user_survey_form_view_details_screen.dart';

class UserSurveyFormScreenView extends StatelessWidget {
  const UserSurveyFormScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserSurveyFormViewManager userSurveyFormViewManager =
        Provider.of(context).fetch(UserSurveyFormViewManager);
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
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Survey Form View",
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Observer<List<UserSurveyFormViewModel>>(
                stream: userSurveyFormViewManager.mainList,
                onSuccess: (context, snapshot) {
                  List<UserSurveyFormViewModel>? data = snapshot;
                  UserSurveyFormViewModel modelData = data![0];

                  if (modelData.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: modelData.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: AppColors.kGreenColor,
                                backgroundImage:
                                    modelData.data![index].image!.length != 0
                                        ? NetworkImage(modelData
                                            .data![index].image![0]
                                            .toString())
                                        : NetworkImage(""),
                              ),
                              title: BuildText(
                                text: modelData.data![index].name.toString(),
                                color: AppColors.kBlackColor,
                                fontWeight: FontWeight.bold,
                                family: "Montserrat-Medium",
                                size: 15,
                              ),
                              subtitle: BuildText(
                                text: modelData.data![index].email.toString(),
                                family: "Montserrat-Medium",
                              ),
                              trailing: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                                color: AppColors.kGreenColor,
                              ),
                              onTap: () {
                                Get.to(UserSurveyFormViewDetailsScreen(
                                    modelIndex: index, modelData: modelData));
                              },
                            ));
                      },
                    );
                  } else {
                    return Center(
                      child: BuildText(
                        text: "No Survey Found",
                        color: AppColors.kTextColor1,
                        fontWeight: FontWeight.bold,
                        family: "Montserrat-SemiBold",
                        size: 20,
                      ),
                    );
                  }
                },
                onWaiting: (context) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: AppColors.kGreenColor,
                  ));
                },
                onError: (context, error) {
                  return Center(
                    child: Text(
                      "Sever Error",
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
