import 'dart:convert';

import 'package:vendor_app/Views/Admin_Panel/Order_Details/Order_Details/admin_order_details_manager.dart';
import 'package:vendor_app/Views/Admin_Panel/Order_Details/admin_inquiry_and_survey_form_screen.dart';
import 'package:vendor_app/Views/Admin_Panel/Order_Details/component/Admin_Drawer/admin_drawer.dart';
import '../../../../AppLayer/Observer.dart';
import '../../../../Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import 'admin_order_details_model.dart';

class AdminOrderDetailsScreen extends StatefulWidget {
  const AdminOrderDetailsScreen({Key? key}) : super(key: key);

  @override
  State<AdminOrderDetailsScreen> createState() =>
      _AdminOrderDetailsScreenState();
}

Future<bool> showWarning(BuildContext context) async => await showDialog(
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
                  "Do You Really Want to Exit the App?",
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
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.kWhiteColor,
                            ),
                            child: const Text(
                              "Cancel",
                              style: TextStyle(color: AppColors.kBlackColor),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: AppColors.kBlackColor,
                            ),
                            child: const Text(
                              "Confirm",
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ));

class _AdminOrderDetailsScreenState extends State<AdminOrderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    AdminOrderDetailsManager adminOrderDetailsManager =
        Provider.of(context).fetch(AdminOrderDetailsManager);
    return WillPopScope(
      onWillPop: () async {
        final shouldPOp = await showWarning(context);
        return shouldPOp;
      },
      child: Scaffold(
        backgroundColor: const Color(0XffF5F5F5),
        appBar: AppBar(
            backgroundColor: AppColors.kGreenColor,
            title: Text("Order Details")),
        drawer: AdminBuildDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    BuildText(
                      text: "Your Orders",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 20,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "All Your Orders Will Show Here",
                      color: AppColors.kTextColor2,
                      family: "Montserrat-SemiBold",
                      size: 14,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    Observer<List<AdminOrderDetailsModel>>(
                      stream: adminOrderDetailsManager.mainList,
                      onSuccess: (context, snapshot) {
                        List<AdminOrderDetailsModel>? data = snapshot;
                        AdminOrderDetailsModel modelData = data![0];
                        if (modelData.data!.isNotEmpty) {
                          return ListView.builder(
                            itemCount: modelData.data!.length,
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Card(
                                  color: Colors.white,
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: AppColors.kGreenColor,
                                      backgroundImage: modelData
                                                  .data![index].image!.length !=
                                              0
                                          ? NetworkImage(modelData
                                              .data![index].image![0]
                                              .toString())
                                          : NetworkImage(""),
                                    ),
                                    title: BuildText(
                                      text: modelData.data![index].name
                                          .toString(),
                                      color: AppColors.kBlackColor,
                                      fontWeight: FontWeight.bold,
                                      family: "Montserrat-Medium",
                                      size: 15,
                                    ),
                                    subtitle: BuildText(
                                      text: modelData.data![index].email
                                          .toString(),
                                      family: "Montserrat-Medium",
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 18,
                                      color: AppColors.kGreenColor,
                                    ),
                                    onTap: () {
                                      Overseer.addAdminVendorTypesIdList
                                          .clear();
                                      Overseer.adminOrderDetailsIDByShowVendorType =
                                          modelData.data![index].id.toString();
                                      Overseer.addAdminVendorTypesIdList =
                                          List<String>.from(jsonDecode(modelData
                                                  .data![index].vendorTypeId!)
                                              .map((e) => e.toString())
                                              .toList());

                                      print(modelData.data![index].vendorTypeId
                                          .runtimeType);
                                      print(
                                          "######## addAdminVendorTypesIdList ${Overseer.addAdminVendorTypesIdList} ");
                                      print(
                                          "######## adminOrderDetailsIDByShowVendorType ${Overseer.adminOrderDetailsIDByShowVendorType} ");
                                      Get.to(AdminInquiryAndSurveyFormScreen(
                                          modelIndex: index,
                                          modelData: modelData));
                                    },
                                  ));
                            },
                          );
                        } else {
                          return Container(
                            height: 400,
                            child: Center(
                              child: BuildText(
                                text: "No Order Found",
                                color: AppColors.kTextColor1,
                                fontWeight: FontWeight.bold,
                                family: "Montserrat-SemiBold",
                                size: 20,
                              ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
