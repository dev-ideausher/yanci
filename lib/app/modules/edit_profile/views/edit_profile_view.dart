import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../../gen/assets.gen.dart';
import '../../../components/custom_date_picker.dart';
import '../../../components/custom_dropdown.dart';
import '../../../components/custom_textfield.dart';
import '../../../constants/string_constants.dart';
import '../../../services/text_style_util.dart';
import '../../../utils/date_picker.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       // actions: [IconButton(onPressed: () => controller.updateProfile(), icon: Icon(Icons.save))],
      ),
      body: Obx(
          ()=>controller.isLoading.value? const Center(child: CircularProgressIndicator()): SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.kh).copyWith(top: 0),
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  StTextField(
                    title: Text(
                      StringConstants.firstName,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.firstName,
                    controller: controller.firstNameController,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.lastName,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.lastName,
                    controller: controller.lastNameController,
                  ),
                  20.kheightBox,
                  StDropDown(
                    value: controller.selectedGender,
                    title: Text(
                      StringConstants.gender,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    dropdownMenuEntries: controller.genders.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                    onSelected: (String val) => controller.selectedGender = val,
                  ),
                  20.kheightBox,
                  Obx(
                    () => StDatePicker(
                      isRequired: false,
                      date: controller.dateOfBirth.value,
                      onTap: () async => controller.dateOfBirth.value = await pickDate(controller.dateOfBirth.value) ?? controller.dateOfBirth.value,
                      title: StringConstants.dateOfBirth,
                    ),
                  ),
                  20.kheightBox,
                  StDropDown(
                    value: controller.selectedMaritalStatus,
                    title: Text(
                      StringConstants.maritalStatus,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    dropdownMenuEntries: controller.maritalStatus.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                    onSelected: (String val) => controller.selectedMaritalStatus = val,
                  ),
                  20.kheightBox,
                  StDropDown(
                    value: controller.selectedNationality,
                    title: Text(
                      StringConstants.nationality,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    dropdownMenuEntries: controller.nationality.map((e) => DropdownMenuEntry(value: e, label: e)).toList(),
                    onSelected: (String val) => controller.selectedNationality = val,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.placeOfBirth,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.placeOfBirth,
                    controller: controller.placeOfBirthController,
                  ),
                  20.kheightBox,
                  StTextField(
                    prefixIcon: CountryCodePicker(
                      initialSelection: controller.initialSelectionCountryCode.value,
                      hideMainText: false,
                      flagWidth: 24.kw,
                      onChanged: (kCode) => controller.initialSelectionCountryCode.value = kCode.toString(),
                      textStyle: TextStyleUtil.kText16_5(
                        fontWeight: FontWeight.w400,
                        color: context.disabledColor,
                      ),
                    ),
                    textInputType: TextInputType.phone,
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    title: Text(
                      StringConstants.phoneNumber,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.phoneNumber,
                    controller: controller.phoneNumberController,
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
                  StTextField(
                    title: Text(
                      StringConstants.country,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.addressHere,
                    controller: controller.countryController,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.stateOrRegion,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.addressHere,
                    controller: controller.stateController,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.city,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.addressHere,
                    controller: controller.cityController,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.streetaddress,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.addressHere,
                    controller: controller.streetController,
                  ),
                  20.kheightBox,
                  StTextField(
                    title: Text(
                      StringConstants.gpsAddress,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.addressHere,
                    controller: controller.gpsController,
                  ),
                  10.kheightBox,
                  Divider(color: context.disabledBorderColor),
                  10.kheightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        StringConstants.nomineeDetails,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                      ),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 12),
                    ],
                  ),
                  10.kheightBox,
                  Row(
                    children: [
                      Text(
                        StringConstants.kycForm,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                      ),
                      const Spacer(),
                      Text(
                        StringConstants.download,
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: context.kcPrimaryColor),
                      ),
                      5.kwidthBox,
                      InkWell( onTap: () =>controller.downloadKycForm(),child: Assets.svg.download.svg(height: 24.kh)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
