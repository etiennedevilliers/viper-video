import 'package:better_player/video_viper/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CupertinoTimeStamps extends StatelessWidget {
  const CupertinoTimeStamps({super.key});

  String durationToString(Duration duration, { bool includeHours = false }) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (includeHours) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    
  }

  String getProgressString(BuildContext context) {
    return durationToString(
      Provider.of<VideoPlayerValue>(context).position,
      includeHours: Provider.of<VideoPlayerValue>(context).duration.inHours > 0
    ) ;
  }

  String getProgressLeftString(BuildContext context) {
    Duration left = Provider.of<VideoPlayerValue>(context).duration - Provider.of<VideoPlayerValue>(context).position;
    String timeStamp = durationToString(left, includeHours: Provider.of<VideoPlayerValue>(context).duration.inHours > 0);
    return '-$timeStamp';
  }

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(
      color: cupertinoGrey
    );
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(getProgressString(context), style: textStyle),
        Text(getProgressLeftString(context), style: textStyle)
      ],
    );
  }
}