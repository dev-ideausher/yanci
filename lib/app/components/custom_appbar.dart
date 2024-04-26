import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

AppBar customAppBar() => AppBar(
      surfaceTintColor: Get.context!.whiteColor,
      backgroundColor: Get.context!.whiteColor,
      shadowColor: Get.context!.disabledBorderColor,
      elevation: 1,
      title: Row(
        children: [
          Assets.images.yanciLogo.image(height: 26.kh, width: 30.kw),
          10.kwidthBox,
          Text(
            StringConstants.yanci,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
          )
        ],
      ),
      centerTitle: false,
      actions: [
        IconButton(onPressed: () => Get.toNamed(Routes.NOTIFICATIONS), icon: Assets.svg.notification.svg())
      ],
    );
