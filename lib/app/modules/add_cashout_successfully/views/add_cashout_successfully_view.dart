import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../../generated/assets.dart';
import '../../../constants/string_constants.dart';
import '../../../services/custom_button.dart';
import '../../../services/text_style_util.dart';
import '../controllers/add_cashout_successfully_controller.dart';

class AddCashoutSuccessfullyView extends GetView<AddCashoutSuccessfullyController> {
  const AddCashoutSuccessfullyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.kh),
        child: Center(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LottieBuilder.asset(Assets.lottiefilesSuccessful, repeat: true),
                20.kheightBox,
                Text(controller.payModel.value.payType == StringConstants.addMoney ? StringConstants.moneyAddedSuccessfully : StringConstants.cashoutSuccessful,
                    textAlign: TextAlign.center, style: TextStyleUtil.kText20_6()),
                20.kheightBox,
                SizedBox(
                  width: 100.kw,
                  child: moneyChips(
                    amount: 100,
                    onTap: () {},
                  ),
                ),
                40.kheightBox,
                Text(StringConstants.transactionDetails, textAlign: TextAlign.center, style: TextStyleUtil.kText20_6()),
                20.kheightBox,
                Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: context.kGreyBack)),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(StringConstants.transactionId, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.blackColor)),
                          trailing: Text("#${(controller.payModel.value.transactionId)?.substring(0, 8)}",
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor)),
                        ),
                        Divider(color: context.kWhitelight),
                        ListTile(
                          title: Text(StringConstants.debitedFrom, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.blackColor)),
                          trailing: Text("xxxxxxxxxxx1546", style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor)),
                        ),
                        Divider(color: context.kWhitelight),
                        ListTile(
                          title: Text(StringConstants.amount, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.blackColor)),
                          trailing: Text("GHC ${controller.payModel.value.amount}",
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.greyTextColor)),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        color: Colors.white,
        child: CustomButton(
          title: StringConstants.continueText,
          onTap: () => controller.goToHome(),
          borderRadius: 50,
        ).paddingOnly(bottom: 40.kh, left: 20.kw, right: 20.kw),
      ),
    );
  }

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
