import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/profile/controllers/profile_controller.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: context.whiteColor,
        backgroundColor: context.whiteColor,
        shadowColor: context.disabledBorderColor,
        elevation: 0,
        title: Text(
          StringConstants.resetPassword,
          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.kh),
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Obx(
                  () => StTextField(
                    title: Text(
                      StringConstants.oldPassword,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.passwordText,
                    controller: controller.passwordController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => controller.passwordValidater(value!),
                    isObscure: !controller.isPassVisible.value,
                    suffixIcon: InkWell(
                      onTap: () => controller.isPassVisible.value = !controller.isPassVisible.value,
                      child: Icon(
                        controller.isPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                        color: context.kNotActive,
                      ),
                    ),
                  ),
                ),
                20.kheightBox,
                Obx(
                  () => StTextField(
                    title: Text(
                      StringConstants.newPassword,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.passwordText,
                    controller: controller.newPasswordController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => controller.newPasswordValidater(value!),
                    isObscure: !controller.isNewPassVisible.value,
                    suffixIcon: InkWell(
                      onTap: () => controller.isNewPassVisible.value = !controller.isNewPassVisible.value,
                      child: Icon(
                        controller.isNewPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                        color: context.kNotActive,
                      ),
                    ),
                  ),
                ),
                20.kheightBox,
                Obx(
                  () => StTextField(
                    title: Text(
                      StringConstants.confirmPassword,
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    hint: StringConstants.passwordText,
                    controller: controller.confirmPasswordController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => controller.newPasswordValidater(value!),
                    isObscure: !controller.isConfPassVisible.value,
                    suffixIcon: InkWell(
                      onTap: () => controller.isConfPassVisible.value = !controller.isConfPassVisible.value,
                      child: Icon(
                        controller.isConfPassVisible.value ? Icons.visibility : Icons.visibility_off_outlined,
                        color: context.kNotActive,
                      ),
                    ),
                  ),
                ),
                20.kheightBox,
                CustomButton(
                  title: StringConstants.continueText,
                  height: 48.kh,
                  borderRadius: 50,
                  onTap: () => controller.resetPassword(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
