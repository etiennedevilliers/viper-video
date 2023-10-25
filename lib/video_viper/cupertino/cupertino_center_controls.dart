import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class CupertinoCenterControls extends StatelessWidget {
  final VoidCallback? togglePausePlay;
  final VoidCallback? forward15;
  final VoidCallback? backward15;

  const CupertinoCenterControls({super.key, this.togglePausePlay, this.forward15, this.backward15});

  Widget _buildPausePlayButton(BuildContext context) {
    bool isPlaying = Provider.of<VideoPlayerValue>(context).isPlaying;

    return IconButton(
      iconSize: 70,
      padding: const EdgeInsets.all(0),
      onPressed: togglePausePlay,
      icon: Icon(
        isPlaying ? CupertinoIcons.pause_fill : CupertinoIcons.play_fill,
        color: Colors.white,
      )
    );
  }

  Widget _buildBackward15(BuildContext context) {
    return IconButton(
      iconSize: 35,
      padding: const EdgeInsets.all(0),
      onPressed: backward15,
      icon: const Icon(
        CupertinoIcons.gobackward_15,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  Widget _buildForward15(BuildContext context) {
    return IconButton(
      iconSize: 35,
      padding: const EdgeInsets.all(0),
      onPressed: forward15,
      icon: const Icon(
        CupertinoIcons.goforward_15,
        color: Colors.white,
        size: 35,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildBackward15(context),
          const SizedBox(
            width: 100,
          ),
          _buildPausePlayButton(context),
          const SizedBox(
            width: 100,
          ),
          _buildForward15(context)
        ],
      ),
    );
  }
}