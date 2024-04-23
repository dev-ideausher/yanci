import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class ChoosePaymentMethodView extends StatelessWidget {
  const ChoosePaymentMethodView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: context.kWhitelight,
        surfaceTintColor: context.whiteColor,
        title: Text(
          StringConstants.choosePaymentMethods,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.kw),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConstants.bankTransfer,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            ),
            10.kheightBox,
            for (var i = 0; i < 4; i++) bankOptions(),
            Divider(color: Get.context!.greyColor, height: 1),
            30.kheightBox,
            Text(
              StringConstants.otherOptions,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            ),
            10.kheightBox,
            for (var i = 0; i < 3; i++) bankOptions(),
            Divider(color: Get.context!.greyColor, height: 1),
          ],
        ),
      ),
    );
  }

  Widget bankOptions() {
    return Column(
      children: [
        Divider(color: Get.context!.greyColor, height: 1),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 16.kh,
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 22.kh,
                  backgroundImage: Assets.images.payfast.provider(),
                ),
                8.kwidthBox,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "PayFast",
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "ABSA BANK - XX0320",
                      style: TextStyleUtil.kText16_5(color: Get.context!.greyTextColor),
                    ),
                  ],
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Get.context!.greyTextColor,
                  size: 15,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
