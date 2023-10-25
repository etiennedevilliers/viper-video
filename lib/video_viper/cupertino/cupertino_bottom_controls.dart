import 'package:better_player/video_viper/cupertino/widgets/progress_bar.dart';
import 'package:better_player/video_viper/cupertino/widgets/time_stamps.dart';
import 'package:better_player/video_viper/cupertino/widgets/title.dart';
import 'package:flutter/material.dart';

class CupertinoBottomControls extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final SeekTo? seekTo;
  
  const CupertinoBottomControls({super.key, this.title, this.subTitle, this.seekTo});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 30,
      bottom: 10,
      right: 30,
      child:  SafeArea(
        child: Column(
          children: [
            CupertinoTitle(title: title, subTitle: subTitle,),
            CupertinoProgressBar(
              seekTo: seekTo,
            ),
            const SizedBox(height: 5,),
            const CupertinoTimeStamps()
          ],
        )
      ),
    );
  }
}