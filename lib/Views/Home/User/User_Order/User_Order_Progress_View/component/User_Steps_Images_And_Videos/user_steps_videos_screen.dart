import 'package:vendor_app/Utils/Exports/all_exports.dart';
import 'package:vendor_app/Views/Home/User/User_Order/User_Order_Progress_View/component/User_Video_Play/user_video_play_screen.dart';
import 'package:vendor_app/Views/Widgets/build_text.dart';

class UserStepsVideosScreen extends StatelessWidget {
  final List userStepsVideos;
  UserStepsVideosScreen({Key? key, required this.userStepsVideos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                      )),
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Task View Videos",
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "Videos",
                    color: AppColors.kTextColor1,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 20,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  BuildText(
                    text: "View All Videos",
                    color: AppColors.kTextColor2,
                    family: "Montserrat-Regular",
                    size: 14,
                  ),
                  BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_1),
                  userStepsVideos.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: userStepsVideos.length,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 80,
                                child: Card(
                                  child: Center(
                                    child: ListTile(
                                      onTap: () {
                                        Get.to(
                                          UserVideoPlayScreen(
                                            videoFile: userStepsVideos[index]
                                                .toString(),
                                          ),
                                        );
                                      },
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundColor: AppColors.kGreenColor,
                                        child: Icon(
                                          Icons.video_library_outlined,
                                          color: AppColors.kWhiteColor,
                                        ),
                                      ),
                                      title: BuildText(
                                        text: userStepsVideos[index]
                                            .toString()
                                            .split('/')
                                            .last,
                                        color: AppColors.kTextColor1,
                                        family: "Montserrat-Regular",
                                        size: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Container(
                          height: Get.height * ScreenSizes.SCREEN_SIZE_20,
                          child: Center(
                            child: BuildText(
                              text: "Task Videos List is Empty",
                              color: AppColors.kTextColor1,
                              family: "Montserrat-Regular",
                              fontWeight: FontWeight.bold,
                              size: 18,
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
