import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UserViewAllVideosScreen extends StatelessWidget {
  UserViewAllVideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime datetime = DateTime.now();
    String dateStr = datetime.toString();
    return Scaffold(
      backgroundColor: const Color(0XffF5F5F5),
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/small_appbar.png"),
                  fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_2),
                  BuildText(
                    text: "View All Video",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 8,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          CircleAvatar(
                              radius: 25,
                              backgroundColor: AppColors.kGreenColor,
                              child: Icon(
                                Icons.video_library_outlined,
                                color: AppColors.kWhiteColor,
                              )),
                          BuildSizeBox(
                            weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                              ),
                              buildRow("Video Link", "video url "),
                              BuildSizeBox(
                                height: Get.height * ScreenSizes.SCREEN_SIZE_1,
                              ),
                              buildRow("Update Time", dateStr),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                              buildRow("Update By", "Admin"),
                              BuildSizeBox(
                                  height:
                                      Get.height * ScreenSizes.SCREEN_SIZE_1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Row buildRow(String? key, dateStr) {
    return Row(
      children: [
        BuildText(
          text: key,
          size: 12,
          family: 'Montserrat-Regular',
          fontWeight: FontWeight.bold,
          color: AppColors.kTextColor1,
        ),
        BuildSizeBox(
          weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
        ),
        BuildText(
          text: dateStr,
          size: 12,
          family: 'Montserrat-Regular',
          color: AppColors.kTextColor2,
        ),
      ],
    );
  }

  YoutubePlayer buildYoutubePlayer(String txt) {
    return YoutubePlayer(
      width: double.infinity,
      controller: YoutubePlayerController(
        initialVideoId: txt,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      ),
      liveUIColor: Colors.amber,
    );
  }
}
