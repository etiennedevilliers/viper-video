import 'package:better_player/video_viper/cupertino/cupertino_viper_controls.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoViperInline extends StatefulWidget {
  final VideoPlayerController controller;
  final String? title;
  final String? subTitle;

  const VideoViperInline({super.key, required this.controller, this.title, this.subTitle});

  @override
  State<VideoViperInline> createState() => _VideoViperInlineState();
}

class _VideoViperInlineState extends State<VideoViperInline> {

  @override
  void initState() {
    super.initState();

    if (!widget.controller.value.isInitialized) {
      widget.controller.initialize().then((value) {
        setState(() {
          widget.controller.play();
        });
      });
    }

    widget.controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: widget.controller.value.aspectRatio,
      child: Stack(
        children: [
          VideoPlayer(widget.controller),
          CupertinoViperControls(
            videoPlayerController: widget.controller,
            title: widget.title,
            subTitle: widget.subTitle,
          )
        ],
      ),
    );
  }
}