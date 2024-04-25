import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

// ignore: must_be_immutable
class TimeIntervalChips extends StatelessWidget {
  RxBool isBarChartSelected;
  RxInt selectedIndex;
  TimeIntervalChips({
    super.key,
    required this.isBarChartSelected,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (int i = 0; i < StringConstants.timeInterval.length; i++) buildChips(i),
        Obx(
          () => GestureDetector(
            onTap: () => isBarChartSelected.value = !isBarChartSelected.value,
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(70.kh),
                border: Border.all(color: Get.context!.kcPrimaryColor),
                color: Get.context!.whiteColor,
              ),
              child: SizedBox(
                height: 29.kh,
                width: 43.kw,
                child: Center(
                  child: isBarChartSelected.value ? Assets.svg.candleChart.svg() : Assets.svg.lineChart.svg(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildChips(int index) {
    return Obx(
      () => GestureDetector(
        onTap: () => selectedIndex.value = index,
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70.kh),
            border: selectedIndex.value == index ? null : Border.all(color: Get.context!.kcPrimaryColor),
            color: selectedIndex.value == index ? Get.context!.kcPrimaryColor : Get.context!.whiteColor,
          ),
          child: SizedBox(
            height: 29.kh,
            width: 43.kw,
            child: Center(
              child: Text(
                StringConstants.timeInterval[index],
                style: TextStyleUtil.kText14_4(
                  fontWeight: FontWeight.w600,
                  color: selectedIndex.value == index ? Get.context!.whiteColor : Get.context!.kcPrimaryColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
