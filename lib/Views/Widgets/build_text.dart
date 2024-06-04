import 'package:flutter/material.dart';

class BuildText extends StatelessWidget {
  String? text;
  double? size;
  Color? color;
  FontWeight? fontWeight;
  String? family;
  int? maxLines;

  BuildText(
      {Key? key,
      this.fontWeight,
      this.color,
      this.text,
      this.size,
      this.maxLines,
      this.family})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxLines,
      text!,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: size,
          color: color,
          fontFamily: family),
    );
  }
}
