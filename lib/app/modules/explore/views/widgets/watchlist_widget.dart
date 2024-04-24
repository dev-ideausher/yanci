import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/services/bottom_sheet_helper.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class WatchListWidget extends StatelessWidget {
  const WatchListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ExploreController>();
    return SizedBox(
      width: double.infinity,
      height: 70.kh,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.kh),
        child: Row(
          children: [
            Obx(
              () => Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: controller.watchList.length,
                  itemBuilder: (context, index) => watchlistTile(index),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.kh),
              child: InkWell(
                onTap: () => BottomSheetHelper.addWatchList(),
                child: Icon(
                  Icons.add,
                  color: context.kcPrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget watchlistTile(int index) {
    final controller = Get.find<ExploreController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => controller.selectedWatchlist.value = index,
        child: Obx(
          () => DecoratedBox(
            decoration: BoxDecoration(
              color: controller.selectedWatchlist.value == index ? Get.context!.kcPrimaryColor : Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(40),
              border: controller.selectedWatchlist.value == index ? null : Border.all(color: Get.context!.disabledBorderColor),
            ),
            child: SizedBox(
              height: 34.kh,
              width: 114.kw,
              child: Center(
                child: Text(
                  controller.watchListNames[index],
                  style: TextStyleUtil.kText15_4(
                    color: controller.selectedWatchlist.value == index ? Get.context!.whiteColor : Get.context!.greyTextColor,
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
