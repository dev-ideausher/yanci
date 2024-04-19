import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_divider.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/formatter.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/stock_details_controller.dart';

class StockDetailsView extends GetView<StockDetailsController> {
  const StockDetailsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: context.kWhitelight,
        elevation: 2,
        surfaceTintColor: context.whiteColor,
        title: Text(
          StringConstants.stockDetails,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        actions: [
          const Icon(Icons.info_outline),
          16.kwidthBox,
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.kw),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 20.kh,
                      backgroundImage: CachedNetworkImageProvider(
                        controller.stock.imageUrl,
                      ),
                    ),
                    10.kwidthBox,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.stock.stockName,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          controller.stock.fullName,
                          style: TextStyleUtil.kText12_4(
                            fontWeight: FontWeight.w500,
                            color: context.disabledColor,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CircleAvatar(
                      radius: 20.kh,
                      backgroundColor: context.avatarColor,
                      child: Center(child: Assets.svg.bookmark.svg()),
                    ),
                    10.kwidthBox,
                    CircleAvatar(
                      radius: 20.kh,
                      backgroundColor: context.avatarColor,
                      child: Center(child: Assets.svg.share.svg()),
                    ),
                  ],
                ),
              ),
              20.kheightBox,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.kw),
                child: Text.rich(
                  TextSpan(
                    text: "${StringConstants.ghanaCurrency} ${controller.stock.price} ",
                    children: [
                      TextSpan(
                        text: controller.stock.isProfit ? "+${controller.stock.percentage}(+${controller.stock.percentage}%) today" : "-${controller.stock.percentage}(-${controller.stock.percentage}%) today",
                        style: TextStyleUtil.kText12_4(
                          fontWeight: FontWeight.w500,
                          color: controller.stock.isProfit ? context.greenStockColor : context.redStockColor,
                        ),
                      ),
                    ],
                  ),
                  style: TextStyleUtil.kText28_6(),
                ),
              ),
              SizedBox(
                height: 300.kh,
                width: double.infinity,
                child: const Center(
                  child: Text("Graph (tbd)"),
                ),
              ),
              const StDivider(),
              Padding(
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
                        labelValuePair(StringConstants.dayHigh, "${StringConstants.ghanaCurrency} ${controller.stock.stockFundamentals.dayHigh}"),
                        labelValuePair(StringConstants.dayLow, "${StringConstants.ghanaCurrency} ${controller.stock.stockFundamentals.dayLow}"),
                        labelValuePair(StringConstants.shareOut, formatCurrency(controller.stock.stockFundamentals.shareOut)),
                        labelValuePair(StringConstants.volume, controller.stock.stockFundamentals.volume.toString()),
                        labelValuePair(StringConstants.openPrice, controller.stock.stockFundamentals.openPrice.toString()),
                        labelValuePair(StringConstants.week52Low, controller.stock.stockFundamentals.week52Low.toString()),
                        labelValuePair(StringConstants.week52High, controller.stock.stockFundamentals.week52High.toString()),
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
                      StringConstants.companyFundamentals,
                      style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
                    ),
                    20.kheightBox,
                    Wrap(
                      runSpacing: 10.kh,
                      spacing: 20.kw,
                      children: [
                        labelValuePair(StringConstants.marketCap, "${StringConstants.ghanaCurrency} ${formatCurrency(controller.stock.companyFundamentals.marketCap)}"),
                        labelValuePair(StringConstants.roe, "${controller.stock.companyFundamentals.roe}%"),
                        labelValuePair(StringConstants.shareOut, formatCurrency(controller.stock.companyFundamentals.shareOut)),
                        labelValuePair(StringConstants.dividendPerShare, controller.stock.companyFundamentals.dividendPerShare.toString()),
                        labelValuePair(StringConstants.peRatio, controller.stock.companyFundamentals.peRatio.toString()),
                        labelValuePair(StringConstants.dividendYield, "${controller.stock.companyFundamentals.dividendYield}%"),
                        labelValuePair(StringConstants.pbRatio, controller.stock.companyFundamentals.pbRatio.toString()),
                        labelValuePair(StringConstants.debtToEquity, controller.stock.companyFundamentals.debtToEquity.toString()),
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
                      StringConstants.newsAndReports,
                      style: TextStyleUtil.kText16_7(fontWeight: FontWeight.w600),
                    ),
                    20.kheightBox,
                    Text(
                      StringConstants.newsDetails,
                      style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: context.whiteColor,
        shadowColor: context.blackColor,
        height: 64.kh,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomButton(
              title: StringConstants.buy,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.whiteColor),
              height: 48.kh,
              width: 45.w,
              borderRadius: 50,
              onTap: () => Get.toNamed(Routes.BUY, arguments: controller.stock),
            ),
            CustomButton(
              title: StringConstants.sell,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.whiteColor),
              width: 45.w,
              height: 48.kh,
              borderRadius: 50,
              color: context.orangeColor,
              onTap: () => Get.toNamed(Routes.SELL, arguments: controller.stock),
            ),
          ],
        ),
      ),
    );
  }

  Widget labelValuePair(String label, String value) {
    return SizedBox(
      width: 160.kw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            label,
            style: TextStyleUtil.kText13_4(
              fontWeight: FontWeight.w400,
              color: Get.context!.greyTextColor,
            ),
          ),
          Text(
            value,
            style: TextStyleUtil.kText14_4(
              fontWeight: FontWeight.w600,
              color: Get.context!.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
