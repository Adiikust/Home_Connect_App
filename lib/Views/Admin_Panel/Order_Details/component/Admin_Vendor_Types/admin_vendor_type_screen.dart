import 'package:vendor_app/AppLayer/Observer.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

import '../../../../../Utils/Exports/all_exports.dart';
import '../../../../Widgets/Outline_small_text_button.dart';
import 'admin_vendor_type_manager.dart';
import 'admin_vendor_type_model.dart';

class AdminVendorTypeScreen extends StatefulWidget {
  const AdminVendorTypeScreen({Key? key}) : super(key: key);

  @override
  State<AdminVendorTypeScreen> createState() => _AdminVendorTypeScreenState();
}

class _AdminVendorTypeScreenState extends State<AdminVendorTypeScreen> {
  @override
  Widget build(BuildContext context) {
    AdminVendorTypeManager adminVendorTypeManager =
        Provider.of(context).fetch(AdminVendorTypeManager);
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      appBar: AppBar(
        backgroundColor: AppColors.kGreenColor,
        title: Text('Vendor Types'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Observer<List<AdminVendorTypeModel>>(
          stream: adminVendorTypeManager.mainList,
          onSuccess: (context, snapshot) {
            List<AdminVendorTypeModel>? data = snapshot;
            AdminVendorTypeModel modelData = data![0];
            return ListView.builder(
              itemCount: modelData.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 80,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        String idString = modelData.data![index].id.toString();
                        if (Overseer.addAdminVendorTypesIdList
                            .contains(idString)) {
                          Overseer.addAdminVendorTypesIdList.remove(idString);
                        } else {
                          Overseer.addAdminVendorTypesIdList.add(idString);
                        }
                        print(
                            "inquirySubCategoriesVendorTypeIdList ############${Overseer.addAdminVendorTypesIdList}");
                      });
                    },
                    child: Card(
                      color: Overseer.addAdminVendorTypesIdList
                              .contains(modelData.data![index].id.toString())
                          ? AppColors.kGreenColor
                          : Colors.white,
                      child: ListTile(
                        title: BuildText(
                          text: modelData.data![index].name.toString(),
                          color: Overseer.addAdminVendorTypesIdList.contains(
                                  modelData.data![index].id.toString())
                              ? AppColors.kWhiteColor
                              : AppColors.kTextColor1,
                          fontWeight: FontWeight.bold,
                          family: "Montserrat-SemiBold",
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: OutLineSmallTextButton(
                  textColor: AppColors.kWhiteColor,
                  buttonColor: AppColors.kGreenColor,
                  text: "Back",
                  clickCallback: () {
                    Get.back();
                  }),
            )
          ],
        ),
      ),
    );
  }
}
