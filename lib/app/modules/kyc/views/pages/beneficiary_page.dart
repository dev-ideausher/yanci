import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class BeneficiaryPage extends StatelessWidget {
  const BeneficiaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.provideDetailsBeneficiary,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        5.kheightBox,
        Text(
          StringConstants.yanciWillNotContactBeneficiary,
          textAlign: TextAlign.center,
          style: TextStyleUtil.kText14_4(),
        ),
        40.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.fullName, color: context.redColor),
          hint: StringConstants.fullName,
          controller: kycController.beneficiaryNameController,
        ),
        20.kheightBox,
        StTextField(
          prefixIcon: CountryCodePicker(
            initialSelection: 'GH',
            hideMainText: false,
            flagWidth: 24.kw,
            textStyle: TextStyleUtil.kText16_5(
              fontWeight: FontWeight.w400,
              color: context.disabledColor,
            ),
          ),
          title: StRichText(text: StringConstants.phoneNumber, color: context.redColor),
          hint: StringConstants.phoneNumber,
          controller: kycController.beneficiaryPhoneNumberController,
          textInputType: TextInputType.phone,
          inputFormatters: [
            LengthLimitingTextInputFormatter(10)
          ],
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.address, color: context.redColor),
          hint: StringConstants.address,
          controller: kycController.beneficiaryAddress,
        ),
        180.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.nextPage(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
