import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorSecondScreen extends StatelessWidget {
  String text;
  String description;
  VendorSecondScreen({
    Key? key,
    required this.description,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BuildText(
              text: text,
              fontWeight: FontWeight.bold,
              size: 14,
              color: AppColors.kTextColor1,
              family: 'Montserrat-SemiBold',
            ),
            BuildText(
              text: "03:00 PM",
              color: AppColors.kGreenColor,
            ),
          ],
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        SizedBox(
            width: Get.width * 0.7,
            child: RichText(
              text: TextSpan(
                children: <TextSpan>[
                  const TextSpan(
                      text: 'Comment: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.kTextColor1)),
                  TextSpan(
                      text: description,
                      style: const TextStyle(
                          fontSize: 11, color: AppColors.kTextColor2)),
                ],
              ),
            )),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
      ],
    );
  }
}
