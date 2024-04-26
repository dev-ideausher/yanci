import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

// ignore: must_be_immutable
class CustomChipList extends StatelessWidget {
  final List<String> labels;
  RxInt selectedIndex;
  CustomChipList({super.key, required this.labels, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.kh,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.kh),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: labels.length,
          itemBuilder: (context, index) => watchlistTile(index),
        ),
      ),
    );
  }

  Widget watchlistTile(int index) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: index == labels.length - 1 ? 10 : 0),
      child: GestureDetector(
        onTap: () => selectedIndex.value = index,
        child: Obx(
          () => DecoratedBox(
            decoration: BoxDecoration(
              color: selectedIndex.value == index ? Get.context!.kcPrimaryColor : Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(40),
              border: selectedIndex.value == index ? null : Border.all(color: Get.context!.disabledBorderColor),
            ),
            child: SizedBox(
              height: 41.kh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.kw, vertical: 10.kh),
                child: Text(
                  labels[index],
                  style: TextStyleUtil.kText15_4(
                    color: selectedIndex.value == index ? Get.context!.whiteColor : Get.context!.greyTextColor,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
