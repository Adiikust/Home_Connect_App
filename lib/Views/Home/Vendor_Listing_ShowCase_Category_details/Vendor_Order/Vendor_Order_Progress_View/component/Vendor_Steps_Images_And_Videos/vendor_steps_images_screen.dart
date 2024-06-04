import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorStepsImagesScreen extends StatelessWidget {
  final List<String> vendorStepsImages;
  VendorStepsImagesScreen({Key? key, required this.vendorStepsImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Task View Images",
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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Images",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "View All Images",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  vendorStepsImages.isNotEmpty
                      ? Expanded(
                          child: Container(
                            width: double.infinity,
                            child: GridView.builder(
                              itemCount: vendorStepsImages.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (BuildContext context, int index) {
                                print(
                                    " Images ####### ${vendorStepsImages[0].toString()}");
                                return GestureDetector(
                                  onDoubleTap: () {
                                    Get.defaultDialog(
                                        title: "Image",
                                        content: const Text(""),
                                        actions: [
                                          SizedBox(
                                            // height: Get.height * 0.5,
                                            child: Image.network(
                                                vendorStepsImages[index]
                                                    .toString(),
                                                fit: BoxFit.contain),
                                          )
                                        ]);
                                  },
                                  child: Card(
                                    color: AppColors.kGreenColor,
                                    child: Image.network(
                                        vendorStepsImages[index].toString(),
                                        fit: BoxFit.cover),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                          child: Center(
                            child: BuildText(
                              text: "Task Images List is Empty",
                              color: AppColors.kTextColor1,
                              family: "Montserrat-Regular",
                              fontWeight: FontWeight.bold,
                              size: 18,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
