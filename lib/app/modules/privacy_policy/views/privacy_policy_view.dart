import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../constants/string_constants.dart';
import '../../../services/text_style_util.dart';
import '../controllers/privacy_policy_controller.dart';

class PrivacyPolicyView extends GetView<PrivacyPolicyController> {
  const PrivacyPolicyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 1,
        title: Text(
          StringConstants.privacyPolicy,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Column(
            children: [
              Obx(
                () => Text(
                  controller.privacyPolicyText.value,
                  style: TextStyleUtil.kText14_4(),
                ),
              ),
              ListTile(
                onTap: () => controller.privacyPolicy(),
                contentPadding: EdgeInsets.zero,
                leading: Text(
                  StringConstants.proceedToTermsOfUse,
                  style: TextStyleUtil.kText14_4(color: context.kcPrimaryColor),
                ),
                title: Icon(Icons.arrow_forward, color: context.kcPrimaryColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
