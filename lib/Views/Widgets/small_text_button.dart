import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class SmallTextButton extends StatelessWidget {
  final String text;
  final VoidCallback clickCallback;
  final Color? textColor;
  final Color? buttonColor;
  double? size;
  SmallTextButton(
      {Key? key,
      required this.text,
      required this.clickCallback,
      this.textColor,
      this.size,
      this.buttonColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCallback(),
      child: Container(
          height: Get.height * 0.04,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            boxShadow: [
              BoxShadow(
                color: AppColors.kTextColor2,
                blurRadius: 1.0, // soften the shadow
                spreadRadius: 0.0, //extend the shadow
                offset: Offset(
                  1.0, // Move to right 5  horizontally
                  1.0, // Move to bottom 5 Vertically
                ),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: BuildText(
            color: textColor,
            text: text,
            family: 'Montserrat-SemiBold',
            fontWeight: FontWeight.bold,
            size: size ?? 16,
          )),
    );
  }
}
