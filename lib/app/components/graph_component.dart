import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:yanci/app/components/candle_chart.dart';
import 'package:yanci/app/components/line_chart.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/time_interval_chips.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

// ignore: must_be_immutable
class GraphComponent extends StatelessWidget {
  RxBool isBarChartSelected;
  RxInt selectedIndex;
  TrackballBehavior? trackballBehavior;
  final StockModel stock;
  GraphComponent({
    super.key,
    required this.isBarChartSelected,
    required this.selectedIndex,
    required this.stock,
    this.trackballBehavior,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => SizedBox(
            height: 200.kh,
            width: double.infinity,
            child: isBarChartSelected.value
                ? StockLineChart(
                    lineColor: stock.isProfit ? context.greenStockColor : context.redColor,
                    points: stock.points,
                    maxX: stock.points.map((point) => point.x).reduce((a, b) => a > b ? a : b),
                    minX: stock.points.map((point) => point.x).reduce((a, b) => a < b ? a : b),
                    maxY: stock.points.map((point) => point.y).reduce((a, b) => a > b ? a : b),
                    minY: stock.points.map((point) => point.y).reduce((a, b) => a < b ? a : b),
                  )
                : StockCandleChart(
                    trackballBehavior: trackballBehavior,
                  ),
          ),
        ),
        20.kheightBox,
        TimeIntervalChips(
          selectedIndex: selectedIndex,
          isBarChartSelected: isBarChartSelected,
        ),
      ],
    );
  }
}
