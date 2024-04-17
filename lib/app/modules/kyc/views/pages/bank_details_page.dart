import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class BankDetailsPage extends StatelessWidget {
  const BankDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.provideBankDetails,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        5.kheightBox,
        Text(
          StringConstants.provideBankDetailsDescription,
          textAlign: TextAlign.center,
          style: TextStyleUtil.kText14_4(),
        ),
        40.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.accountnumber, color: context.redColor),
          hint: StringConstants.accountnumber,
          controller: kycController.accountNumberController,
          isObscure: true,
          obscuringCharacter: "•",
          textInputType: TextInputType.number,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.nameAsPerAcc, color: context.redColor),
          hint: StringConstants.nameAsPerAcc,
          controller: kycController.nameAsPerAccController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.swiftCode, color: context.redColor),
          hint: StringConstants.swiftCode,
          controller: kycController.swiftCodeController,
          isObscure: true,
          obscuringCharacter: "•",
          textInputType: TextInputType.number,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.branchName, color: context.redColor),
          hint: StringConstants.branchName,
          controller: kycController.branchNameController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.routingNumber, color: context.redColor),
          hint: StringConstants.routingNumber,
          controller: kycController.routingNumberController,
          isObscure: true,
          obscuringCharacter: "•",
          textInputType: TextInputType.number,
        ),
        20.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.verifyAcc(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
