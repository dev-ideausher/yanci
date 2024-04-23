import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/sell/views/screens/order_details_screen.dart';
import 'package:yanci/app/modules/sell/controllers/sell_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class SellConfirmationScreen extends StatelessWidget {
  const SellConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sellController = Get.find<SellController>();
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            100.kheightBox,
            Center(
              child: Assets.lottiefiles.successful.lottie(height: 216.kh, width: 216.kw),
            ),
            Text(StringConstants.sellOrderPlaced, style: TextStyleUtil.kText20_6()),
            20.kheightBox,
            Text(
              StringConstants.orderDetails,
              style: TextStyleUtil.kText20_6(color: context.kcPrimaryColor),
            ),
            Padding(
              padding: EdgeInsets.all(16.kh),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  border: Border.all(color: context.disabledBorderColor),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SizedBox(
                  width: double.maxFinite,
                  height: 217.kh,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(12.kh),
                        child: Text(
                          sellController.stock.stockName,
                          style: TextStyleUtil.kText16_5(),
                        ),
                      ),
                      Divider(color: context.disabledBorderColor, height: 1),
                      _buildStockInfo(StringConstants.noOfShares, sellController.quantity.value.toString()),
                      Divider(color: context.disabledBorderColor, height: 1),
                      _buildStockInfo(StringConstants.pricePerShare, "${StringConstants.ghanaCurrency} ${sellController.stock.price}"),
                      Divider(color: context.disabledBorderColor, height: 1),
                      _buildStockInfo(StringConstants.estimatedCost, "${StringConstants.ghanaCurrency} ${sellController.estimatedPrice.value}"),
                      Divider(color: context.disabledBorderColor, height: 1),
                      _buildStockInfo(StringConstants.type, sellController.radioValue.value == 0 ? StringConstants.limitOrder : StringConstants.marketOrder),
                    ],
                  ),
                ),
              ),
            ),
            60.kheightBox,
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: context.whiteColor,
        shadowColor: context.blackColor,
        elevation: 8,
        color: context.whiteColor,
        height: 180.kh,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringConstants.howExpWithYanci,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.close),
              ],
            ),
            20.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for (var i = 0; i < 5; i++)
                  Icon(
                    Icons.star_border,
                    color: context.kcPrimaryColor,
                  )
              ],
            ),
            20.kheightBox,
            CustomButton(
              onTap: () => Get.to(() => const OrderDetailsScreen()),
              title: StringConstants.done,
              height: 48.kh,
              borderRadius: 50,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInfo(String title, String value) {
    return Padding(
      padding: EdgeInsets.all(10.kh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyleUtil.kText14_4()),
          Text(
            value,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: Get.context!.blackColor.withOpacity(0.6)),
          ),
        ],
      ),
    );
  }
}
