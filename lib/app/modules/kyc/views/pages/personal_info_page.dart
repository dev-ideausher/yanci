import 'dart:io';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_date_picker.dart';
import 'package:yanci/app/components/custom_dropdown.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/date_picker.dart';

import '../../../../utils/validation.dart';

class PersonalInfoPage extends StatelessWidget {
  PersonalInfoPage({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            StringConstants.personalInfo,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.userInfo,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          10.kheightBox,
          Obx(
            () => Container(
              height: 150.kh,
              width: 120.kh,
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.kh)), color: context.greyColor),
              child: kycController.passportPic?.value != null
                  ? SizedBox(
                      height: 150.kh,
                      width: 100.kh,
                      child: Image.file(
                        File(kycController.passportPic!.value!.path),
                        fit: BoxFit.fill,
                      ),
                    )
                  : InkWell(
                      onTap: () => kycController.getPassPortPic(context),
                      child: const Icon(Icons.camera_alt_outlined),
                    ),
            ),
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedTitle,
            title: StRichText(text: StringConstants.title, color: context.redColor),
            dropdownMenuEntries: kycController.titles.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedTitle = val,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.firstName, color: context.redColor),
            hint: StringConstants.firstName,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidFirstName : null,
            controller: kycController.firstNameController,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.lastName, color: context.redColor),
            hint: StringConstants.lastName,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidLastName : null,
            controller: kycController.lastNameController,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedGender,
            title: StRichText(text: StringConstants.gender, color: context.redColor),
            dropdownMenuEntries: kycController.genders.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedGender = val,
          ),
          20.kheightBox,
          Obx(
            () => StDatePicker(
              date: kycController.dateOfBirth.value,
              onTap: () async => kycController.dateOfBirth.value = await pickDate(kycController.dateOfBirth.value) ?? kycController.dateOfBirth.value,
              title: StringConstants.dateOfBirth,
            ),
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedMaritalStatus,
            title: StRichText(text: StringConstants.maritalStatus, color: context.redColor),
            dropdownMenuEntries: kycController.maritalStatus.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedMaritalStatus = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedResidentialStatus,
            title: StRichText(text: StringConstants.residentialStatus, color: context.redColor),
            dropdownMenuEntries: kycController.residentialStatuss.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedResidentialStatus = val,
          ),
          20.kheightBox,
          StDropDown(
            value: kycController.selectedCountry,
            title: StRichText(text: StringConstants.countryOfBirth, color: context.redColor),
            dropdownMenuEntries: kycController.countries.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
            onSelected: (String val) => kycController.selectedCountry = val,
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
            textInputType: TextInputType.phone,
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            title: StRichText(text: StringConstants.phoneNumber, color: context.redColor),
            hint: StringConstants.phoneNumber,
            controller: kycController.phoneNumberController,
            validator: (value) => !isValidPhone(value, isRequired: true) ? StringConstants.validPhone : null,
            suffixIcon: TextButton(
              child: Text(
                StringConstants.verify,
                style: TextStyleUtil.kText12_4(
                  fontWeight: FontWeight.w600,
                  color: context.kcPrimaryColor,
                ),
              ),
              onPressed: () {},
            ),
          ),
          20.kheightBox,
          SizedBox(
            width: double.infinity,
            child: Text(
              StringConstants.currentResidentialAddress,
              textAlign: TextAlign.left,
              style: TextStyleUtil.kText16_5(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.country, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.countryController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidCountry : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.stateOrRegion, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.stateController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidState : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.city, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.cityController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidCity : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.streetaddress, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.streetController,
            validator: (value) => !isCommonText(value) ? StringConstants.invalidStreet : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.gpsAddress, color: context.redColor),
            hint: StringConstants.addressHere,
            controller: kycController.gpsController,
            textInputType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            validator: (value) => !isCommonText(value) ? StringConstants.invalidGps : null,
          ),
          20.kheightBox,
          StTextField(
            title: StRichText(text: StringConstants.referralCode, color: context.redColor),
            hint: StringConstants.writeCodeHere,
            controller: kycController.referralCodeController,
            textInputType: const TextInputType.numberWithOptions(decimal: true, signed: true),
            validator: (value) => !isCommonText(value) ? StringConstants.writeCodeHere : null,
          ),
          20.kheightBox,
          CustomButton(
            title: StringConstants.continueText,
            onTap: () => (formKey.currentState!.validate()) ? kycController.nextPage() : null,
            borderRadius: 50,
          ),
        ],
      ),
    );
  }
}
