import 'dart:io';

import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:video_player/video_player.dart';
import '../../../../Utils/Exports/all_exports.dart';

class VideoPlayScreen extends StatefulWidget {
  final File videoFile;
  VideoPlayScreen({Key? key, required this.videoFile}) : super(key: key);

  @override
  State<VideoPlayScreen> createState() => _VideoPlayScreenState();
}

class _VideoPlayScreenState extends State<VideoPlayScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    // print(widget.videoUrl.toString());
    super.initState();
    _videoController = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  BuildSizeBox(
                    weight: Get.width * ScreenSizes.SCREEN_SIZE_2,
                  ),
                  BuildText(
                    text: "Video Play",
                    color: AppColors.kWhiteColor,
                    fontWeight: FontWeight.bold,
                    family: "Montserrat-SemiBold",
                    size: 18,
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              BuildSizeBox(height: Get.height * ScreenSizes.SCREEN_SIZE_3),
              Container(
                height: Get.height * ScreenSizes.SCREEN_SIZE_60,
                child: Center(
                  child: _videoController.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        )
                      : CircularProgressIndicator(
                          color: AppColors.kGreenColor,
                        ),
                ),
              ),
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_videoController.value.isPlaying) {
            setState(() {
              _videoController.pause();
            });
          } else {
            setState(() {
              _videoController.play();
            });
          }
        },
        child: Icon(
          _videoController.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
