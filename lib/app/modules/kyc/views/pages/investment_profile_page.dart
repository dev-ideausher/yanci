import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

import '../../../../utils/validation.dart';

class InvestmentProfilePage extends StatelessWidget {
  InvestmentProfilePage({super.key});

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
            StringConstants.investmentProfile,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.clientInvestmentProfile,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.kheightBox,
          StDropDown(
            value: kycController.selectedObj,
            title: StRichText(text: StringConstants.investmentObjective, color: context.redColor),
            dropdownMenuEntries: kycController.investObj.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedObj = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedRisk,
            title: StRichText(text: StringConstants.riskTolerance, color: context.redColor),
            dropdownMenuEntries: kycController.riskTolerance.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedRisk = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedHorizon,
            title: StRichText(text: StringConstants.investmentHorizon, color: context.redColor),
            dropdownMenuEntries: kycController.investHorizon.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedHorizon = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedKnowledge,
            title: StRichText(text: StringConstants.investmentKnowledge, color: context.redColor),
            dropdownMenuEntries: kycController.investmentKnowledge.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedKnowledge = val,
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.expectedAccountActivity,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.kheightBox,
          StDropDown(
            value: kycController.selectedSource,
            title: StRichText(text: StringConstants.sourceOfFunds, color: context.redColor),
            dropdownMenuEntries: kycController.sourceOfFunds.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedSource = val,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.initialInvestmentAmount, color: context.redColor),
            hint: StringConstants.initialInvestmentAmount,
            textInputType: TextInputType.number,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 16.0.kh, left: 8.0.kw, right: 8.0.kw),
              child: Text(StringConstants.ghc, style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            ),
            controller: kycController.initialInvestmentAmountController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidInvestmentAmount : null,
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(StringConstants.anticipatedAccountActivity, textAlign: TextAlign.left, style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600)),
          ),
          10.kheightBox,
          StDropDown(
            value: kycController.selectedTopUps,
            title: StRichText(text: StringConstants.topUps, color: context.redColor),
            dropdownMenuEntries: kycController.topUps.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedTopUps = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedWithdrawal,
            title: StRichText(text: StringConstants.withdrawals, color: context.redColor),
            dropdownMenuEntries: kycController.withdrawals.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedWithdrawal = val,
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.anticipatedInvestmentAmount,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.regualrTopUpAmount, color: context.redColor),
            hint: StringConstants.regualrTopUpAmount,
            textInputType: TextInputType.number,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 16.0.kh, left: 8.0.kw, right: 8.0.kw),
              child: Text(StringConstants.ghc, style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            ),
            controller: kycController.topupController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidRegualrTopUpAmount : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.regualrWithdrawalAmount, color: context.redColor),
            hint: StringConstants.regualrWithdrawalAmount,
            textInputType: TextInputType.number,
            prefixIcon: Padding(
              padding: EdgeInsets.only(top: 16.0.kh, left: 8.0.kw, right: 8.0.kw),
              child: Text(StringConstants.ghc, style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500)),
            ),
            controller: kycController.regualWithdrawalController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidRegualrWithdrawalAmount : null,
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.clientAdditionalInfo,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.kheightBox,
          StDropDown(
            value: kycController.selectedInfo,
            title: StRichText(text: StringConstants.clientAdditionalInfoText, color: context.redColor),
            dropdownMenuEntries: kycController.additionalInfo.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedInfo = val,
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
