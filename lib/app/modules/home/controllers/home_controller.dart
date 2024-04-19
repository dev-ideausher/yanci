import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/gen/assets.gen.dart';

class HomeController extends GetxController with GetSingleTickerProviderStateMixin {
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

  late TabController tabController;
  @override
  void onInit() {
    tabController = TabController(length: 2, vsync: this);
    super.onInit();
  }

  RxInt index = 2.obs;

  void changeIndex(int i) {
    index.value = i;
  }
}
