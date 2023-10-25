import 'dart:async';
import 'dart:math';

import 'package:better_player/video_viper/cupertino/cupertino_bottom_controls.dart';
import 'package:better_player/video_viper/cupertino/cupertino_center_controls.dart';
import 'package:better_player/video_viper/cupertino/cupertino_top_controls.dart';
import 'package:better_player/video_viper/video_player_store.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class CupertinoViperControls extends StatefulWidget {
  final String? title;
  final String? subTitle;

  final VideoPlayerController videoPlayerController;
  const CupertinoViperControls({super.key, required this.videoPlayerController, this.title, this.subTitle});

  @override
  State<CupertinoViperControls> createState() => _CupertinoViperControlsState();
}

class _CupertinoViperControlsState extends State<CupertinoViperControls> {
  VideoPlayerValue get videoPlayerValue => widget.videoPlayerController.value;
  bool hidden = true;

  late Timer hideTimer;

  @override
  void initState() {
    super.initState();
    hideTimer = getNewTimer();
  }

  Timer getNewTimer() {
    return Timer(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() { hidden = true; }); 
      } else {
        hidden = true;
      }
      
    });
  } 

  void resetHideTimer() {
    setState(() {
      hidden = false;
    });
    hideTimer.cancel();
    hideTimer = getNewTimer();
  }

  void _togglePausePlay() {
    resetHideTimer();
    if (widget.videoPlayerController.value.isPlaying) {
      widget.videoPlayerController.pause();
    } else {
      widget.videoPlayerController.play();
    }
  }

  void _seekForward15() {
    resetHideTimer();
    int end = videoPlayerValue.duration.inMilliseconds;
    int skip = (videoPlayerValue.position + const Duration(seconds: 15)).inMilliseconds;
    widget.videoPlayerController.seekTo(Duration(milliseconds: min(end, skip)));
  }

  void _seekBackward15() {
    resetHideTimer();
    int start = Duration.zero.inMilliseconds;
    int skip = (videoPlayerValue.position - const Duration(seconds: 15)).inMilliseconds;
    widget.videoPlayerController.seekTo(Duration(milliseconds: max(start, skip)));
  }

  void _seekToProgress(double progress) {
    resetHideTimer();
    widget.videoPlayerController.seekTo(Duration(
      milliseconds: (progress * videoPlayerValue.duration.inMilliseconds).toInt()
    ));
  }

  Widget _buildControls(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => resetHideTimer(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
        ),
        const CupertinoTopControls(),
        CupertinoCenterControls(
          togglePausePlay: _togglePausePlay,
          forward15: _seekForward15,
          backward15: _seekBackward15,
        ),
        CupertinoBottomControls(
          title: widget.title,
          subTitle: widget.subTitle,
          seekTo: (duration) => _seekToProgress(duration),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: hidden ? 0 : 1,
        child: VideoPlayerStoreProvider(
          create: (context) => widget.videoPlayerController,
          child: _buildControls(context)
      ),
    );
  }
}