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
    print(lengthOfLongestSubstring("pwwkew"));
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
    int left=0;
    int maxl=0;
    Set<String> charSet={};
    for(int right=0;right<s.length;right++)
    {
      while(charSet.contains(s[right]))
      {
        charSet.remove(s[left]);
        left++;
      }
      charSet.add(s[right]);
      maxl=max(maxl,right-left+1);

    }
    return maxl;
  }
}
