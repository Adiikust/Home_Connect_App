import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/AppLayer/Overseer.dart';

class BuildBottomNavigationBar extends StatefulWidget {
  int currentIndex;
  int? Function(int)? onTap;
  BuildBottomNavigationBar({Key? key, required this.currentIndex, this.onTap})
      : super(key: key);

  @override
  State<BuildBottomNavigationBar> createState() =>
      _BuildBottomNavigationBarState();
}

class _BuildBottomNavigationBarState extends State<BuildBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      currentIndex: widget.currentIndex,
      selectedItemColor: AppColors.kGreenColor,
      unselectedItemColor: AppColors.kCardDArkColor,
      showUnselectedLabels: true,
      onTap: widget.onTap,
      items: [
        BottomNavigationBarItem(
          label: Overseer.userLoginType.contains("Vendor") ? 'Listing' : 'Home',
          icon: const Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: Overseer.userLoginType.contains("Vendor") ? 'Add' : 'Inquiry',
          icon: const Icon(Icons.add_circle_outline),
        ),
        const BottomNavigationBarItem(
          label: 'Orders',
          icon: Icon(Icons.manage_search_outlined),
        ),
      ],
    );
  }
}

// Widget buildBottomNavigationBar({
//   required int currentIndex,
//   int? Function(int)? onTap,
// }) {
//   return BottomNavigationBar(
//     backgroundColor:  Theme.of(context).backgroundColor,
//     currentIndex: currentIndex,
//     selectedItemColor: AppColors.kGreenColor,
//     unselectedItemColor: AppColors.kBlackColor,
//     showUnselectedLabels: true,
//     items: [
//       BottomNavigationBarItem(
//         label: Overseer.userLoginType.contains("vendor") ? 'Listnig' : 'Home',
//         icon: const Icon(Icons.home),
//       ),
//       BottomNavigationBarItem(
//         label:
//             Overseer.userLoginType.contains("vendor") ? 'Profile' : 'Inquiry',
//         icon: const Icon(Icons.add_circle_outline),
//       ),
//       const BottomNavigationBarItem(
//         label: 'Orders',
//         icon: Icon(Icons.manage_search_outlined),
//       ),
//     ],
//     onTap: onTap,
//   );
// }
