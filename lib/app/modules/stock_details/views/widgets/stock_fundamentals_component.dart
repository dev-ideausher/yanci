import 'package:flutter/material.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/key_value_pair.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StockFundamentals extends StatelessWidget {
  final StockModel stock;
  const StockFundamentals({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.stockFundamentals,
            style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
          ),
          20.kheightBox,
          Wrap(
            runSpacing: 10.kh,
            spacing: 20.kw,
            children: [
              LabelValuePair(
                label: StringConstants.openPrice,
                value: stock.stockFundamentals.openPrice.toString(),
              ),
              LabelValuePair(
                label: StringConstants.volume,
                value: stock.stockFundamentals.volume.toString(),
              ),
              LabelValuePair(
                label: StringConstants.dayHigh,
                value: "${StringConstants.ghanaCurrency} ${stock.stockFundamentals.dayHigh}",
              ),
              LabelValuePair(
                label: StringConstants.dayLow,
                value: "${StringConstants.ghanaCurrency} ${stock.stockFundamentals.dayLow}",
              ),
              LabelValuePair(
                label: StringConstants.week52High,
                value: stock.stockFundamentals.week52High.toString(),
              ),
              LabelValuePair(
                label: StringConstants.week52Low,
                value: stock.stockFundamentals.week52Low.toString(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
