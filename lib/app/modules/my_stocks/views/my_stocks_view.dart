import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/components/custom_appbar.dart';
import 'package:yanci/app/components/graph_component.dart';
import 'package:yanci/app/components/stock_tile.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/my_stocks_controller.dart';

class MyStocksView extends GetView<MyStocksController> {
  const MyStocksView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.kh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.totalReturns,
                    style: TextStyleUtil.kText19_6(),
                  ),
                  Text(
                    "₵612M",
                    style: TextStyleUtil.kText25_7(fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_upward_rounded,
                        color: context.greenStockColor,
                        size: 16.kh,
                      ),
                      Text(
                        "₵612M (23.89%)",
                        style: TextStyleUtil.kText9_4(fontWeight: FontWeight.w600, color: context.greenStockColor),
                      )
                    ],
                  ),
                  20.kheightBox,
                  GraphComponent(
                    isBarChartSelected: controller.isBarChartSelected,
                    selectedIndex: controller.selectedIndex,
                    stock: randomStockData[0],
                    trackballBehavior: controller.trackballBehavior,
                  ),
                  30.kheightBox,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.disabledBorderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: 180.kh,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(16.kh),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.currentHoldings,
                                  style: TextStyleUtil.kText15_4(),
                                ),
                                Text(
                                  StringConstants.totalReturns,
                                  style: TextStyleUtil.kText15_4(),
                                ),
                              ],
                            ),
                            10.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₵612M",
                                  style: TextStyleUtil.kText20_6(),
                                ),
                                Text(
                                  "+₵612M(21.0%)",
                                  style: TextStyleUtil.kText20_6(color: context.greenStockColor),
                                ),
                              ],
                            ),
                            20.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.invested,
                                  style: TextStyleUtil.kText15_4(),
                                ),
                                Text(
                                  StringConstants.oneDReturn,
                                  style: TextStyleUtil.kText15_4(),
                                ),
                              ],
                            ),
                            10.kheightBox,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "₵612M",
                                  style: TextStyleUtil.kText20_6(),
                                ),
                                Text(
                                  "+₵612M(21.0%)",
                                  style: TextStyleUtil.kText20_6(color: context.redStockColor),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.kheightBox,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      border: Border.all(color: context.disabledBorderColor),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                      height: 90.kh,
                      width: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.all(16.kh),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.buyingPower,
                                  style: TextStyleUtil.kText15_4(),
                                ),
                                Obx(
                                  () => Text(
                                    "GH₵ ${controller.balance.value.toStringAsFixed(2)}",
                                    style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                            CustomButton(
                              title: "+ ${StringConstants.addMoney.toUpperCase()}",
                              style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w600, color: context.whiteColor),
                              height: 34.kh,
                              width: 128.kw,
                              onTap: () => Get.toNamed(Routes.ADD_MONEY, arguments: controller.balance),
                              borderRadius: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  20.kheightBox,
                  Text(
                    StringConstants.holdings,
                    style: TextStyleUtil.kText19_6(),
                  ),
                  20.kheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.sort,
                        style: TextStyleUtil.kText16_5(),
                      ),
                      Obx(
                        () => DropdownButton<String>(
                          isDense: true,
                          underline: const SizedBox(),
                          elevation: 2,
                          icon: Assets.svg.sort.svg(),
                          style: TextStyleUtil.kText12_4(),
                          value: controller.selectedSort.value,
                          items: [
                            DropdownMenuItem(
                              value: StringConstants.currentlyInvested,
                              child: Text(
                                StringConstants.currentlyInvested,
                                style: TextStyleUtil.kText12_4(),
                              ),
                            ),
                            DropdownMenuItem(
                              value: StringConstants.gainers,
                              child: Text(
                                StringConstants.gainers,
                                style: TextStyleUtil.kText12_4(),
                              ),
                            ),
                            DropdownMenuItem(
                              value: StringConstants.losers,
                              child: Text(
                                StringConstants.losers,
                                style: TextStyleUtil.kText12_4(),
                              ),
                            ),
                          ],
                          onChanged: (val) => controller.selectedSort.value = val!,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Obx(() => Column(children: buildStocks())),
          ],
        ),
      ),
    );
  }

  List<Widget> buildStocks() {
    if (controller.selectedSort.value == StringConstants.currentlyInvested) {
      return randomStockData
          .map(
            (e) => StockTile(
              stock: e,
              isSlidable: false,
              isOwned: true,
            ),
          )
          .toList();
    }
    if (controller.selectedSort.value == StringConstants.gainers) {
      return randomStockData
          .where((stock) => stock.isProfit)
          .map(
            (e) => StockTile(
              stock: e,
              isSlidable: false,
              isOwned: true,
            ),
          )
          .toList();
    }
    return randomStockData
        .where((stock) => !stock.isProfit)
        .map(
          (e) => StockTile(
            stock: e,
            isSlidable: false,
            isOwned: true,
          ),
        )
        .toList();
  }
}
