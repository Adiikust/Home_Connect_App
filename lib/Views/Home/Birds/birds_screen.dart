import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/Birds/birds_details_screen.dart';

class BirdsScreen extends StatefulWidget {
  const BirdsScreen({Key? key}) : super(key: key);

  @override
  State<BirdsScreen> createState() => _BirdsScreenState();
}

class _BirdsScreenState extends State<BirdsScreen> {
  final List screens = [
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
    const BirdsDetailsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.kWhiteColor,
          iconTheme:
              const IconThemeData(color: AppColors.kBlackColor, size: 25),
          title: const Center(
            child: Text(
              "Birds",
              style: TextStyle(color: AppColors.kBlackColor),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            shrinkWrap: true,
            // physics: const NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Get.to(screens[index]);
                },
                child: Card(
                  child: Image.asset(AppImages.BIRDS1),
                ),
              );
            }),
      ),
    );
  }
}
