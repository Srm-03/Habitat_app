import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Statistics extends StatelessWidget {
  final List<ChartData> chartData = [
    ChartData(day: 'Mon', value: 800),
    ChartData(day: 'Tue', value: 950),
    ChartData(day: 'Wed', value: 600),
    ChartData(day: 'Thu', value: 750),
    ChartData(day: 'Fri', value: 850),
    ChartData(day: 'Sat', value: 700),
    ChartData(day: 'Sun', value: 900),
  ];

  Statistics({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Statitics')),
      body: SfCartesianChart(
        primaryXAxis: CategoryAxis(
          title: AxisTitle(text: 'Days'),
        ),
        primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 1000,
          interval: 200,
          title: AxisTitle(text: 'Values'),
        ),
        series: [
          ColumnSeries<ChartData, String>(
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.day,
            yValueMapper: (ChartData data, _) => data.value,
            borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent,
          )
        ],
        tooltipBehavior: TooltipBehavior(enable: true),
      ),
    );
  }
}

class ChartData {
  final String day;
  final double value;

  ChartData({required this.day, required this.value});
}
