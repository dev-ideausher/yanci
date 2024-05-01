import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_style.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/views/screens/select_branch_screen.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class AddBankAccount extends StatelessWidget {
  const AddBankAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          StringConstants.chooseYourBank,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                cursorColor: context.kcPrimaryColor,
                decoration: StStyle.stInputDecoration(
                  constraints: BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
                  backGroundColor: context.whiteColor,
                  hint: StringConstants.searchByName,
                  isCompactPrefix: true,
                  suffixIcon: Assets.svg.search.svg(height: 20.kh),
                ),
              ),
              20.kheightBox,
              Text(
                StringConstants.popularBanks.toUpperCase(),
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
              ),
              20.kheightBox,
              ..._buildBankList(),
              20.kheightBox,
              Text(
                StringConstants.allBanks.toUpperCase(),
                style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
              ),
              20.kheightBox,
              ..._buildBankList(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildBankList() {
    return List.generate(
      5,
      (index) => InkWell(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () => Get.to(() => const SelectBranch()),
              child: Row(
                children: [
                  Assets.images.bankSample.image(height: 44.kh, width: 44.kw),
                  10.kwidthBox,
                  Text(
                    "CalBank",
                    style: TextStyleUtil.kText16_5(color: Get.context!.greyTextColor),
                  ),
                ],
              ),
            ),
            10.kheightBox,
          ],
        ),
      ),
    );
  }
}
