import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class SignaturePage extends StatelessWidget {
  const SignaturePage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.submitSignature,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        40.kheightBox,
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: context.disabledColor),
            borderRadius: BorderRadius.circular(10.kh),
          ),
          child: SizedBox(
            height: 462.kh,
            width: 342.kh,
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.kh),
                child: Signature(
                  controller: kycController.signatureController,
                  height: 462.kh,
                  width: 342.kh,
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        20.kheightBox,
        GestureDetector(
          onTap: () => kycController.resetSignature(),
          child: Text(
            StringConstants.doItAgain,
            style: TextStyleUtil.kText16_5(
              textDecoration: TextDecoration.underline,
              fontWeight: FontWeight.w600,
              color: context.kcPrimaryColor,
            ),
          ),
        ),
        40.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.verifyAcc(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
