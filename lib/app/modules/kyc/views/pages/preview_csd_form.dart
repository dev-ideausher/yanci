import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class PreviewCSDformPage extends StatelessWidget {
  const PreviewCSDformPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.previewYourCSDForm,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        20.kheightBox,
        DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(color: context.disabledColor),
            borderRadius: BorderRadius.circular(10.kh),
          ),
          child: SizedBox(
            height: 508.kh,
            width: 342.kh,
            child: Center(
              child: Assets.images.csdKyc.image(width: 330.kw, height: 467.kh),
            ),
          ),
        ),
        20.kheightBox,
        CustomButton(
          title: StringConstants.proceedToESign,
          onTap: () => kycController.nextPage(),
          borderRadius: 50,
        ),
      ],
    );
  }
}
