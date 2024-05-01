import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/views/screens/verify_bank_account_scren.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class SelectBranch extends StatelessWidget {
  const SelectBranch({super.key});

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
                StringConstants.letsFindYourBranch,
                style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
              ),
              10.kheightBox,
              Text(
                StringConstants.yanciProtectsBankInfo,
                style: TextStyleUtil.kText13_4(color: context.greyTextColor),
              ),
              20.kheightBox,
              Row(
                children: [
                  Assets.images.bankSample.image(height: 44.kh, width: 44.kw),
                  10.kwidthBox,
                  Text(
                    "CalBank",
                    style: TextStyleUtil.kText16_5(),
                  ),
                ],
              ),
              20.kheightBox,
              TextField(
                cursorColor: context.kcPrimaryColor,
                decoration: StStyle.stInputDecoration(
                  constraints: BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
                  backGroundColor: context.whiteColor,
                  hint: StringConstants.searchByBranchName,
                  isCompactPrefix: true,
                  suffixIcon: Assets.svg.search.svg(height: 20.kh),
                ),
              ),
              20.kheightBox,
              ...List<Widget>.generate(
                5,
                (index) {
                  return Column(
                    children: [
                      InkWell(
                        onTap: () => Get.to(() => const VerifyBankAccount()),
                        child: Text(
                          "Lorem Ipsum as their default model text, and a search for 'lorem ipsum' ",
                          style: TextStyleUtil.kText13_4(color: context.greyTextColor),
                        ),
                      ),
                      20.kheightBox,
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
