import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yanci/app/components/sticky_bottom_bar.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/sell/controllers/sell_controller.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final sellController = Get.find<SellController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: context.whiteColor,
      appBar: AppBar(
        backgroundColor: context.whiteColor,
        shadowColor: context.kWhitelight,
        elevation: 1,
        surfaceTintColor: context.whiteColor,
        title: Text(
          StringConstants.orderDetails,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.lottiefiles.successful.lottie(height: 60.kh, width: 54.kw),
              5.kheightBox,
              RichText(
                text: TextSpan(
                  text: "0/1 ",
                  style: TextStyleUtil.kText20_6(),
                  children: [
                    TextSpan(
                      text: StringConstants.shares,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: context.greyTextColor),
                    ),
                  ],
                ),
              ),
              30.kheightBox,
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.kh,
                    backgroundImage: CachedNetworkImageProvider(
                      sellController.stock.imageUrl,
                    ),
                  ),
                  10.kwidthBox,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        sellController.stock.stockName,
                        style: TextStyleUtil.kText16_5(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        sellController.stock.fullName,
                        style: TextStyleUtil.kText12_4(
                          fontWeight: FontWeight.w500,
                          color: context.disabledColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20.kh,
                  )
                ],
              ),
              30.kheightBox,
              Padding(
                padding: EdgeInsets.only(left: 10.kw),
                child: Divider(
                  color: context.borderColor,
                ),
              ),
              buildStockInfo(StringConstants.orderType, sellController.radioValue.value == 0 ? StringConstants.limitOrder : StringConstants.marketOrder),
              buildStockInfo(StringConstants.noOfShares, sellController.quantity.value.toString()),
              buildStockInfo(StringConstants.price, "${StringConstants.ghanaCurrency} ${sellController.stock.price}"),
              buildStockInfo(StringConstants.estimatedCost, "${StringConstants.ghanaCurrency} ${sellController.estimatedPrice.value}"),
              Padding(
                padding: EdgeInsets.only(left: 10.kw),
                child: Divider(
                  color: context.borderColor,
                ),
              ),
              20.kheightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    StringConstants.orderStatus,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Text(
                    StringConstants.open,
                    style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
                  ),
                  5.kwidthBox,
                  Icon(CupertinoIcons.clock_fill, color: context.yellowColor, size: 20.kh)
                ],
              ),
              15.kheightBox,
              customStepper(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: StickyBottomBar(
        child: BottomAppBar(
          surfaceTintColor: context.whiteColor,
          shadowColor: context.blackColor,
          elevation: 8,
          color: context.whiteColor,
          padding: EdgeInsets.all(10.kh),
          height: 70.kh,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButton.outline(
                onTap: () => Get.offAllNamed(Routes.HOME),
                title: StringConstants.cancel,
                height: 48.kh,
                width: 46.5.w,
                borderRadius: 50,
              ),
              CustomButton(
                width: 46.5.w,
                onTap: () => DialogHelper.showBuyDialog(
                  title: StringConstants.modifyOrder,
                  description: StringConstants.modifyOrderText,
                  onTap: () {
                    sellController.isOrderModified.value = true;
                    Get.back();
                  },
                  height: 220,
                  buttonText1: StringConstants.modify,
                ),
                title: StringConstants.modify,
                height: 48.kh,
                borderRadius: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStockInfo(String title, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.kh),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600)),
          Text(
            value,
            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }

  Widget customStepper() {
    final sellController = Get.find<SellController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Assets.svg.doneGrey.svg(),
            Text(
              StringConstants.orderReceived,
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Text(
              StringConstants.copyYanciOrderId,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.kw, right: 12.kw, top: 5.kh, bottom: 5.kh),
              child: ColoredBox(
                color: Get.context!.disabledBorderColor,
                child: SizedBox(
                  height: 50.kh,
                  width: 1,
                ),
              ),
            ),
            Text(
              DateFormat('dd MMM, yyyy').format(DateTime.now()).toUpperCase(),
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400, color: Get.context!.greyTextColor),
            ),
          ],
        ),
        Row(
          children: [
            Assets.svg.clock.svg(),
            Text(
              StringConstants.orderPending,
              style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        Obx(
          () => sellController.selectedTimeInForce.value == StringConstants.dayOrder
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 12.kw, right: 12.kw, top: 5.kh, bottom: 5.kh),
                      child: ColoredBox(
                        color: Get.context!.disabledBorderColor,
                        child: SizedBox(
                          height: 42.kh,
                          width: 1,
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sellController.isOrderModified.value ? Assets.svg.cancel.svg() : Assets.svg.doneGreen.svg(),
                        Text(
                          sellController.isOrderModified.value ? StringConstants.orderCancelled : StringConstants.orderExecuted,
                          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
