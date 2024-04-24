import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/stock_tile.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/modules/explore/views/widgets/searchbar.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

class Stocks extends StatelessWidget {
  const Stocks({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();
    return SingleChildScrollView(
      child: Column(
        children: [
          const SearchBarWithFilter(),
          ...randomStockData.map(
            (e) => Column(
              children: [
                StockTile(
                  onPressed: (p0) => controller.addStockInWatchList(e, 0),
                  stock: e,
                  icon: Icon(
                    Icons.bookmark_border_rounded,
                    color: context.blackColor,
                  ),
                  slidableBackGroundColor: context.lightGreenColor,
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
    );
  }
}
