import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    print(lengthOfLongestSubstring("abcabcbb"));
    return Obx(
      () => Scaffold(
        body: controller.mainScreen[controller.index.value],
        bottomNavigationBar: BottomNavigationBar(
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
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    int start = 0;
    Map<String, int> map = {};
    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s[i])) {
        start = max(start, map[s[i]]! + 1);
      }
      map[s[i]] = i;
      maxLength = max(maxLength, i - start + 1);
    }

    return maxLength;
  }
}
