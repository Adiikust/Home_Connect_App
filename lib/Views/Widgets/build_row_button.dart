import 'package:vendor_app/Views/Widgets/build_text.dart';

import '../../Utils/Exports/all_exports.dart';

class BuildRowButton extends StatelessWidget {
  String title;
  final VoidCallback clickCallback;
  BuildRowButton({Key? key, required this.title, required this.clickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: clickCallback,
      child: Container(
        height: Get.height * 0.050,
        width: Get.width * 0.2,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(13)),
        child: Center(
            child: BuildText(
          text: title,
          color: AppColors.kWhiteColor,
        )),
      ),
    );
  }
}
