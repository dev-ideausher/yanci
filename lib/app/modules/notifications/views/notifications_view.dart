import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/notifications/views/screens/general_notifications.dart';
import 'package:yanci/app/modules/notifications/views/screens/market_updates.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/notifications_controller.dart';

class NotificationsView extends GetView<NotificationsController> {
  const NotificationsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.whiteColor,
        shadowColor: context.kWhitelight,
        elevation: 1,
        surfaceTintColor: context.whiteColor,
        title: Text(
          StringConstants.notifications,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
        bottom: PreferredSize(
          preferredSize: Size(double.maxFinite, 30.kh),
          child: TabBar(
            splashFactory: NoSplash.splashFactory,
            indicatorColor: context.kcPrimaryColor,
            labelStyle: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600, color: context.kcPrimaryColor),
            unselectedLabelStyle: TextStyleUtil.kText15_4(color: context.greyTextColor),
            indicatorSize: TabBarIndicatorSize.tab,
            controller: controller.tabController,
            tabs: const [
              Tab(text: StringConstants.general),
              Tab(text: StringConstants.marketUpdates),
            ],
          ),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          children: [
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  GeneralNotifications(),
                  MarketUpdates(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
