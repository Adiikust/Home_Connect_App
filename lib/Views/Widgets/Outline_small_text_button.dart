import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class OutLineSmallTextButton extends StatelessWidget {
  final String text;
  final VoidCallback clickCallback;
  final Color? textColor;
  final Color? buttonColor;
  const OutLineSmallTextButton({
    Key? key,
    required this.text,
    required this.clickCallback,
    this.textColor,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCallback(),
      child: Container(
          height: Get.height * 0.06,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.kGreenColor, width: 1),
          ),
          child: BuildText(
            color: textColor,
            text: text,
            family: 'Montserrat-SemiBold',
            fontWeight: FontWeight.bold,
            size: 16,
          )),
    );
  }
}
