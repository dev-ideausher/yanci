import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../generated/assets.dart';
import '../constants/string_constants.dart';
import '../modules/kyc/controllers/kyc_controller.dart';
import '../services/custom_button.dart';
import '../services/text_style_util.dart';
import 'custom_textfield.dart';

class OtpDialog extends GetView<KycController> {

  final GestureTapCallback? onTap;

  const OtpDialog({super.key,  this.onTap});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
        16.kheightBox,
        ListTile(
          title: Text(StringConstants.verifyContactNumber),
          subtitle: Text(StringConstants.pleaseEnterOtp),
        ),
        ListTile(
          title: Text(controller.phoneNumberController.text, style: TextStyleUtil.kText18_6()),
        ),
        Text(StringConstants.enterOtp, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
        StTextField(
          hint: StringConstants.otp,
          controller: controller.eOtp,
        ),
        16.kheightBox,
        RichText(
            text: TextSpan(children: [
          TextSpan(text: "${StringConstants.didntReceiveOtp.tr} ", style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w400)),
          TextSpan(
              text: StringConstants.resendOTP.tr,
              style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  controller.sendOTP(isResend: true);
                }),
        ])),
        16.kheightBox,
        CustomButton(
            onTap: () {
              Get.back();
              onTap?.call();
            },
            title: StringConstants.continueText.tr)
      ]).paddingAll(16.kh),
    );
  }
}
