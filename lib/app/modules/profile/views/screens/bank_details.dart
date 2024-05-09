import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/views/screens/add_bank_account.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class BankDetails extends StatelessWidget {
  const BankDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          StringConstants.resetAcountDetails,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            children: [
              _buildBankDetails(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(20.kh),
        child: CustomButton.outline(
          onTap: () => Get.to(() => const AddBankAccount()),
          title: StringConstants.addAnotherBank,
          borderRadius: 50,
        ),
      ),
    );
  }

  Widget _buildBankDetails() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Assets.images.bankSample.image(height: 44.kh, width: 44.kw),
        10.kwidthBox,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "CalBank",
              style: TextStyleUtil.kText12_4(color: Get.context!.greyTextColor),
            ),
            Text(
              "XXXXXXX8899",
              style: TextStyleUtil.kText14_4(),
            ),
            Row(
              children: [
                Icon(Icons.done, color: Get.context!.kcPrimaryColor, size: 18.kh),
                Text(
                  "Verified",
                  style: TextStyleUtil.kText12_4(fontWeight: FontWeight.w500, color: Get.context!.kcPrimaryColor),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert, size: 24.kh),
          onPressed: () => Get.bottomSheet(
            DecoratedBox(
              decoration: BoxDecoration(color: Get.context!.whiteColor),
              child: SizedBox(
                height: 68.kh,
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0.kw, vertical: 22.kh),
                  child: Row(
                    children: [
                      Assets.svg.delete.svg(),
                      10.kwidthBox,
                      Text(
                        StringConstants.delete,
                        style: TextStyleUtil.kText16_5(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
