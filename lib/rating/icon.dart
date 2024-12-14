import 'package:flutter/material.dart';

class IconRating extends StatelessWidget {
  final bool isDisabled;
  final String imgSrc;
  final String? text;
  const IconRating({super.key, required this.imgSrc, this.isDisabled = false, this.text});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (text != null) {
      return Container(
        child: Column(
                children: [
                  Text(text!, style: const TextStyle(fontSize: 20)),
                  Image.asset(imgSrc, width: width * 0.20),
                ],
              ),
      );
    }
    return Container(
      child: isDisabled
          ? Image.asset(imgSrc, width: width * 0.20, color: Colors.grey)
          : Image.asset(imgSrc, width: width * 0.20),
    );
  }
}
