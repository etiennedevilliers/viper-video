import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTopControls extends StatelessWidget {
  const CupertinoTopControls({super.key});

  @override
  Widget build(BuildContext context) {
    const double secondarySize = 35;

    return const Positioned(
      top: 30,
      left: 30,
      right: 30,
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              CupertinoIcons.clear,
              color: Colors.white,
              size: secondarySize,
            ),
            Icon(
              CupertinoIcons.volume_up,
              color: Colors.white,
              size: secondarySize,
            )
          ],
        ),
      ),
    );
  }
}