import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/stocks_model.dart';
import 'package:yanci/app/modules/home/views/widgets/searchbar.dart';
import 'package:yanci/app/modules/home/views/widgets/stock_tile.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SearchBarWithFilter(),
                        ...randomStockData.map(
                          (e) => Column(
                            children: [
                              StockTile(stock: e),
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
                  const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          elevation: 10,
          selectedItemColor: context.kcPrimaryColor,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyleUtil.kText12_4(),
          unselectedLabelStyle: TextStyleUtil.kText12_4(),
          unselectedItemColor: context.disabledColor,
          currentIndex: controller.index.value,
          type: BottomNavigationBarType.fixed,
          items: controller.bottomTabs
              .map(
                (e) => BottomNavigationBarItem(
                  icon: e['icon'].svg(
                    colorFilter: ColorFilter.mode(controller.index.value == e['index'] ? context.kcPrimaryColor : context.disabledColor, BlendMode.srcIn),
                  ),
                  label: e['label'],
                ),
              )
              .toList(),
          onTap: controller.changeIndex,
        ),
      ),
    );
  }
}
