import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sitake_mobile/utils/constants.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'Quiz_screen.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key, required this.videoUrl}) : super(key: key);
  final String videoUrl;

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late final videoPlayerController;
  late final chewieController;
  late final playerWidget;
  late double heightVideoWidget = MediaQuery.of(context).size.width / 1.778;

  void initializeVidreoController() async {
    await videoPlayerController.initialize();
  }

  @override
  void initState() {
    videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    initializeVidreoController();
    chewieController = ChewieController(
        deviceOrientationsOnEnterFullScreen: [DeviceOrientation.landscapeLeft],
        deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
        allowMuting: true,
        aspectRatio: 16 / 9,
        videoPlayerController: videoPlayerController,
        autoPlay: true,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
    playerWidget = Chewie(
      controller: chewieController,
    );
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).orientation == Orientation.portrait
              ? heightVideoWidget
              : null,
          child: Chewie(controller: chewieController),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                Icons.arrow_back_rounded,
                color: Colors.black87,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
          FloatingActionButton(
              backgroundColor: Colors.white,
              child: Text(
                "Quiz",
                style: h4Style,
              ),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => QuizScreen()));
              })
        ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
