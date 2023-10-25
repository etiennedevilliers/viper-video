import 'package:better_player/video_viper/video_viper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final VideoPlayerController controller = VideoPlayerController.asset('assets/video/linux-by-balenciaga.mp4');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Me Title'),
      ),
      backgroundColor: CupertinoColors.black,
      body: SafeArea(
        child: ListView(
          children: [
            VideoViperInline(
              controller: controller,
              title: 'Linux by Balenciaga',
              subTitle: 'phirevideos',
            ),
          ],
        ),
      ),
    );
  }
}