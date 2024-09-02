import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

class BeneficiaryPage extends StatelessWidget {
  BeneficiaryPage({super.key});

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
            StringConstants.beneficiaryInfo,
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
            validator: (value) => !isCommonText(value) ? StringConstants.invalidFullName : null,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedRelation,
            title: StRichText(text: StringConstants.relationshipToAccHolder, color: context.redColor),
            dropdownMenuEntries: kycController.relationToAccHolder.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedRelation = val,
          ),
          20.kheightBox,
          StTextField(
            prefixIcon: CountryCodePicker(
              initialSelection:kycController.initialSelectionCountryCode.value,
              hideMainText: false,
              flagWidth: 24.kw,
              onChanged: (kCode) => kycController.initialSelectionCountryCode.value = kCode.toString(),
              textStyle: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w400,
                color: context.disabledColor,
              ),
            ),
            title: StRichText(text: StringConstants.phoneNumber, color: context.redColor),
            hint: StringConstants.phoneNumber,
            controller: kycController.beneficiaryPhoneNumberController,
            textInputType: TextInputType.phone,
            validator: (value) => !isValidPhone(value, isRequired: true) ? StringConstants.validPhone : null,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.country, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.beneficiaryCountryController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidCountry : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.stateOrRegion, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.beneficiaryStateController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidState : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.city, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.beneficiaryCityController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidCity : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.streetaddress, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.beneficiaryStreetController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidAddress : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.gpsAddress, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.beneficiaryGpsController,
            textInputType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            validator: (value) => !isCommonText(value) ? StringConstants.invalidGps : null,
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
