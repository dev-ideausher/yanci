import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class NotificationsTile extends StatelessWidget {
  const NotificationsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          child: Text(
            "Nifty 50, Sensex on February 29: What to expect in trade today",
            style: TextStyleUtil.kText15_4(fontWeight: FontWeight.w500),
          ),
        ),
        10.kheightBox,
        Row(
          children: [
            Text(
              "an hour ago",
              style: TextStyleUtil.kText14_4(color: context.greyTextColor),
            ),
            10.kwidthBox,
            Text(
              "GSE",
              style: TextStyleUtil.kText14_4(color: context.kcPrimaryColor),
            ),
          ],
        ),
        Divider(
          color: context.disabledColor,
        ),
      ],
    );
  }
}
