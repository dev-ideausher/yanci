import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/modules/news/controllers/news_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NewsController>();
    return SizedBox(
      height: 75.kh,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.kh),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: controller.newsCategories.length,
          itemBuilder: (context, index) => watchlistTile(index),
        ),
      ),
    );
  }

  Widget watchlistTile(int index) {
    final controller = Get.find<NewsController>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: GestureDetector(
        onTap: () => controller.selectedCategory.value = index,
        child: Obx(
          () => DecoratedBox(
            decoration: BoxDecoration(
              color: controller.selectedCategory.value == index ? Get.context!.kcPrimaryColor : Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(40),
              border: controller.selectedCategory.value == index ? null : Border.all(color: Get.context!.disabledBorderColor),
            ),
            child: SizedBox(
              height: 41.kh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.kw, vertical: 10.kh),
                child: Text(
                  controller.newsCategories[index],
                  style: TextStyleUtil.kText15_4(
                    color: controller.selectedCategory.value == index ? Get.context!.whiteColor : Get.context!.greyTextColor,
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
