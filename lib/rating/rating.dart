import 'package:flutter/material.dart';
import 'package:rubenfy/rating/icon.dart';

class Rating extends StatefulWidget {
  final String text;
  final Function onTap;
  const Rating({super.key, required this.text, required this.onTap});

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  List<bool> isDisabledList = [true, true, true, true, true];

  void updateRating(int index) {
    setState(() {
      for (int i = 0; i < isDisabledList.length; i++) {
        isDisabledList[i] = i >= index;
      }
      widget.onTap(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: Column(
          children: [
            Text(widget.text, style: const TextStyle(fontSize: 26, color: Colors.black, fontWeight: FontWeight.w600, letterSpacing: 2)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return GestureDetector(
                  onTap: () => updateRating(index + 1),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text('${index + 1}', style: const TextStyle(fontSize: 16, color: Colors.black)),
                        IconRating(
                          imgSrc: '/rubenfy/assets/images/ru_rated_${index + 1}.png',
                          isDisabled: isDisabledList[index],
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}