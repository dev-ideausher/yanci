import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/controllers/profile_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class NotificationsSettings extends StatelessWidget {
  const NotificationsSettings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 0,
        title: Text(
          StringConstants.notificationSettings,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(20.kh),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.generalNotifications,
                        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        StringConstants.generalNotificationsText,
                        style: TextStyleUtil.kText14_4(),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      Switch(
                        value: controller.generalNotificationValue.value,
                        onChanged: (val) => controller.generalNotificationValue.value = val,
                        activeTrackColor: const Color(0xff27AE60),
                        inactiveTrackColor: context.redColor,
                        inactiveThumbColor: context.whiteColor,
                        trackOutlineWidth: const MaterialStatePropertyAll(0),
                      ),
                      Text(
                        controller.generalNotificationValue.value ? StringConstants.on : StringConstants.off,
                        style: TextStyleUtil.kText14_4(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: context.disabledBorderColor),
            20.kheightBox,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.marketNotifications,
                        style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        StringConstants.generalNotificationsText,
                        style: TextStyleUtil.kText14_4(),
                      ),
                    ],
                  ),
                ),
                Obx(
                  () => Column(
                    children: [
                      Switch(
                        value: controller.marketNotificationValue.value,
                        onChanged: (val) => controller.marketNotificationValue.value = val,
                        activeTrackColor: const Color(0xff27AE60),
                        inactiveTrackColor: context.redColor,
                        inactiveThumbColor: context.whiteColor,
                        trackOutlineWidth: const MaterialStatePropertyAll(0),
                      ),
                      Text(
                        controller.marketNotificationValue.value ? StringConstants.on : StringConstants.off,
                        style: TextStyleUtil.kText14_4(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Divider(color: context.disabledBorderColor),
          ],
        ),
      ),
    );
  }
}
