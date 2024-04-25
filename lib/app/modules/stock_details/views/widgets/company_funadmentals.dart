import 'package:flutter/material.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/key_value_pair.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/formatter.dart';

class CompanyFundamenetalsComponent extends StatelessWidget {
  final StockModel stock;
  const CompanyFundamenetalsComponent({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringConstants.companyFundamentals,
            style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
          ),
          20.kheightBox,
          Wrap(
            runSpacing: 10.kh,
            spacing: 20.kw,
            children: [
              LabelValuePair(
                label: StringConstants.marketCap,
                value: "${StringConstants.ghanaCurrency} ${formatCurrency(stock.companyFundamentals.marketCap)}",
              ),
              LabelValuePair(
                label: StringConstants.roe,
                value: "${stock.companyFundamentals.roe}%",
              ),
              LabelValuePair(
                label: StringConstants.shareOut,
                value: formatCurrency(stock.companyFundamentals.shareOut),
              ),
              LabelValuePair(
                label: StringConstants.dividendPerShare,
                value: stock.companyFundamentals.dividendPerShare.toString(),
              ),
              LabelValuePair(
                label: StringConstants.peRatio,
                value: stock.companyFundamentals.peRatio.toString(),
              ),
              LabelValuePair(
                label: StringConstants.dividendYield,
                value: "${stock.companyFundamentals.dividendYield}%",
              ),
              LabelValuePair(
                label: StringConstants.pbRatio,
                value: stock.companyFundamentals.pbRatio.toString(),
              ),
              LabelValuePair(
                label: StringConstants.debtToEquity,
                value: stock.companyFundamentals.debtToEquity.toString(),
              ),
            ],
          ),
          20.kheightBox,
          Text(
            StringConstants.aboutTheCompany,
            style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
          ),
          10.kheightBox,
          RichText(
            text: TextSpan(
              text: "NexInnovate: A visionary tech firm pioneering bespoke software solutions for businesses worldwide. ",
              style: TextStyleUtil.kText11_4(color: context.greyTextColor),
              children: [
                TextSpan(
                  text: StringConstants.showMore,
                  style: TextStyleUtil.kText11_4(color: context.kcPrimaryColor),
                ),
              ],
            ),
          ),
          10.kheightBox,
          Row(
            children: [
              SizedBox(
                width: 49.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.ceo,
                      style: TextStyleUtil.kText11_4(color: context.greyTextColor),
                    ),
                    Text(
                      "Andrew Richards",
                      style: TextStyleUtil.kText11_4(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.ceo,
                    style: TextStyleUtil.kText11_4(color: context.greyTextColor),
                  ),
                  Text(
                    "Andrew Richards",
                    style: TextStyleUtil.kText11_4(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
          5.kheightBox,
          Row(
            children: [
              SizedBox(
                width: 49.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConstants.employees,
                      style: TextStyleUtil.kText11_4(color: context.greyTextColor),
                    ),
                    Text(
                      "1006",
                      style: TextStyleUtil.kText11_4(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.headQuarters,
                    style: TextStyleUtil.kText11_4(color: context.greyTextColor),
                  ),
                  Text(
                    "California, Us",
                    style: TextStyleUtil.kText11_4(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
