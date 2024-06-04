import 'package:vendor_app/Views/Widgets/build_text.dart';
import 'package:video_player/video_player.dart';
import '../../../../../../../Utils/Exports/all_exports.dart';

class UserVideoPlayScreen extends StatefulWidget {
  final String videoFile;
  UserVideoPlayScreen({Key? key, required this.videoFile}) : super(key: key);

  @override
  State<UserVideoPlayScreen> createState() => _UserVideoPlayScreenState();
}

class _UserVideoPlayScreenState extends State<UserVideoPlayScreen> {
  late VideoPlayerController _videoController;
  bool _isVideoLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.videoFile)
      ..initialize().then((_) {
        setState(() {
          _isVideoLoading = false;
        });
      }).catchError((error) {
        setState(() {
          _isVideoLoading = false;
          _error = error.toString();
        });
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
          Expanded(
            child: Center(
              child: _isVideoLoading
                  ? CircularProgressIndicator(
                      color: AppColors.kGreenColor,
                    )
                  : _error != null
                      ? Text(
                          'Error loading video: $_error',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.red),
                        )
                      : AspectRatio(
                          aspectRatio: _videoController.value.aspectRatio,
                          child: VideoPlayer(_videoController),
                        ),
            ),
          ),
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
