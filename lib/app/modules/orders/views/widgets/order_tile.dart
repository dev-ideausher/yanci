import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/order_details/views/order_details_view.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class OrderTile extends StatelessWidget {
  final bool isBuy;
  final bool isStopLoss;
  const OrderTile({super.key, required this.isBuy, required this.isStopLoss});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => isBuy
          ? Get.toNamed(Routes.STOCK_DETAILS, arguments: [
              randomStockData[0],
              StringConstants.investmentDetails,
              isBuy,
            ])
          : Get.to(() => const OrderDetailsView(), arguments: [
              randomStockData[0],
              false.obs,
              StringConstants.goodTillCancelled.obs,
              0.obs,
              10.obs,
              100.0.obs,
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
                isStopLoss
                    ? Row(
                        children: [
                          Text(
                            "SL",
                            style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                          ),
                          10.kwidthBox,
                          Text(
                            isBuy ? StringConstants.buy.toUpperCase() : StringConstants.sell.toUpperCase(),
                            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
                          ),
                        ],
                      )
                    : Text(
                        isBuy ? StringConstants.buy.toUpperCase() : StringConstants.sell.toUpperCase(),
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
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
                  backgroundColor: isBuy ? context.greenStockColor : context.redStockColor,
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
              height: 1.kh,
            ),
          ],
        ),
      ),
    );
  }
}
