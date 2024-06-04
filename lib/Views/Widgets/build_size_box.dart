import 'package:vendor_app/Utils/Exports/all_exports.dart';

class BuildSizeBox extends StatelessWidget {
  double? height;
  double? weight;
  BuildSizeBox({Key? key, this.height, this.weight}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: weight,
    );
  }
}
