import 'package:flutter/material.dart';
import 'package:rubenfy/rating/icon.dart';

class RatingsResults extends StatelessWidget {
  final String text;
  final int value;
  const RatingsResults({Key? key, required this.text, required this.value}) : super(key: key);

  _getImage(int rateValue) {
    if (rateValue == 1) {
      return 'assets/images/ru_rated_1.png';
    } else if (rateValue == 2) {
      return 'assets/images/ru_rated_2.png';
    } else if (rateValue == 3) {
      return 'assets/images/ru_rated_3.png';
    } else if (rateValue == 4) {
      return 'assets/images/ru_rated_4.png';
    } else {
      return 'assets/images/ru_rated_5.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(text, style: const TextStyle(fontSize: 22)),
        IconRating(imgSrc: _getImage(value), text: value.toString()),
      ],
    );
  }
}
