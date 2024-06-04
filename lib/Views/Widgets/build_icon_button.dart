import 'package:vendor_app/Utils/Exports/all_exports.dart';

class BuildIconButton extends StatelessWidget {
  IconData? iconData;
  Color? color;
  VoidCallback clickCallback;
  BuildIconButton(
      {Key? key, this.color, this.iconData, required this.clickCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: clickCallback, icon: Icon(iconData, color: color));
  }
}
