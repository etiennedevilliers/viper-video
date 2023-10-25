import 'package:better_player/video_viper/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

typedef SeekTo = void Function(double progress);

class CupertinoProgressBar extends StatelessWidget {
  final SeekTo? seekTo;

  const CupertinoProgressBar({super.key, this.seekTo});

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width - 60;
  } 

  double getProgressWidth(BuildContext context) {
    VideoPlayerValue value = Provider.of<VideoPlayerValue>(context);

    int currentPosition = value.position.inMilliseconds;
    int duration = value.duration.inMilliseconds;

    if (duration == 0) {
      return 0;
    }

    double progress = currentPosition / duration;

    return getWidth(context) * progress;
  }

  double localPositionToProgress(BuildContext context, Offset localPosition) {
    return localPosition.dx / getWidth(context);
  }

  void attemptSeekToProgress(BuildContext context, Offset localPosition) {
    if (seekTo != null) {
      seekTo!(localPositionToProgress(context, localPosition));
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        attemptSeekToProgress(context, details.localPosition);
      },
      onHorizontalDragUpdate: (details) {
        attemptSeekToProgress(context, details.localPosition);
      },
      onHorizontalDragEnd: (details) {
        // attemptSeekTo(context, details.localPosition);
      },
      onTapDown: (details) {
        attemptSeekToProgress(context, details.localPosition);
      },
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(cupertinoProgressBarHeight)),
              color: cupertinoGrey,
            ),
            height: cupertinoProgressBarHeight,
            width: getWidth(context),
          ),
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(cupertinoProgressBarHeight)),
              color: Colors.white,
            ),
            height: cupertinoProgressBarHeight,
            width: getProgressWidth(context),
          ),
        ],
      ),
    );
  }
}