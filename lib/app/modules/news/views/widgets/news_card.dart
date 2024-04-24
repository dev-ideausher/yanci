import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/data/models/news_model.dart';
import 'package:yanci/app/modules/news/views/screens/news_details_screen.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/formatter.dart';

class NewsCard extends StatelessWidget {
  final News news;
  const NewsCard({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 132.kh,
      child: Padding(
        padding: EdgeInsets.all(16.kh),
        child: InkWell(
          onTap: () => Get.to(() => NewsDetailScreen(news: news)),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(4.kh),
                child: CachedNetworkImage(
                  imageUrl: news.imageUrl,
                  height: 100.kh,
                  width: 100.kw,
                  fit: BoxFit.cover,
                ),
              ),
              10.kwidthBox,
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      news.title,
                      style: TextStyleUtil.kText15_4(fontWeight: FontWeight.w500),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
