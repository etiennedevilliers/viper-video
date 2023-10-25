import 'package:better_player/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BetterPlayer());
}

class BetterPlayer extends StatelessWidget {
  const BetterPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Viper Video',
      home: HomePage(),
    );
  }
}
