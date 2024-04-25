import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class LabelValuePair extends StatelessWidget {
  final String label;
  final String value;
  const LabelValuePair({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.kw,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: TextStyleUtil.kText13_4(
                fontWeight: FontWeight.w400,
                color: Get.context!.greyTextColor,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyleUtil.kText14_4(
              fontWeight: FontWeight.w600,
              color: Get.context!.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
