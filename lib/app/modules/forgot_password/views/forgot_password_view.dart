import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../components/custom_required_rich_text.dart';
import '../../../components/custom_textfield.dart';
import '../../../services/custom_button.dart';
import '../../../services/text_style_util.dart';
import '../../../utils/validation.dart';
import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.forgotPassword.replaceAll("?", "")),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.ksp),
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //SizedBox(height: 194.kh, width: 100.w, child: Center(child: YanciImgView(imagePath: Assets.imagesLogo))),
                SizedBox(
                  height: 20.kh,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConstants.forgotPassword,
                    textAlign: TextAlign.center,
                    style: TextStyleUtil.kText24_6(fontWeight: FontWeight.w600),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.ksp),
                    child: Text(
                      StringConstants.forgotPasswordTitle,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                SizedBox(height: 30.kh),

                StTextField(
                  title: StRichText(text: StringConstants.email, color: context.kcPrimaryColor),
                  hint: StringConstants.emailText,
                  controller: controller.eEmail,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidEmail(value, isRequired: true) ? 'Please enter a valid  Email' : null,
                ),
                SizedBox(height: 80.kh),
                Obx(
                  () => controller.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          title: StringConstants.logIn,
                          onTap: () => controller.sendInstructions(),
                          borderRadius: 50,
                        ),
                )
                // MaBtn(title: Strings.sendInstructions, onTap: () => controller.sendInstructions()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
