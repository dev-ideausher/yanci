import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/news_model.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yanci/app/utils/formatter.dart';

class NewsDetailScreen extends StatelessWidget {
  final News news;
  const NewsDetailScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 0,
        title: Text(
          StringConstants.newsDetails,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            onPressed: () => Share.share("share"),
            icon: const Icon(Icons.share),
          ),
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: news.imageUrl,
              width: 100.w,
              fit: BoxFit.fitWidth,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.kw).copyWith(top: 16.kh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    children: [
                      Text(
                        getTimeAgo(news.postedDate),
                        style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                      ),
                      10.kwidthBox,
                      Text(
                        news.category,
                        style: TextStyleUtil.kText14_4(color: context.kcPrimaryColor),
                      ),
                    ],
                  ),
                  10.kheightBox,
                  Text(
                    news.title,
                    style: TextStyleUtil.kText16_7(),
                  ),
                  20.kheightBox,
                  Text(
                    news.description,
                    style: TextStyleUtil.kText14_4(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
