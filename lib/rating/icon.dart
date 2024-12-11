import 'package:flutter/material.dart';

class IconRating extends StatelessWidget {
  final bool isDisabled;
  final String imgSrc;
  const IconRating({super.key, required this.imgSrc, this.isDisabled = false});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: isDisabled
          ? Image.asset(imgSrc, width: width * 0.20, color: Colors.grey)
          : Image.asset(imgSrc, width: width * 0.20),
    );
  }
}
