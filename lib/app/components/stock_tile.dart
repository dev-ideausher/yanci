import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/line_chart.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StockTile extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final StockModel stock;
  final Color? slidableBackGroundColor;
  final Color? slidableForeGroundColor;
  final String? label;
  final Widget? icon;
  final bool isSlidable;
  final bool isOwned;
  const StockTile({
    super.key,
    required this.stock,
    this.onPressed,
    this.slidableBackGroundColor,
    this.slidableForeGroundColor,
    this.label,
    this.icon,
    this.isSlidable = true,
    this.isOwned = false,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: !isSlidable
          ? null
          : ActionPane(
              extentRatio: 0.2,
              motion: const DrawerMotion(),
              children: [
                CustomSlidableAction(
                  flex: 1,
                  onPressed: onPressed,
                  backgroundColor: slidableBackGroundColor ?? context.greenStockColor,
                  foregroundColor: slidableForeGroundColor,
                  child: Center(
                    child: icon ?? const Icon(Icons.bookmark_border),
                  ),
                ),
              ],
            ),
      child: ListTile(
        onTap: () => Get.toNamed(
          Routes.STOCK_DETAILS,
          arguments: [
            stock,
            isOwned ? StringConstants.investmentDetails : StringConstants.stockDetails,
          ],
        ),
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 10.kh),
        title: Text(
          stock.stockName,
          style: TextStyleUtil.kText16_5(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          stock.fullName,
          style: TextStyleUtil.kText12_4(
            fontWeight: FontWeight.w500,
            color: context.disabledColor,
          ),
        ),
        trailing: SizedBox(
          width: 186.kw,
          height: double.infinity,
          child: Row(
            children: [
              SizedBox(
                height: 20.kh,
                width: 60.kw,
                child: StockLineChart(
                  lineColor: stock.isProfit ? context.greenStockColor : context.redColor,
                  points: stock.points,
                  maxX: stock.points.map((point) => point.x).reduce((a, b) => a > b ? a : b),
                  minX: stock.points.map((point) => point.x).reduce((a, b) => a < b ? a : b),
                  barWidth: 2,
                  showGradient: false,
                  maxY: stock.points.map((point) => point.y).reduce((a, b) => a > b ? a : b),
                  minY: stock.points.map((point) => point.y).reduce((a, b) => a < b ? a : b),
                ),
              ),
              5.kwidthBox,
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${StringConstants.ghanaCurrency} ${stock.price}",
                      style: TextStyleUtil.kText16_5(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      stock.isProfit ? "+${stock.percentage}(+${stock.percentage}%)" : "-${stock.percentage}(-${stock.percentage}%)",
                      style: TextStyleUtil.kText12_4(
                        fontWeight: FontWeight.w500,
                        color: stock.isProfit ? context.greenStockColor : context.redStockColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
