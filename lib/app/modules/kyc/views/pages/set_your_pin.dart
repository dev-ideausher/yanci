import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:pinput/pinput.dart';

class SetYourPinPage extends StatelessWidget {
  const SetYourPinPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.setYourPin,
          style: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
        ),
        20.kheightBox,
        Text(
          StringConstants.setYourPinText,
          textAlign: TextAlign.center,
          style: TextStyleUtil.kText14_4(),
        ),
        80.kheightBox,
        Pinput(
          obscureText: true,
          focusedPinTheme: PinTheme(
            textStyle: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
            decoration: BoxDecoration(
              color: context.kWhitelight,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: context.blackColor),
            ),
            width: 64.kw,
            height: 65.kh,
          ),
          length: 4,
          defaultPinTheme: PinTheme(
            textStyle: TextStyleUtil.kText20_6(fontWeight: FontWeight.w700),
            decoration: BoxDecoration(color: context.kWhitelight, borderRadius: BorderRadius.circular(10)),
            width: 64.kw,
            height: 65.kh,
          ),
        ),
        370.kheightBox,
        CustomButton(
          title: StringConstants.continueText,
          onTap: () => kycController.setPin(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
