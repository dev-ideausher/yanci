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

class PersonalInfoPage extends StatelessWidget {
  const PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.personalInfo,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.firstName, color: context.redColor),
          hint: StringConstants.firstName,
          controller: kycController.firstNameController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.lastName, color: context.redColor),
          hint: StringConstants.lastName,
          controller: kycController.lastNameController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.placeOfBirth, color: context.redColor),
          hint: StringConstants.placeOfBirth,
          controller: kycController.placeOfBirthController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.phoneNumber, color: context.redColor),
          hint: StringConstants.phoneNumber,
          controller: kycController.phoneNumberController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.resdAddress1, color: context.redColor),
          hint: StringConstants.resdAddress1,
          controller: kycController.resdAddress1Controller,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.resdAddress2, color: context.disabledColor, text2: "(optional)"),
          hint: StringConstants.resdAddress2,
          controller: kycController.resdAddress2Controller,
        ),
        20.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.nextPage(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
