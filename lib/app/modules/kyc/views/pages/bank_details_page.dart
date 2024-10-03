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

import '../../../../utils/validation.dart';

class BankDetailsPage extends StatelessWidget {
  BankDetailsPage({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstants.bankDetails,
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
            validator: (value) => !isCommonText(value) ? StringConstants.invalidAccountNumber : null,
            textInputType: TextInputType.number,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.nameAsPerAcc, color: context.redColor),
            hint: StringConstants.nameAsPerAcc,
            textInputType: TextInputType.name,
            controller: kycController.nameAsPerAccController,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
            ],
            validator: (value) => !isCommonText(value) ? StringConstants.invalidFirstName : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.swiftCode, color: context.redColor),
            hint: StringConstants.swiftCode,
            controller: kycController.swiftCodeController,
            isObscure: true,
            obscuringCharacter: "•",
            validator: (value) => !isCommonText(value) ? StringConstants.invalidSwiftCode : null,
            textInputType: TextInputType.number,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.branchName, color: context.redColor),
            hint: StringConstants.branchName,
            controller: kycController.branchNameController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidBranchName : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.bankName, color: context.redColor),
            hint: StringConstants.bankName,
            controller: kycController.bankNameController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidBankName : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.routingNumber, color: context.redColor),
            hint: StringConstants.routingNumber,
            controller: kycController.routingNumberController,
            isObscure: true,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidRoutingNumber : null,
            obscuringCharacter: "•",
            textInputType: TextInputType.number,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.accountType, color: context.redColor),
            hint: StringConstants.accountType,
            controller: kycController.accountTypeCon,
            isObscure: true,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidAccountType : null,
            obscuringCharacter: "•",
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.bankCode, color: context.redColor),
            hint: StringConstants.bankCode,
            controller: kycController.accountBankCode,
            isObscure: true,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidBankCode : null,
            obscuringCharacter: "•",
          ),
          20.kheightBox,
          CustomButton(
            title: StringConstants.continueText,
            onTap: () => (_formKey.currentState!.validate()) ? kycController.nextPage() : null,
            borderRadius: 50,
          ),
        ],
      ),
    );
  }
}
