import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/news_model.dart';
import 'package:yanci/app/modules/news/views/widgets/category_list.dart';
import 'package:yanci/app/modules/news/views/widgets/news_card.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/news_controller.dart';

class NewsView extends GetView<NewsController> {
  const NewsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 0,
        title: Text(
          StringConstants.marketNews,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CategoryList(),
            Obx(() {
              if (controller.selectedCategory.value == 0) {
                return Column(children: sampleNews.map((e) => NewsCard(news: e)).toList());
              }
              if (controller.selectedCategory.value == 1) {
                return Column(children: sampleNews.map((e) => NewsCard(news: e)).toList());
              }
              if (controller.selectedCategory.value == 2) {
                return Column(children: sampleNews.where((element) => element.category == StringConstants.gse).map((e) => NewsCard(news: e)).toList());
              } else {
                return Column(children: sampleNews.where((element) => element.category == StringConstants.africanFinancials).map((e) => NewsCard(news: e)).toList());
              }
            }),
          ],
        ),
      ),
    );
  }
}
