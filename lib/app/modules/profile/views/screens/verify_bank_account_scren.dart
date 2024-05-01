import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class VerifyBankAccount extends StatelessWidget {
  const VerifyBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConstants.verifyBankAcc,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              10.kheightBox,
              Text(
                StringConstants.yanciProtectsBankInfo,
                style: TextStyleUtil.kText13_4(color: context.greyTextColor),
              ),
              20.kheightBox,
              DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.kh),
                  border: Border.all(color: context.disabledBorderColor),
                ),
                child: SizedBox(
                  height: 180.kh,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0.kw, vertical: 16.kh),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Assets.images.bankSample.image(height: 44.kh, width: 44.kw),
                            10.kwidthBox,
                            Text(
                              "CalBank",
                              style: TextStyleUtil.kText16_5(),
                            ),
                            const Spacer(),
                            Text(
                              StringConstants.edit.toUpperCase(),
                              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: context.kcPrimaryColor),
                            ),
                          ],
                        ),
                        15.kheightBox,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.branchName.toUpperCase(),
                              style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                            ),
                            SizedBox(
                              width: 172.kw,
                              child: Text(
                                "Lorem Ipsum as their default model text, and a search for 'lorem ipsum' ",
                                style: TextStyleUtil.kText12_4(color: context.greyTextColor),
                              ),
                            ),
                          ],
                        ),
                        15.kheightBox,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.swiftCode.toUpperCase(),
                              style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                            ),
                            SizedBox(
                              width: 172.kw,
                              child: Text(
                                "XYZ68686908",
                                style: TextStyleUtil.kText12_4(color: context.greyTextColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              20.kheightBox,
              StTextField(
                hint: "Enter here",
                title: Text(
                  "Enter bank account number for James",
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                ),
                isObscure: true,
                obscuringCharacter: "•",
                controller: TextEditingController(),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 15,
        color: context.whiteColor,
        surfaceTintColor: context.whiteColor,
        shadowColor: context.blackColor,
        child: CustomButton(
          title: "Verify Bank",
          borderRadius: 50,
          height: 48,
          onTap: () => Get.until((route) => Get.currentRoute == "/BankDetails"),
        ),
      ),
    );
  }
}
