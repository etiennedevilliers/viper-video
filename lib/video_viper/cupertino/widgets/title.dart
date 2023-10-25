import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const CupertinoTitle({super.key, this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold
    );
    const TextStyle subTitleStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(subTitle ?? '', style: subTitleStyle,),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title ?? '', style: titleStyle,),
              const Icon(
                CupertinoIcons.ellipsis_circle,
                color: Colors.white,
                size: 25,
              )
            ],
          ),
        ),
      ],
    );
  }
}