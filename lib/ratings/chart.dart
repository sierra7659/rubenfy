import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  final List<Map> data;
  Chart({super.key, required this.data});

  List<Color> gradientColors = [
    Colors.white,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.0,
      child: Padding(
        padding: const EdgeInsets.only(
          right: 18,
          left: 12,
          top: 24,
          bottom: 12,
        ),
        child: LineChart(mainData(data)),
      ),
    );
  }

  LineChartData mainData(List<Map> data) {
    final dataSortedByDateList = data
        .map((e) => {'key': e['date'].seconds, 'value': e['value']})
        .toList()
      ..sort((a, b) => a['key'].compareTo(b['key']));

    final spots = dataSortedByDateList
        .asMap()
        .entries
        .map((entry) =>
            FlSpot(entry.key.toDouble(), entry.value['value'].toDouble()))
        .toList();

    return LineChartData(
      gridData: const FlGridData(
        show: true,
        drawVerticalLine: false,
        drawHorizontalLine: false,
      ),
      titlesData: const FlTitlesData(
        show: true,
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true, interval: 1),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          color: Colors.white,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            color: Colors.white.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
