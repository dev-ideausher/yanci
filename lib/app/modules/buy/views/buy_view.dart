import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_divider.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_radio_button.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../controllers/buy_controller.dart';

class BuyView extends GetView<BuyController> {
  const BuyView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ColoredBox(
            color: context.whiteColor,
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
                          color: context.disabledColor,
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
                          color: controller.stock.isProfit ? context.greenStockColor : context.redStockColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const StDivider(),
          ColoredBox(
            color: context.whiteColor,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.kw, vertical: 30.kh),
              child: Obx(
                () => Column(
                  children: [
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
                    Row(
                      children: [
                        Text(
                          StringConstants.quantity,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        SizedBox(
                          width: 100.kw,
                          height: 40.kh,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: context.kcPrimaryColor,
                            style: TextStyleUtil.kText14_4(),
                            decoration: StStyle.stInputDecoration(backGroundColor: context.whiteColor, hint: "").copyWith(contentPadding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 8.kh)),
                            textAlignVertical: TextAlignVertical.center,
                          ),
                        ),
                      ],
                    ),
                    20.kheightBox,
                    Row(
                      children: [
                        Text(
                          StringConstants.price,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: context.whiteColor,
                            border: Border.all(color: Get.context!.borderColor, width: 1.kh),
                            borderRadius: BorderRadius.circular(8.kh),
                          ),
                          child: SizedBox(
                            width: 100.kw,
                            height: 40.kh,
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.kh, horizontal: 10.kw),
                              child: Text(
                                "${StringConstants.ghanaCurrency} ${controller.stock.price}",
                                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    20.kheightBox,
                    Row(
                      children: [
                        Text(
                          StringConstants.estimatedCost,
                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        DecoratedBox(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(51, 201, 201, 201),
                            border: Border.all(color: Get.context!.borderColor, width: 1.kh),
                            borderRadius: BorderRadius.circular(8.kh),
                          ),
                          child: SizedBox(
                            width: 100.kw,
                            height: 40.kh,
                          ),
                        ),
                      ],
                    ),
                    10.kheightBox,
                    controller.isAdvanceOptionsEnabled.value
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              10.kheightBox,
                              Row(
                                children: [
                                  Text(
                                    StringConstants.timeInForce,
                                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 143.kw,
                                    height: 40.kh,
                                    child: StDropDown(
                                      dropdownMenuEntries: [
                                        DropdownMenuEntry(value: "labekl", label: "label")
                                      ],
                                      onSelected: (p0) {},
                                      isForm: false,
                                      width: 143,
                                    ),
                                  ),
                                ],
                              ),
                              10.kheightBox,
                            ],
                          )
                        : Column(
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
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: context.whiteColor,
        shadowColor: context.blackColor,
        height: 64.kh,
        elevation: 10,
        child: CustomButton(
          title: StringConstants.buy,
          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.whiteColor),
          height: 48.kh,
          width: 90.w,
          borderRadius: 50,
        ),
      ),
    );
  }
}
