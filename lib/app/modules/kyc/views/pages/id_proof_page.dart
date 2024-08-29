import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/modules/kyc/views/card/image_card.dart';
import 'package:yanci/app/modules/kyc/views/take_id_picture_view.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../../../../components/custom_date_picker.dart';
import '../../../../components/custom_required_rich_text.dart';
import '../../../../components/custom_textfield.dart';
import '../../../../utils/date_picker.dart';
import '../../../../utils/validation.dart';

class IdProofPage extends StatelessWidget {
  IdProofPage({super.key});

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
            StringConstants.uploadIdProof,
            style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
          ),
          20.kheightBox,
          Obx(
            () => kycController.isIdImageSelected.value
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        StringConstants.idSuccesfullyCaptured,
                        textAlign: TextAlign.center,
                        style: TextStyleUtil.kText14_4(),
                      ),
                      20.kheightBox,
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.kh),
                        child: SizedBox(
                          width: double.infinity,
                          height: 204.kh,
                          child: Image.file(
                            File(kycController.idImage!.value!.path),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      20.kheightBox,
                      CustomButton.outline(
                        title: StringConstants.change,
                        onTap: () => Get.to(() => const TakeIdPictureView()),
                        borderRadius: 50,
                      ),
                      190.kheightBox,
                      CustomButton(
                        title: StringConstants.saveAndContinue,
                        onTap: () => kycController.verifyId(),
                        borderRadius: 50,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTitle(),
                      /* 20.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: StTextField(
                        title: StRichText(
                            text: isGhanaian(kycController.selectedResidentialStatus.value)
                                ? "${StringConstants.ghanaCard} ${StringConstants.ghanaCardNumber}"
                                : StringConstants.passport,
                            color: context.redColor),
                        hint: isGhanaian(kycController.selectedResidentialStatus.value) ? StringConstants.ghanaCardNumber : StringConstants.passport,
                        controller: kycController.ghanaCardNumberController,
                        textInputType: TextInputType.number,
                        validator: (value) => !isCommonText(value) ? StringConstants.invalidGhanaCardNumber : null,
                      ),
                    ),
                    10.kwidthBox,
                    Expanded(
                      child: StDatePicker(
                        height: 40.kh,
                        date: kycController.cardStartDate.value,
                        onTap: () async =>
                        kycController.cardStartDate.value = await pickDate(kycController.cardStartDate.value) ?? kycController.cardStartDate.value,
                        title: StringConstants.issueDate,
                      ),
                    ),
                  ],
                ),
                20.kheightBox,
                Row(
                  children: [
                    Expanded(
                      child: StTextField(
                        title: StRichText(text: StringConstants.placeOfIssue, color: context.redColor),
                        hint: StringConstants.placeOfIssue,
                        controller: kycController.placeOfIssueController,
                        validator: (value) => !isCommonText(value) ? StringConstants.invalidGhanaCardNumber : null,
                      ),
                    ),
                    10.kwidthBox,
                    Expanded(
                      child: StDatePicker(
                        height: 40.kh,
                        date: kycController.cardExpiryDate.value,
                        onTap: () async =>
                        kycController.cardExpiryDate.value = await pickDate(kycController.cardExpiryDate.value) ?? kycController.cardExpiryDate.value,
                        title: StringConstants.expiryDate,
                      ),
                    ),
                  ],
                ),*/
                      12.kheightBox,
                      ImageCard(onTap: () => kycController.chooseFile(), idImage: kycController.idImage, frontOrBack: StringConstants.front),
                      12.kheightBox,
                      ImageCard(
                          onTap: () => kycController.chooseFile(isIdImageBack: true), idImage: kycController.idImageBack, frontOrBack: StringConstants.back),
                      /*ClipRRect(
                  borderRadius: BorderRadius.circular(10.kh),
                  child: Stack(
                    children: [
                      Container(
                          width: double.infinity,
                          height: 204.kh,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: context.kcPrimaryLight,
                            borderRadius: BorderRadius.circular(10.kh),
                            border: Border.all(
                              color: context.kcPrimaryColor,
                              width: 1,
                            ),
                          ),
                          child: kycController.idImage?.value == null ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Assets.svg.selectFile.svg(),
                              Text(
                                StringConstants.selectFile,
                                style: TextStyleUtil.kText14_4(
                                  color: context.blackColor,
                                ),
                              ),
                            ],
                          ) : ClipRRect(
                            borderRadius: BorderRadius.circular(10.kh),
                            child: SizedBox(
                              width: double.infinity,
                              height: 204.kh,
                              child: Image.file(
                                File(kycController.idImage!.value!.path),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () => kycController.chooseFile(),
                          child: Ink(
                            width: double.infinity,
                            height: 204.kh,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),*/

                      24.kheightBox,
                      Text(
                        "Or",
                        style: TextStyleUtil.kText14_4(
                          color: context.blackColor,
                        ),
                      ),
                      12.kheightBox,
                      CustomButton.outline(
                        title: StringConstants.openCameraTakePhoto,
                        onTap: () => Get.to(() => const TakeIdPictureView()),
                        borderRadius: 50,
                      ),
                      20.kheightBox,
                      CustomButton(
                        title: StringConstants.continueText,
                        onTap: () => (formKey.currentState!.validate()) ? kycController.nextPage() : null,
                        borderRadius: 50,
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildTitle() {
    final kycController = Get.find<KycController>();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: isGhanaian(kycController.selectedResidentialStatus.value) ? StringConstants.regulationsRequired : StringConstants.regulationsRequiredFirstPage,
        style: TextStyleUtil.kText14_4(color: Get.context!.greyTextColor),
        children: [
          TextSpan(
            text: isGhanaian(kycController.selectedResidentialStatus.value) ? StringConstants.ghanaCard : StringConstants.passport,
            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: Get.context!.greyTextColor),
          ),
          TextSpan(
            text: StringConstants.yourDataIsSafeWithUs,
            style: TextStyleUtil.kText14_4(color: Get.context!.greyTextColor),
          ),
        ],
      ),
    );
  }

  isGhanaian(String value) {
    if (value == StringConstants.nonResidentForeigner) {
      return false;
    } else if (value == StringConstants.nonResidentGhanaian) {
      return false;
    } else {
      return true;
    }
  }
}
