import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../constants/string_constants.dart';
import '../../../services/text_style_util.dart';
import '../controllers/terms_controller.dart';

class TermsView extends GetView<TermsController> {
  const TermsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Text(
          StringConstants.termsOfUse,
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
                  controller.termsOfUseText.value,
                  style: TextStyleUtil.kText14_4(),
                ),
              ),
              ListTile(
                onTap: () => controller.termsOfUse(),
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
