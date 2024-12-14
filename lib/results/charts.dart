import 'package:flutter/material.dart';
import 'package:rubenfy/ratings/chart.dart';

class Charts extends StatelessWidget {
  final String title;
  final data;
  const Charts({Key? key, this.data, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold)),
        Chart(data: data),
      ],
    );
  }
}
