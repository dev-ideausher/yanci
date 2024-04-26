import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_chip_list.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/orders/controllers/orders_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class AllOrdersScreen extends StatelessWidget {
  const AllOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<OrdersController>();
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => controller.isAllOrdersScreen.value = false,
        ),
        title: Text(
          StringConstants.allOrders,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomChipList(labels: controller.orderCategories, selectedIndex: controller.selectedOrder),
            Padding(
              padding: EdgeInsets.all(16.kh),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(StringConstants.sortBy, style: TextStyleUtil.kText16_5()),
                      Text(
                        StringConstants.currentlyInvested,
                        style: TextStyleUtil.kText14_4(),
                      ),
                    ],
                  ),
                  20.kheightBox,
                  Obx(() => Column(children: controller.ordersBasedOnCategory())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
