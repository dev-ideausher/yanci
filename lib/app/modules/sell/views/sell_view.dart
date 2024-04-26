import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yanci/app/components/custom_divider.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_radio_button.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/components/sticky_bottom_bar.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/sell/views/screens/sell_confirmation_screen.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/sell_controller.dart';

class SellView extends GetView<SellController> {
  const SellView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: context.kWhitelight,
      appBar: AppBar(
        shadowColor: context.kWhitelight,
        elevation: 2,
        surfaceTintColor: context.whiteColor,
        title: Text(
          controller.stock.stockName,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => DialogHelper.showGlossary(),
          ),
          16.kwidthBox,
        ],
        centerTitle: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          stockInfo(),
          const StDivider(),
          ColoredBox(
            color: context.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 30.kh),
              child: Obx(
                () => Column(
                  children: [
                    // Radio buttons
                    Row(
                      children: [
                        StRadioButton(
                          value: 0,
                          groupValue: controller.radioValue.value,
                          title: StringConstants.limitOrder,
                          onChanged: controller.changeRadioValue,
                        ),
                        20.kwidthBox,
                        StRadioButton(
                          value: 1,
                          groupValue: controller.radioValue.value,
                          title: StringConstants.marketOrder,
                          onChanged: controller.changeRadioValue,
                        ),
                      ],
                    ),
                    20.kheightBox,

                    // Quantity field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.quantity,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          width: 110.kw,
                          height: 40.kh,
                          child: TextField(
                            onChanged: (value) => controller.addQuantity(value),
                            controller: controller.quantityController,
                            keyboardType: TextInputType.number,
                            cursorColor: context.kcPrimaryColor,
                            style: TextStyleUtil.kText15_4(fontWeight: FontWeight.w600),
                            decoration: StStyle.stInputDecoration(
                              backGroundColor: controller.quantity.value == 0
                                  ? context.whiteColor
                                  : controller.availQuantity.value < controller.quantity.value
                                      ? context.errorRedColor.withOpacity(0.1)
                                      : context.successGreenColor.withOpacity(0.15),
                              hint: "0",
                              hintStyle: TextStyleUtil.kText15_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
                              hintColor: context.greyTextColor,
                            ).copyWith(contentPadding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 8.kh)),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "${StringConstants.avialableQt} = ${controller.availQuantity.value}",
                        style: TextStyleUtil.kText10_4(fontWeight: FontWeight.w500),
                      ),
                    ),
                    20.kheightBox,

                    // price of per stock
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.price,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: controller.radioValue.value == 0 ? context.whiteColor : const Color.fromARGB(255, 238, 238, 238),
                            border: Border.all(color: controller.radioValue.value == 0 ? Get.context!.borderColor : Get.context!.disabledBorderColor, width: 1.kh),
                            borderRadius: BorderRadius.circular(8.kh),
                          ),
                          child: SizedBox(
                            width: 110.kw,
                            height: 40.kh,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.kh, horizontal: 7.kw),
                              child: Text(
                                controller.radioValue.value == 0 ? "${StringConstants.ghanaCurrency} ${controller.stock.price}" : StringConstants.atMarket,
                                style: controller.radioValue.value == 0
                                    ? TextStyleUtil.kText15_4(fontWeight: FontWeight.w600)
                                    : TextStyleUtil.kText14_4(
                                        fontWeight: FontWeight.w500,
                                        color: context.greyTextColor,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.kheightBox,

                    // estimated price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.estimatedCost,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 238, 238),
                            border: Border.all(color: Get.context!.disabledBorderColor, width: 1.kh),
                            borderRadius: BorderRadius.circular(8.kh),
                          ),
                          child: SizedBox(
                            width: 130.kw,
                            height: 40.kh,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.kh, horizontal: 7.kw),
                              child: Text(
                                "${StringConstants.ghanaCurrency} ${controller.estimatedPrice.value}",
                                style: TextStyleUtil.kText15_4(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.kheightBox,

                    // stoploss
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.stopLoss,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: controller.radioValue.value == 0 ? context.whiteColor : const Color.fromARGB(255, 238, 238, 238),
                            border: Border.all(color: controller.radioValue.value == 0 ? Get.context!.borderColor : Get.context!.disabledBorderColor, width: 1.kh),
                            borderRadius: BorderRadius.circular(8.kh),
                          ),
                          child: SizedBox(
                            width: 110.kw,
                            height: 40.kh,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.kh, horizontal: 7.kw),
                              child: Text(
                                controller.radioValue.value == 0 ? "${StringConstants.ghanaCurrency} ${controller.stock.price}" : StringConstants.atMarket,
                                style: controller.radioValue.value == 0
                                    ? TextStyleUtil.kText15_4(fontWeight: FontWeight.w600)
                                    : TextStyleUtil.kText14_4(
                                        fontWeight: FontWeight.w500,
                                        color: context.greyTextColor,
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    7.kheightBox,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        StringConstants.removeStoploss,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: context.kcPrimaryColor),
                      ),
                    ),
                    20.kheightBox,

                    // advanced options
                    controller.isAdvanceOptionsEnabled.value
                        ?
                        // time in force
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.kheightBox,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    StringConstants.timeInForce,
                                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                                  ),
                                  controller.radioValue.value == 0
                                      ? SizedBox(
                                          width: 150.kw,
                                          height: 40.kh,
                                          child: StDropDown(
                                            dropdownMenuEntries: const [
                                              DropdownMenuEntry(value: StringConstants.dayOrder, label: StringConstants.dayOrder),
                                              DropdownMenuEntry(value: StringConstants.goodTillCancelled, label: StringConstants.goodTillCancelled),
                                              DropdownMenuEntry(value: StringConstants.goodTillDate, label: StringConstants.goodTillDate),
                                            ],
                                            onSelected: controller.selectTIF,
                                            isForm: false,
                                            width: 155,
                                          ),
                                        )
                                      : DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(255, 238, 238, 238),
                                            border: Border.all(color: Get.context!.disabledBorderColor, width: 1.kh),
                                            borderRadius: BorderRadius.circular(8.kh),
                                          ),
                                          child: SizedBox(
                                            width: 150.kw,
                                            height: 40.kh,
                                            child: Padding(
                                              padding: EdgeInsets.all(10.kh),
                                              child: Text(
                                                StringConstants.dayOrder,
                                                style: TextStyleUtil.kText14_4(
                                                  fontWeight: FontWeight.w500,
                                                  color: context.greyTextColor,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                ],
                              ),
                              10.kheightBox,
                            ],
                          )
                        :
                        // advanced option text button
                        Column(
                            children: [
                              Text(
                                StringConstants.limitOrderfor30Days,
                                style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w500),
                              ),
                              TextButton(
                                onPressed: () => controller.toggleAdvancedOptions(),
                                child: Text(
                                  StringConstants.advanceOption,
                                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: context.kcPrimaryColor),
                                ),
                              ),
                            ],
                          ),

                    // date picker
                    controller.isAdvanceOptionsEnabled.value
                        ? Align(
                            alignment: Alignment.centerRight,
                            child: controller.selectedTimeInForce.value == StringConstants.goodTillDate
                                ?

                                // enabled date picker
                                InkWell(
                                    onTap: () => controller.changeGoodTillDate(),
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: context.whiteColor,
                                        border: Border.all(color: Get.context!.disabledColor, width: 1.kh),
                                        borderRadius: BorderRadius.circular(8.kh),
                                      ),
                                      child: SizedBox(
                                        width: 150.kw,
                                        height: 40.kh,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.kh),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat('dd-MM-yyyy').format(controller.goodTillDate.value),
                                                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                                              ),
                                              const Icon(Icons.calendar_month_outlined, size: 18),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                :
                                // disabled date picker
                                DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 238, 238, 238),
                                      border: Border.all(color: Get.context!.disabledBorderColor, width: 1.kh),
                                      borderRadius: BorderRadius.circular(8.kh),
                                    ),
                                    child: SizedBox(
                                      width: 150.kw,
                                      height: 40.kh,
                                      child: Padding(
                                        padding: EdgeInsets.all(10.kh),
                                        child: Text(
                                          DateFormat('dd-MM-yyyy').format(
                                            controller.selectedTimeInForce.value == StringConstants.dayOrder
                                                ? DateTime.now()
                                                : DateTime.now().add(
                                                    const Duration(days: 30),
                                                  ),
                                          ),
                                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor),
                                        ),
                                      ),
                                    ),
                                  ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // bottom nav bar
      bottomNavigationBar: StickyBottomBar(
        child: BottomAppBar(
          padding: EdgeInsets.symmetric(horizontal: 15.kw, vertical: 5.kh),
          surfaceTintColor: context.whiteColor,
          shadowColor: context.blackColor,
          height: 64.kh,
          elevation: 10,
          child: CustomButton(
            color: context.orangeColor,
            onTap: () => DialogHelper.showBuyDialog(
              buttonText1: StringConstants.sell.toUpperCase(),
              buttoncolor: context.orangeColor,
              height: 160,
              title: StringConstants.proceedToSell,
              description: StringConstants.proceedToSellText,
              onTap: () => Get.to(() => const SellConfirmationScreen()),
            ),
            title: StringConstants.sell.toUpperCase(),
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.whiteColor),
            height: 48.kh,
            borderRadius: 50,
          ),
        ),
      ),
    );
  }

  Widget stockInfo() {
    return ColoredBox(
      color: Get.context!.whiteColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 30.kh),
        child: Row(
          children: [
            CircleAvatar(
              radius: 20.kh,
              backgroundImage: CachedNetworkImageProvider(
                controller.stock.imageUrl,
              ),
            ),
            10.kwidthBox,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.stock.stockName,
                  style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  controller.stock.fullName,
                  style: TextStyleUtil.kText12_4(
                    fontWeight: FontWeight.w500,
                    color: Get.context!.disabledColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${StringConstants.ghanaCurrency} ${controller.stock.price}",
                  style: TextStyleUtil.kText16_5(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  controller.stock.isProfit ? "+${controller.stock.percentage}(+${controller.stock.percentage}%)" : "-${controller.stock.percentage}(-${controller.stock.percentage}%)",
                  style: TextStyleUtil.kText12_4(
                    fontWeight: FontWeight.w500,
                    color: controller.stock.isProfit ? Get.context!.greenStockColor : Get.context!.redStockColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
