import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/explore/views/explore_view.dart';
import 'package:yanci/app/modules/my_stocks/views/my_stocks_view.dart';
import 'package:yanci/gen/assets.gen.dart';

class HomeController extends GetxController {
  List<Map<String, dynamic>> bottomTabs = [
    {
      'icon': Assets.svg.myStocks,
      'label': StringConstants.myStocks,
      'index': 0,
    },
    {
      'icon': Assets.svg.news,
      'label': StringConstants.news,
      'index': 1,
    },
    {
      'icon': Assets.svg.explore,
      'label': StringConstants.explore,
      'index': 2,
    },
    {
      'icon': Assets.svg.orders,
      'label': StringConstants.orders,
      'index': 3,
    },
    {
      'icon': Assets.svg.more,
      'label': StringConstants.more,
      'index': 4,
    },
  ];

  List<Widget> mainScreen = const [
    MyStocksView(),
    SizedBox(),
    ExploreView(),
    SizedBox(),
    SizedBox(),
  ];

  RxInt index = 2.obs;

  void changeIndex(int i) {
    index.value = i;
  }
}
