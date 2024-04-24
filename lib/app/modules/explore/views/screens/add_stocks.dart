import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class AddStocks extends StatelessWidget {
  const AddStocks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();
    return Scaffold(
      backgroundColor: context.disabledBorderColor,
      appBar: AppBar(
        backgroundColor: context.whiteColor,
        elevation: 1,
        surfaceTintColor: context.whiteColor,
        shadowColor: context.blackColor,
        title: SizedBox(
          child: StTextField(
            constraints: BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
            controller: controller.stockNameController,
            hint: StringConstants.searchForStocks,
            hintStyle: TextStyleUtil.kText14_4(color: context.greyTextColor),
            suffixIcon: const Icon(Icons.search),
            backGroundColor: context.whiteColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...randomStockData.map(
              (e) => _stockTile(e),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stockTile(StockModel stock) {
    final controller = Get.find<ExploreController>();
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.kh),
      child: ColoredBox(
        color: Get.context!.whiteColor,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stock.stockName,
                    style: TextStyleUtil.kText16_5(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    stock.fullName,
                    style: TextStyleUtil.kText12_4(
                      fontWeight: FontWeight.w500,
                      color: Get.context!.disabledColor,
                    ),
                  ),
                ],
              ),
              Obx(
                () => IconButton(
                  onPressed: () => controller.watchList[controller.selectedWatchlist.value].contains(stock)
                      ? controller.removeStockFromWatchList(
                          stock,
                          controller.selectedWatchlist.value,
                        )
                      : controller.addStockInWatchList(
                          stock,
                          controller.selectedWatchlist.value,
                        ),
                  icon: Icon(
                    controller.watchList[controller.selectedWatchlist.value].contains(stock) ? Icons.bookmark : Icons.bookmark_border_rounded,
                    color: Get.context!.blackColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
