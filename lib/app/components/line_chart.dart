import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/services/colors.dart';

class StockLineChart extends StatelessWidget {
  final Color lineColor;
  final List<Point> points;
  final double minX;
  final double maxX;
  final double minY;
  final double maxY;
  final double? barWidth;
  final bool? showGradient;
  const StockLineChart({
    super.key,
    required this.lineColor,
    required this.points,
    required this.minX,
    required this.maxX,
    required this.minY,
    required this.maxY,
    this.barWidth,
    this.showGradient,
  });

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
          horizontalInterval: 1,
          getDrawingHorizontalLine: (value) {
            return value == ((minY + maxY) / 2).floor()
                ? FlLine(
                    color: lineColor,
                    strokeWidth: 1,
                    dashArray: [
                      4,
                      4
                    ],
                  )
                : const FlLine(strokeWidth: 0);
          },
        ),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
        titlesData: const FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: points.map((e) => FlSpot(e.x, e.y)).toList(),
            isCurved: true,
            curveSmoothness: 0.05,
            color: lineColor,
            barWidth: barWidth ?? 3,
            isStrokeCapRound: true,
            dotData: const FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: showGradient ?? true,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  lineColor,
                  context.whiteColor
                ].map((color) => color.withOpacity(0.2)).toList(),
              ),
            ),
          ),
        ],
      ),
      duration: const Duration(milliseconds: 400),
    );
  }
}
