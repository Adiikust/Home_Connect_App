import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class VendorFirstsScrren extends StatelessWidget {
  String text;
  Color textColor;
  Color backGroundColor;
  String description;
  TextEditingController controller;
  VendorFirstsScrren(
      {Key? key,
      required this.textColor,
      required this.backGroundColor,
      required this.description,
      required this.text,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BuildText(
          text: text,
          fontWeight: FontWeight.bold,
          size: 14,
          family: 'Montserrat-SemiBold',
          color: AppColors.kTextColor1,
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        BuildText(
          text: description,
          size: 12,
          family: 'Montserrat-Medium',
          color: AppColors.kTextColor2,
        ),
        BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
        TextFormField(
          controller: controller,
          minLines: 3,
          maxLines: null,
          showCursor: true,
          keyboardType: TextInputType.multiline,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(12),
            hintText: "Comment",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                borderSide: BorderSide(width: 1, color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
