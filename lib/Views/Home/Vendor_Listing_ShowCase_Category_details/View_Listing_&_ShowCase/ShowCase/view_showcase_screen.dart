import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/View_Listing_&_ShowCase/ShowCase/component/delete_showcase_images_services.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import '../../../../../Utils/Exports/all_exports.dart';

class ViewShowCaseScreen extends StatefulWidget {
  String productID;
  String productTitle;
  String productDescription;
  List<String>? dataList;
  ViewShowCaseScreen(
      {Key? key,
      this.dataList,
      required this.productID,
      required this.productDescription,
      required this.productTitle})
      : super(key: key);

  @override
  State<ViewShowCaseScreen> createState() => _ViewListingScreenState();
}

class _ViewListingScreenState extends State<ViewShowCaseScreen> {
  final DeleteShowCaseImageServices deleteShowCaseImageServices =
      DeleteShowCaseImageServices();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String file = "";

  deleteDialogBox(
          {required BuildContext context,
          required String categoriesId,
          required String imgUrl}) async =>
      await showDialog(
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
                        "Are you sure you want to delete this image",
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
                              mainAxisAlignment: MainAxisAlignment.end,
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
                                    style:
                                        TextStyle(color: AppColors.kBlackColor),
                                  ),
                                ),
                                BuildSizeBox(weight: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    deleteShowCaseImageServices
                                        .deleteShowCaseImagesData(
                                            categoriesId: categoriesId,
                                            imgUrl: imgUrl,
                                            context: context);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.kWhiteColor,
                                  ),
                                  child: const Text(
                                    "Yes",
                                    style:
                                        TextStyle(color: AppColors.kBlackColor),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              ));

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.productTitle;
    _descriptionController.text = widget.productDescription;

    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
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
                      text: "View ShowCase Item",
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
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  Container(
                    child: file == ""
                        ? Image.network(
                            widget.dataList![0].toString(),
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            file.toString(),
                            fit: BoxFit.cover,
                          ),
                    decoration: BoxDecoration(
                      color: AppColors.kGreenColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: 250,
                    width: double.infinity,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  Container(
                    height: 80,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: widget.dataList!.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: InkWell(
                                  onTap: () {
                                    file = widget.dataList![index].toString();
                                    setState(() {});
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Image.network(
                                        widget.dataList![index].toString(),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.kGreenColor,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                right: 10,
                                child: GestureDetector(
                                  onTap: () {
                                    deleteDialogBox(
                                      context: context,
                                      categoriesId: widget.productID.toString(),
                                      imgUrl:
                                          widget.dataList![index].toString(),
                                    );
                                  },
                                  child: Icon(Icons.cancel_outlined,
                                      color: AppColors.kGreenColor),
                                ),
                              )
                            ],
                          );
                        }),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_4),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Product Title",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 12,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  TextFormField(
                    controller: _titleController,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Product Title",
                      hintStyle: TextStyle(
                        color: AppColors.kTextColor2,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 11,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kDArkBlackColor),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kDArkBlackColor)),
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "Product Description",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 12,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  TextFormField(
                    controller: _descriptionController,
                    readOnly: true,
                    maxLines: 5,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      hintText: "Description",
                      hintStyle: TextStyle(
                        color: AppColors.kTextColor2,
                        fontFamily: 'Montserrat-Regular',
                        fontSize: 11,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                            width: 1, color: AppColors.kDArkBlackColor),
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kDArkBlackColor)),
                    ),
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                  TextBottun(
                    text: "Back",
                    clickCallback: () {
                      Get.back();
                    },
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
