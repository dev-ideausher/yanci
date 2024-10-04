import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/components/sticky_bottom_bar.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/add_money/views/screens/choose_payment_methods.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/add_money_controller.dart';

class AddMoneyView extends GetView<AddMoneyController> {
  const AddMoneyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        shadowColor: context.kWhitelight,
        surfaceTintColor: context.whiteColor,
        title: Text(
          StringConstants.buyingPower1,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.kh),
        child: Column(
          children: [
            ListTile(
                title: Text(StringConstants.buyingPower, style: TextStyleUtil.kText14_4()),
                subtitle: Text("${StringConstants.ghanaCurrency} ${controller.balance.value}", style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700))),
            DefaultTabController(
              length: 2,
              child: TabBar(
                  onTap: (value) => controller.tabIndex.value = value,
                  dividerColor: Colors.transparent,
                  labelStyle: TextStyleUtil.kText14_4(color: context.kcPrimaryColor, fontWeight: FontWeight.w600),
                  labelColor: context.kcPrimaryColor,
                  indicatorColor: context.kcPrimaryColor,
                  isScrollable: false,
                  indicatorSize: TabBarIndicatorSize.tab,
                  tabs: [
                    const Tab(child: Text(StringConstants.addMoney)),
                    Tab(child: Text(StringConstants.cashOut)),
                  ]),
            ),
            40.kheightBox,
            DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: context.kcPrimaryColor.withOpacity(0.2),
              ),
              child: SizedBox(
                height: 40.kh,
                width: 135.kw,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 7.kh),
                  child: Row(
                    children: [
                      Text(
                        StringConstants.ghanaCurrency,
                        style: TextStyleUtil.kText19_6(color: context.kcPrimaryColor),
                      ),
                      5.kwidthBox,
                      SizedBox(
                        width: 65.kw,
                        child: TextFormField(
                          controller: controller.moneyController,
                          style: TextStyleUtil.kText19_6(color: context.greyTextColor),
                          cursorColor: context.kcPrimaryColor,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintStyle: TextStyleUtil.kText19_6(color: context.greyTextColor),
                            hintText: "0",
                            isDense: true,
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 2.kh),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /* 40.kheightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                100,
                1000,
                2000
              ].map((e) => moneyChips(amount: e, onTap: () => controller.addMoney(e))).toList(),
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: StickyBottomBar(
        child: BottomAppBar(
          padding: EdgeInsets.zero,
          surfaceTintColor: context.whiteColor,
          height: 136.kh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Divider(color: context.greyColor, height: 1),
              InkWell(
                onTap: () => Get.to(() => const ChoosePaymentMethodView()),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 10.kh, horizontal: 16.kw),
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
                            style: TextStyleUtil.kText16_5(color: context.greyTextColor),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Icon(
                        Icons.arrow_forward_ios_sharp,
                        color: context.greyTextColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              Divider(color: context.greyColor, height: 1),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.kh, horizontal: 16.kw),
                child: Obx(
                  () => CustomButton(
                    onTap: () => controller.addMoneyFromController(context),
                    title: controller.tabIndex.value == 0 ? StringConstants.addMoney : StringConstants.cashOut,
                    style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.whiteColor),
                    height: 48.kh,
                    borderRadius: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // chip widgets to add money
  Widget moneyChips({required num amount, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Get.context!.kcPrimaryColor.withOpacity(0.2),
        ),
        child: SizedBox(
          height: 33.kh,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.kw, vertical: 7.kh),
            child: Center(
              child: Text(
                "${StringConstants.ghanaCurrency} $amount",
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
