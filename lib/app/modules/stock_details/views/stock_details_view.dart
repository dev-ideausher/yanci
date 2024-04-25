import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_divider.dart';
import 'package:yanci/app/components/graph_component.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/company_funadmentals.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/investment_details.dart';
import 'package:yanci/app/modules/stock_details/views/widgets/stock_fundamentals_component.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
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
        backgroundColor: context.whiteColor,
        surfaceTintColor: context.whiteColor,
        title: Text(
          controller.title,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => DialogHelper.showGlossary(),
          ),
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
              Padding(
                padding: EdgeInsets.all(16.kh),
                child: GraphComponent(
                  isBarChartSelected: controller.isBarChartSelected,
                  selectedIndex: controller.selectedIndex,
                  stock: controller.stock,
                  trackballBehavior: controller.trackballBehavior,
                ),
              ),
              20.kheightBox,
              const StDivider(),
              StockFundamentals(stock: controller.stock),
              const StDivider(),
              CompanyFundamenetalsComponent(stock: controller.stock),
              if (controller.title == StringConstants.investmentDetails) const InvestmentDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: controller.title == StringConstants.investmentDetails
          ? null
          : BottomAppBar(
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
}
