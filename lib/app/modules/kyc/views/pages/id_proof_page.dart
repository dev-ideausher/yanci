import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/modules/kyc/views/take_id_picture_view.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class IdProofPage extends StatelessWidget {
  const IdProofPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.uploadIdProof,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        20.kheightBox,
        Obx(
          () => kycController.idImage?.value != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.idSuccesfullyCaptured,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText14_4(),
                    ),
                    50.kheightBox,
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
                    50.kheightBox,
                    ClipRRect(
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
                            child: Column(
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
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {},
                              child: Ink(
                                width: double.infinity,
                                height: 204.kh,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    30.kheightBox,
                    Text(
                      "Or",
                      style: TextStyleUtil.kText14_4(
                        color: context.blackColor,
                      ),
                    ),
                    40.kheightBox,
                    CustomButton.outline(
                      title: StringConstants.openCameraTakePhoto,
                      onTap: () => Get.to(() => const TakeIdPictureView()),
                      borderRadius: 50,
                    ),
                    120.kheightBox,
                    CustomButton(
                      title: StringConstants.continueText,
                      onTap: () => kycController.nextPage(),
                      borderRadius: 50,
                    ),
                  ],
                ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    final kycController = Get.find<KycController>();
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: kycController.selectedNationality == StringConstants.nonResidentForeigner ? StringConstants.regulationsRequiredFirstPage : StringConstants.regulationsRequired,
        style: TextStyleUtil.kText14_4(color: Get.context!.greyTextColor),
        children: [
          TextSpan(
            text: kycController.selectedNationality == StringConstants.nonResidentForeigner
                ? StringConstants.passport
                : kycController.selectedNationality == StringConstants.residentForeigner
                    ? StringConstants.residentPermit
                    : StringConstants.ghanaCard,
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
}
