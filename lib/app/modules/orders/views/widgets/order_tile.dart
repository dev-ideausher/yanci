import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(Routes.STOCK_DETAILS, arguments: [
        randomStockData[0],
        StringConstants.investmentDetails
      ]),
      child: SizedBox(
        height: 85.kh,
        width: double.infinity,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "2:23 PM",
                  style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                ),
                Text(
                  StringConstants.buy.toUpperCase(),
                  style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                ),
              ],
            ),
            3.kheightBox,
            Row(
              children: [
                Text(
                  "UNI INDUSTRY",
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                CircleAvatar(
                  radius: 5.5.kh,
                  backgroundColor: context.kcPrimaryColor,
                ),
                2.kwidthBox,
                Text(
                  "1",
                  style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            3.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Delivery",
                  style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
                ),
                Text(
                  "Avg ₵9.79 ",
                  style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
                ),
              ],
            ),
            Divider(
              color: context.disabledBorderColor,
            ),
          ],
        ),
      ),
    );
  }
}
