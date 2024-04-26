import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/components/custom_appbar.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/orders/views/screens/all_orders_screen.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/orders_controller.dart';

class OrdersView extends GetView<OrdersController> {
  const OrdersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isAllOrdersScreen.value
          ? const AllOrdersScreen()
          : Scaffold(
              appBar: customAppBar(),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16.kh),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringConstants.accountActivity,
                        style: TextStyleUtil.kText18_6(),
                      ),
                      20.kheightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            StringConstants.today,
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                          ),
                          TextButton(
                            onPressed: () => controller.isAllOrdersScreen.value = true,
                            child: Text(
                              StringConstants.allOrders,
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.kcPrimaryColor),
                            ),
                          ),
                        ],
                      ),
                      20.kheightBox,
                      ...controller.orders,
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
