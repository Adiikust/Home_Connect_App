import 'dart:io';
import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Add_Item/addListingService.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_manager.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/Show_Sub_Categories_Listing/sub_categories_id_base_listing_show_model.dart';
import 'package:vendor_app/Views/Home/Vendor_Listing_ShowCase_Category_details/Vendor_Listing_&_ShowCase/listing_screen/vendorLstingManager.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class AddListingProduct extends StatefulWidget {
  const AddListingProduct({Key? key}) : super(key: key);

  @override
  State<AddListingProduct> createState() => _AddListingProductState();
}

class _AddListingProductState extends State<AddListingProduct> {
  List<File> imageFile = [];
  final picker = ImagePicker();

  final AddListingFormService addListingFormService = AddListingFormService();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  String? _selectedCategories;

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
              height: 40,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/small_appbar.png"),
                    fit: BoxFit.fill),
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
                      text: "Add New Listing Item",
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
                    StreamBuilder<File>(builder: (context, snapshot) {
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
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
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
                                  hint: Text("Categories"),
                                  value: _selectedCategories,
                                  onChanged: (newValue) {
                                    //int nameIndex =
                                    setState(() {
                                      _selectedCategories = newValue!;
                                      Overseer.mainCategoriesID =
                                          _selectedCategories.toString();
                                      print(
                                          "%%%%%%%%%%%%%%%% Categories_Id${Overseer.mainCategoriesID}");
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
                            return Text("loading");
                          }
                          return SizedBox();
                        }),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
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
                      text: "Product Price",
                      color: AppColors.kTextColor1,
                      fontWeight: FontWeight.bold,
                      family: "Montserrat-SemiBold",
                      size: 12,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                    TextFormField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        hintText: "Price",
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
                          return 'Please enter a product Price';
                        }
                        final priceRegex =
                            r'^\$?(\d{1,3}(,\d{3})*|(\d+))(\.\d{2})?$';
                        if (!RegExp(priceRegex).hasMatch(value)) {
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
                        if (_formKey.currentState!.validate()) {
                          if (imageFile.isNotEmpty) {
                            if (_selectedCategories!.isNotEmpty) {
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
                              addListingFormService
                                  .addListingForm(
                                      _selectedCategories.toString(),
                                      _priceController.text.toString().trim(),
                                      _titleController.text.toString().trim(),
                                      _descriptionController.text
                                          .toString()
                                          .trim(),
                                      imageFile,
                                      context)
                                  .then((value) {
                                VendorListingSubCategoriesIdManager
                                    vendorListingSubCategoriesIdManager =
                                    Provider.of(context).fetch(
                                        VendorListingSubCategoriesIdManager);
                                vendorListingSubCategoriesIdManager.mainList;
                              }).then((value) {
                                _descriptionController.clear();
                                _titleController.clear();
                                _priceController.clear();
                                imageFile.clear();
                                _selectedCategories = "";
                              });
                            }
                          }
                        }
                      },
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
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
