import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/explore/views/screens/stocks.dart';
import 'package:yanci/app/modules/explore/views/screens/watchlist.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/explore_controller.dart';

class ExploreView extends GetView<ExploreController> {
  const ExploreView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(double.maxFinite, kToolbarHeight),
        child: Column(
          children: [
            const Spacer(),
            TabBar(
              splashFactory: NoSplash.splashFactory,
              indicatorColor: context.kcPrimaryColor,
              labelStyle: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600, color: context.kcPrimaryColor),
              unselectedLabelStyle: TextStyleUtil.kText15_4(color: context.greyTextColor),
              indicatorSize: TabBarIndicatorSize.tab,
              controller: controller.tabController,
              tabs: const [
                Tab(text: StringConstants.stocks),
                Tab(text: StringConstants.watchlist),
              ],
            ),
          ],
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  Stocks(),
                  WatchList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
