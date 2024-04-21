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
        StDropDown(
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
          title: StRichText(text: StringConstants.maritalStatus, color: context.redColor),
          dropdownMenuEntries: kycController.maritalStatus.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedMaritalStatus = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.nationality, color: context.redColor),
          dropdownMenuEntries: kycController.nationality.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedNationality = val,
        ),
        20.kheightBox,
        StDropDown(
          title: StRichText(text: StringConstants.countryOfBirth, color: context.redColor),
          dropdownMenuEntries: kycController.countries.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
          onSelected: (String val) => kycController.selectedCountry = val,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.placeOfBirth, color: context.redColor),
          hint: StringConstants.placeOfBirth,
          controller: kycController.placeOfBirthController,
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
          inputFormatters: [
            LengthLimitingTextInputFormatter(10)
          ],
          title: StRichText(text: StringConstants.phoneNumber, color: context.redColor),
          hint: StringConstants.phoneNumber,
          controller: kycController.phoneNumberController,
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
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.stateOrRegion, color: context.redColor),
          hint: StringConstants.addressHere,
          controller: kycController.stateController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.city, color: context.redColor),
          hint: StringConstants.addressHere,
          controller: kycController.cityController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.streetaddress, color: context.redColor),
          hint: StringConstants.addressHere,
          controller: kycController.streetController,
        ),
        20.kheightBox,
        StTextField(
          title: StRichText(text: StringConstants.gpsAddress, color: context.redColor),
          hint: StringConstants.addressHere,
          controller: kycController.gpsController,
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
