import 'dart:io';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Edit_ShowCase/editshowcaseService.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_model.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class EditShowCaseProduct extends StatefulWidget {
  String productID;
  String productSubID;
  String productTitle;
  String productDescription;
  EditShowCaseProduct(
      {Key? key,
      required this.productDescription,
      required this.productSubID,
      required this.productID,
      required this.productTitle})
      : super(key: key);

  @override
  State<EditShowCaseProduct> createState() => _EditShowCaseProductState();
}

class _EditShowCaseProductState extends State<EditShowCaseProduct> {
  List<File> imageFile = [];
  final picker = ImagePicker();
  String? _selectedCategory;
  final _formKey = GlobalKey<FormState>();
  final EditShowCaseFormService editShowCaseFormService =
      EditShowCaseFormService();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

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
                    "Pick Images...",
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
                                pickImage(ImageSource.camera);
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kWhiteColor,
                              ),
                              child: const Text(
                                "Camera",
                                style: TextStyle(color: AppColors.kBlackColor),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                selectImages();
                              },
                              style: ElevatedButton.styleFrom(
                                primary: AppColors.kWhiteColor,
                              ),
                              child: const Text(
                                "Gallery",
                                style: TextStyle(color: AppColors.kBlackColor),
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ));

  void selectImages() async {
    final List<XFile>? selectedImages = await picker.pickMultiImage();
    if (selectedImages != null && selectedImages.isNotEmpty) {
      for (XFile xFile in selectedImages) {
        File imageFileConverted = File(xFile.path);
        imageFile.add(imageFileConverted);
      }
    }
    setState(() {
      Get.back();
    });
  }

  ///Images Pic
  Future<void> pickImage(ImageSource source) async {
    XFile? imagePicked = await ImagePicker().pickImage(source: source);
    if (imagePicked != null) {
      File imageFileConverted = File(imagePicked.path);
      imageFile.add(imageFileConverted);
      setState(() {});
      Get.back();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    _titleController.text = widget.productTitle;
    _descriptionController.text = widget.productDescription;
    SubCategoriesIdBaseListingShowManager
        subCategoriesIdBaseListingShowManager =
        Provider.of(context).fetch(SubCategoriesIdBaseListingShowManager);
    subCategoriesIdBaseListingShowManager.mainList;
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
                      text: "Edit ShowCase Item",
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
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Edit ShowCase Item",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 20,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "Please Provide Correct Information",
                      color: AppColors.kTextColor2,
                      family: "Montserrat-Regular",
                      size: 14,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    StreamBuilder<File>(
                        // stream: addListingFormManager.imageSubject.stream,
                        builder: (context, snapshot) {
                      return InkWell(
                        onTap: () {
                          showWarning(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: Get.height * ScreenSizes.SCREEN_SIZE_30,
                          decoration: BoxDecoration(
                            color: AppColors.kWhiteColor,
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: imageFile.isNotEmpty
                              ? Expanded(
                                  child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: double.infinity,
                                    child: GridView.builder(
                                        itemCount: imageFile.length,
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 5),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return GestureDetector(
                                            onDoubleTap: () {
                                              Get.defaultDialog(
                                                  title: "image",
                                                  content: const Text(""),
                                                  actions: [
                                                    SizedBox(
                                                      height: Get.height * 0.3,
                                                      child: Image.file(
                                                          File(imageFile[index]
                                                              .path),
                                                          fit: BoxFit.contain),
                                                    )
                                                  ]);
                                            },
                                            child: Image.file(
                                                File(imageFile[index].path),
                                                fit: BoxFit.cover),
                                          );
                                        }),
                                  ),
                                ))
                              : Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 25),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0XffF5F5F5),
                                        maxRadius: 40,
                                        child: const Icon(
                                          Icons.add,
                                          size: 30,
                                          color: AppColors.kTextColor1,
                                        ),
                                      ),
                                      BuildSizeBox(
                                          height: Get.height *
                                              ScreenSizes.SCREEN_SIZE_2),
                                      BuildText(
                                        text: "Image",
                                        color: AppColors.kTextColor1,
                                        fontWeight: FontWeight.bold,
                                        family: "Montserrat-SemiBold",
                                        size: 18,
                                      ),
                                      BuildSizeBox(
                                          height: Get.height *
                                              ScreenSizes.SCREEN_SIZE_2),
                                      BuildText(
                                        text: "Please Upload An Image",
                                        color: AppColors.kTextColor2,
                                        family: "Montserrat-Regular",
                                        size: 12,
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                      );
                    }, stream: null,),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    BuildText(
                      text: "Please Select Categories",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 12,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    StreamBuilder<List<SubCategoriesIdBaseListingShowModel>>(
                      stream: subCategoriesIdBaseListingShowManager.mainList,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: AppColors.kGreenColor,
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: DropdownButton(
                                elevation: 2,
                                isExpanded: true,
                                underline: Container(),
                                hint: Text(" Change Category"),
                                value: _selectedCategory,
                                onChanged: (newValue) {
                                  //int nameIndex =
                                  setState(() {
                                    _selectedCategory = newValue!;
                                    print(
                                        "%%%%%%%%%%%%%%%% Change Categories_Id${_selectedCategory.toString()}");
                                  });
                                },
                                items: snapshot.data![0].data
                                    .map((Data12 location) {
                                  return DropdownMenuItem(
                                    value: location.id.toString(),
                                    child: BuildText(text: location.name),
                                  );
                                }).toList(),
                              ),
                            ),
                          );
                        } else {
                          return Text("Loading...");
                        }
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    BuildText(
                      text: "Product Title",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 12,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    TextFormField(
                      controller: _titleController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Title",
                        hintStyle: TextStyle(
                          color: AppColors.kTextColor2,
                          fontFamily: 'Montserrat-Regular',
                          fontSize: 11,
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              width: 1, color: AppColors.kGreenColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.kGreenColor)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a product title';
                        }
                        final titleRegex = '[a-zA-Z]';
                        if (!RegExp(titleRegex).hasMatch(value)) {
                          return 'Please enter a valid price';
                        }
                        return null;
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    BuildText(
                      text: "Product Description",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 12,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    TextFormField(
                      maxLines: 5,
                      controller: _descriptionController,
                      onChanged: (value) {},
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
                              width: 1, color: AppColors.kGreenColor),
                        ),
                        focusedBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                                width: 1, color: AppColors.kGreenColor)),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter a description';
                        }
                        if (value.length > 100) {
                          return 'Description must not exceed 100 characters';
                        }
                        return null;
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    TextBottun(
                      text: "Submit",
                      clickCallback: () {
                        print(
                            "*********************${widget.productSubID.toString()}");
                        if (_formKey.currentState!.validate()) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              );
                            },
                            barrierDismissible: false,
                          );
                          editShowCaseFormService.editShowCaseFormData(
                              id: widget.productID.toString(),
                              productTitle:
                                  _titleController.text.toString().trim(),
                              productDescription:
                                  _descriptionController.text.toString().trim(),
                              productSubCategoryID: _selectedCategory != null
                                  ? _selectedCategory.toString()
                                  : widget.productSubID.toString(),
                              images: imageFile,
                              context: context);
                        }
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
