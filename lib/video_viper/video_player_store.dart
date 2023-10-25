import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerStoreProvider extends SingleChildStatelessWidget {
  const VideoPlayerStoreProvider({
    Key? key,
    required this.create,
    Widget? child,
  }) : super(key: key, child: child);

  final Create<VideoPlayerController> create;

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return InheritedProvider<VideoPlayerController>(
      create: create,
      builder: (context, _) {
        return ValueListenableProvider<VideoPlayerValue>.value(
          value: context.watch<VideoPlayerController>(),
          child: child,
        );
      },
    );
  }
}