import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

enum Source { Asset }

class VideoPlayerPage extends StatefulWidget {
  final String videoPath; // New parameter to accept video path
  const VideoPlayerPage({Key? key, required this.videoPath}) : super(key: key);

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late CustomVideoPlayerController _customVideoPlayerController;

  Source currentSource = Source.Asset;

  late bool isLoading = true;

  @override
  void initState() {
    super.initState();
    initializeVideoPlayer(currentSource, widget.videoPath);
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
              ],
            ),
    );
  }

  void initializeVideoPlayer(Source source, String videoPath) {
    setState(() {
      isLoading = true;
    });
    VideoPlayerController _videoPlayerController;
    if (source == Source.Asset) {
      _videoPlayerController = VideoPlayerController.asset(videoPath)
        ..initialize().then((value) {
          setState(() {
            isLoading = false;
          });
        });
    } else {
      return;
    }
    _customVideoPlayerController = CustomVideoPlayerController(
        context: context, videoPlayerController: _videoPlayerController);
  }
}
