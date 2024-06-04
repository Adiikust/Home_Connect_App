import 'package:vendor_app/Utils/Exports/all_exports.dart';

class BirdsDetailsScreen extends StatefulWidget {
  const BirdsDetailsScreen({Key? key}) : super(key: key);

  @override
  State<BirdsDetailsScreen> createState() => _BirdsDetailsScreenState();
}

class _BirdsDetailsScreenState extends State<BirdsDetailsScreen> {
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
              "Birds Details",
              style: TextStyle(color: AppColors.kBlackColor),
            ),
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Image.asset(AppImages.BIRDSDETAILS1),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            const Text(
              AppConstants.PARROT,
              style: TextStyle(
                  fontSize: 20,
                  color: AppColors.kBlackColor,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            const Text(
              AppConstants.PARROT_DETAILS,
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.kDArkBlackColor,

                //overflow: TextOverflow.ellipsis
              ),
            ),
            SizedBox(
              height: Get.height * 0.1,
            ),
            TextBottun(
              text: "Add to cart",
              clickCallback: () {
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
