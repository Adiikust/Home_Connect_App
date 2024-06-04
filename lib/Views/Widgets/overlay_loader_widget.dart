import 'package:flutter/cupertino.dart';
import '../../Utils/Exports/all_exports.dart';

class OverlayLoaderWidget extends StatelessWidget {
  const OverlayLoaderWidget({super.key, Color? color}) : _color = color;

  final Color? _color;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        color: _color ?? Colors.black54,
        child: Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 10,
                  )
                ]),
            child: Center(
                child: CupertinoActivityIndicator(
              radius: 14,
              color: Theme.of(context).primaryColor,
            )),
          ),
        ),
      ),
    );
  }
}

class OverlayLoader {
  static OverlayLoader? _instance;
  OverlayEntry? _overlayEntry;

  OverlayLoader._();

  static OverlayLoader get instance {
    _instance ??= OverlayLoader._();
    return _instance!;
  }

  void show(BuildContext context) {
    _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => const OverlayLoaderWidget());
    Overlay.of(context).insert(_overlayEntry!);
  }

  void hide() => _overlayEntry?.remove();
}
