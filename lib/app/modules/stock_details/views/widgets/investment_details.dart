import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_divider.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class InvestmentDetails extends StatelessWidget {
  const InvestmentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.holdingDetails,
                style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
              ),
              20.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.allocate,
                    style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                  ),
                  Text(
                    "25.32%",
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              10.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.quantity,
                    style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                  ),
                  Text(
                    "2",
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              10.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.avgPrice,
                    style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                  ),
                  Text(
                    "₵9.79",
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              10.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.investment,
                    style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                  ),
                  Text(
                    "₵19.79",
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              10.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.profitOrLoss,
                    style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                  ),
                  Text(
                    "-₵4.79(-8.01%)",
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.redStockColor),
                  ),
                ],
              ),
            ],
          ),
        ),
        const StDivider(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.transactionHistory,
                style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
              ),
              20.kheightBox,
              transactionTile(),
              20.kheightBox,
              transactionTile(),
            ],
          ),
        ),
      ],
    );
  }

  Widget transactionTile() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "04 Feb 2024",
            style: TextStyleUtil.kText13_4(color: Get.context!.greyTextColor),
          ),
          10.kheightBox,
          Row(
            children: [
              Text(
                StringConstants.buy.toUpperCase(),
                style: TextStyleUtil.kText13_4(color: Get.context!.greyTextColor),
              ),
              const Spacer(),
              Text(
                "1",
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              30.kwidthBox,
              Text(
                "₵9.79",
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      );
}
