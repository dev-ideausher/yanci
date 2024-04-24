import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class StockTile extends StatelessWidget {
  final void Function(BuildContext)? onPressed;
  final StockModel stock;
  final Color slidableBackGroundColor;
  final Color? slidableForeGroundColor;
  final String? label;
  final Widget icon;
  const StockTile({
    super.key,
    required this.stock,
    this.onPressed,
    required this.slidableBackGroundColor,
    this.slidableForeGroundColor,
    this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.2,
        motion: const DrawerMotion(),
        children: [
          SlidableAction(
            flex: 1,
            onPressed: onPressed,
            backgroundColor: slidableBackGroundColor,
            foregroundColor: slidableForeGroundColor,

            /// Change IconData? to Widget in the flutterSlidable package and make it a required field
            ///
            /// Needed a customizable icon so made this change in the package
            icon: icon,
            label: label,
          ),
        ],
      ),
      child: ListTile(
        onTap: () => Get.toNamed(Routes.STOCK_DETAILS, arguments: stock),
        visualDensity: VisualDensity.compact,
        dense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 10.kh),
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
          width: 176.kw,
          child: Row(
            children: [
              stock.isProfit ? Assets.svg.profitGraph.svg() : Assets.svg.lossGraph.svg(),
              10.kwidthBox,
              Column(
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
            ],
          ),
        ),
      ),
    );
  }
}
