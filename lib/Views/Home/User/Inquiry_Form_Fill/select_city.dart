import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/Outline_small_text_button.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'map_view.dart';

class SelectCity extends StatefulWidget {
  const SelectCity({Key? key}) : super(key: key);

  @override
  State<SelectCity> createState() => _SelectCityState();
}

class _SelectCityState extends State<SelectCity> {
  TextEditingController areaController = TextEditingController();
  double? area;
  String? _selectedLocation;

  @override
  void dispose() {
    areaController.dispose();
    super.dispose();
  }

  final List<String> _locations = [
    "KPK",
    "ISB",
    "Lahore",
    "Karachi",
    "Multan",
    "Rawalpindi",
    "Islamabad",
    "Quetta",
    "Faisal Abad",
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        color: Colors.white,
                      )),
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Area",
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
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Inquiry Form",
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
                        height: Get.height * ScreenSizes.SCREEN_SIZE_3),
                    BuildText(
                      text: "Select City",
                      color: AppColors.kTextColor1,
                      family: "Montserrat-Regular",
                      fontWeight: FontWeight.bold,
                      size: 13,
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          color: AppColors.kGreenColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DropdownButton(
                          elevation: 2,
                          isExpanded: true,
                          underline: Container(),
                          hint: _selectedLocation == null
                              ? BuildText(
                                  text: 'Select City',
                                  color: AppColors.kTextColor2,
                                  family: 'Montserrat-Medium',
                                  size: 11,
                                )
                              : BuildText(
                                  text: _selectedLocation.toString(),
                                  color: AppColors.kTextColor2,
                                  family: 'Montserrat-Medium',
                                  size: 12,
                                ),
                          value: _selectedLocation,
                          onChanged: (newValue) {
                            setState(() {
                              _selectedLocation = newValue;
                              Overseer.inquirySelectCityName =
                                  _selectedLocation.toString();
                              print(
                                  "######################${Overseer.inquirySelectCityName}");
                            });
                          },
                          items: _locations.map((location) {
                            return DropdownMenuItem(
                              value: location,
                              child: BuildText(text: location),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    BuildSizeBox(
                        height: Get.height * ScreenSizes.SCREEN_SIZE_5),
                    Row(
                      children: [
                        Expanded(
                          child: OutLineSmallTextButton(
                            text: "Back",
                            clickCallback: () {
                              Get.back();
                            },
                            textColor: AppColors.kGreenColor,
                            buttonColor: AppColors.kWhiteColor,
                          ),
                        ),
                        BuildSizeBox(
                            weight: Get.width * ScreenSizes.SCREEN_SIZE_5),
                        Expanded(
                          child: OutLineSmallTextButton(
                            text: _selectedLocation == null
                                ? "Select City"
                                : "Next",
                            clickCallback: () {
                              if (_selectedLocation != null) {
                                Get.to(MapView());
                              } else {
                                Get.snackbar(
                                  "Message",
                                  backgroundColor: AppColors.kWhiteColor,
                                  "Please select City",
                                  colorText: AppColors.kGreenColor,
                                  icon: const Icon(Icons.error_outline,
                                      color: AppColors.kGreenColor),
                                  snackPosition: SnackPosition.TOP,
                                );
                              }
                            },
                            textColor: AppColors.kWhiteColor,
                            buttonColor: AppColors.kGreenColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
