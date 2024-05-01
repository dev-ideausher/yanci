import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class BlogDetail extends StatelessWidget {
  const BlogDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          StringConstants.blogsDetails,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () => Share.share("Blog"),
            icon: Assets.svg.share.svg(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.blog.image(),
            Padding(
              padding: EdgeInsets.all(16.kh),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "by Trade Brains | Mar 6, 2024",
                    style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                  ),
                  20.kheightBox,
                  Text(
                    "Understanding Gravestone Doji Pattern – How to Trade & Types",
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w700),
                  ),
                  20.kheightBox,
                  Text(
                    """Gravestone Doji Pattern: Candlestick patterns are the key technical tool for traders to understand price movements. The patterns formed on candlestick charts over a given time frame offer potential views on trend reversals, continuations, or indecision in the market. In this article, we will delve into the Gravestone Doji, exploring its meaning, characteristics, and strategies with the example of charts.""",
                    style: TextStyleUtil.kText14_4(color: context.greyTextColor),
                  ),
                  20.kheightBox,
                  Text(
                    "What is a Doji?",
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w800, color: context.greyTextColor),
                  ),
                  Text(
                    "The word Doji is derived from the Japanese word, meaning “the same thing”. The Doji is a candlestick pattern in which a candle’s open and close price is almost one and the same. Generally, the doji formation represents the indecision present,  a sign of trend reversal or continuation in the security.",
                    style: TextStyleUtil.kText14_4(color: context.greyTextColor),
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
