import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/stock_tile.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/modules/explore/views/screens/add_stocks.dart';
import 'package:yanci/app/modules/explore/views/widgets/watchlist_widget.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class WatchList extends StatelessWidget {
  const WatchList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  const WatchListWidget(),
                  ...controller.watchList[controller.selectedWatchlist.value].map(
                    (e) => Column(
                      children: [
                        StockTile(
                          onPressed: (p0) => controller.removeStockFromWatchList(e, controller.selectedWatchlist.value),
                          stock: e,
                          icon: Icon(
                            Icons.close,
                            color: context.whiteColor,
                          ),
                          slidableBackGroundColor: context.lightRedColor,
                        ),
                        Divider(
                          color: context.kWhitelight,
                          height: 0.5.kh,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16.kh),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  StringConstants.addStocks,
                  style: TextStyleUtil.kText15_4(
                    fontWeight: FontWeight.w500,
                    color: context.kcPrimaryColor,
                  ),
                ),
                onTap: () => Get.to(() => const AddStocks()),
              ),
              10.kwidthBox,
              GestureDetector(
                child: Text(
                  StringConstants.deleteWatchList,
                  style: TextStyleUtil.kText15_4(
                    fontWeight: FontWeight.w500,
                    color: context.redColor,
                  ),
                ),
                onTap: () => DialogHelper.deleteWatchList(
                  controller.watchListNames[controller.selectedWatchlist.value],
                  () => controller.removeWatchList(controller.selectedWatchlist.value),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
