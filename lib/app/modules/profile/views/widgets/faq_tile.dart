import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class FaqTile extends StatelessWidget {
  final String title;
  final String child;
  const FaqTile({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent, splashColor: Colors.transparent),
      child: ExpansionTile(
        dense: true,
        tilePadding: EdgeInsets.symmetric(vertical: 10.kh),
        visualDensity: VisualDensity.compact,
        title: Text(
          title,
          style: TextStyleUtil.kText14_6(color: null),
        ),
        textColor: context.kcPrimaryColor,
        collapsedTextColor: context.blackColor,
        collapsedIconColor: context.blackColor,
        iconColor: context.kcPrimaryColor,
        children: [
          Text(
            child,
            style: TextStyleUtil.kText14_4(color: context.greyTextColor),
          ),
        ],
      ),
    );
  }
}
