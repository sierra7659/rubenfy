import 'package:flutter/material.dart';
import 'package:rubenfy/rating/icon.dart';

class Rating extends StatefulWidget {
  final String text;
  const Rating({super.key, required this.text});

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Text(widget.text, style: const TextStyle(fontSize: 20, color: Colors.black)),
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
                        imgSrc: 'images/ru_rated_${index + 1}.png',
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
    );
  }
}