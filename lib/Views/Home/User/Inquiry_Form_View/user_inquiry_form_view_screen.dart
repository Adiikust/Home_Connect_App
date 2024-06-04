import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_app/AppLayer/Overseer.dart';
import 'package:vendor_app/Utils/Colors/app_color.dart';
import 'package:vendor_app/Utils/Screen_Size/screen_sizes.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/components/User_Inquiry_Form_details_view/user_inquiry_form_view_details_screen.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_manager.dart';
import 'package:vendor_app/Views/Home/User/Inquiry_Form_View/user_Inquiry_form_view_model.dart';
import 'package:vendor_app/Views/Widgets/build_size_box.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../AppLayer/Observer.dart';
import '../../../../AppLayer/Provider.dart';
import 'components/Delete_Inquiry/User_inquiry_delete_services.dart';

class UserInquiryFormScreenView extends StatelessWidget {
  UserInquiryFormScreenView({Key? key}) : super(key: key);
  final UserInquiryDeleteServices userInquiryDeleteServices =
      UserInquiryDeleteServices();

  ///Function pop
  showWarning(BuildContext context) async => await showDialog(
      context: context,
      builder: (context) => AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            content: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    "Are your sure you want to delete this inquiry Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.kGreenColor,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.back();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.kWhiteColor,
                            ),
                            child: const Text(
                              "No",
                              style: TextStyle(color: AppColors.kBlackColor),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(
                                      color: AppColors.kGreenColor,
                                    ),
                                  );
                                },
                                barrierDismissible: false,
                              );
                              userInquiryDeleteServices.deleteUserInquiryData(
                                  context: context);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.kWhiteColor,
                            ),
                            child: const Text(
                              "Yes",
                              style: TextStyle(color: AppColors.kBlackColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ));

  @override
  Widget build(BuildContext context) {
    UserInquiryFormViewManager userInquiryFormViewManager =
        Provider.of(context).fetch(UserInquiryFormViewManager);
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
                    text: "Inquiry Form View",
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
              child: Observer<List<UserInquiryFormViewModel>>(
                stream: userInquiryFormViewManager.mainList,
                onSuccess: (context, snapshot) {
                  List<UserInquiryFormViewModel>? data = snapshot;
                  UserInquiryFormViewModel modelData = data![0];
                  if (modelData.data!.isNotEmpty) {
                    return ListView.builder(
                      itemCount: modelData.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          color: Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: AppColors.kGreenColor,
                              backgroundImage: NetworkImage(
                                  modelData.data![index].image![0].toString()),
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
                            trailing: Container(
                              width: 50,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Overseer.userInquiryDeleteId =
                                          modelData.data![index].id.toString();
                                      print(
                                          "######### userInquiryFormId ${Overseer.userInquiryDeleteId}");
                                      showWarning(context);
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      size: 18,
                                      color: AppColors.kGreenColor,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 18,
                                    color: AppColors.kGreenColor,
                                  ),
                                ],
                              ),
                            ),
                            onTap: () {
                              Get.to(UserInquiryFormViewDetailsScreen(
                                  modelIndex: index, modelData: modelData));
                            },
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                      child: BuildText(
                        text: "No Inquiry Found",
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
                  print(error);
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
