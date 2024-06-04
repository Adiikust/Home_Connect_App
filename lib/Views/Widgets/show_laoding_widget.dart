import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShowLoadingWidget extends StatelessWidget {
  const ShowLoadingWidget({super.key, this.radius, this.color});

  final double? radius;
  final Color? color;

  @override
  Widget build(BuildContext context) => Center(
          child: CupertinoActivityIndicator(
        color: color ?? Theme.of(context).primaryColor,
        radius: radius ?? 10.0,
      ));
}
