import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class TextBottun extends StatelessWidget {
  final String text;
  final VoidCallback clickCallback;
  const TextBottun({Key? key, required this.text, required this.clickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickCallback(),
      child: Container(
        height: Get.height * 0.07,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.kGreenColor,
          // color: Theme.of(context).floatingActionButtonTheme.backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: BuildText(
          text: text,
          size: 16,
          color: AppColors.kWhiteColor,
          fontWeight: FontWeight.bold,
          family: 'Montserrat-SemiBold',
        ),
      ),
    );
  }
}
