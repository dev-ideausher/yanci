import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/components/common_signin_provider_button.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/validation.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formkey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 92),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                20.kheightBox,
                Center(child: Assets.images.yanciLogo.image(height: 50.kh, width: 58.kw)),
                10.kheightBox,
                Center(
                  child: Text(
                    StringConstants.createAccount,
                    style: TextStyleUtil.kText24_6(fontWeight: FontWeight.bold),
                  ),
                ),
                52.kheightBox,
                StTextField(
                  title: Text(StringConstants.email, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                  hint: StringConstants.emailText,
                  controller: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidEmail(value, isRequired: true) ? 'Please enter a valid  Email' : null,
                ),
                16.kheightBox,
                Obx(
                  () => StTextField(
                    title: Text(StringConstants.password, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                    hint: StringConstants.passwordText,
                    controller: controller.passwordController,
                    validator: (value) => controller.passwordValidater(value!),
                    textInputType: TextInputType.visiblePassword,
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
                16.kheightBox,
                Obx(
                  () => StTextField(
                    title: Text(StringConstants.confirmPassword, style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500)),
                    hint: StringConstants.passwordText,
                    controller: controller.confirmPasswordController,
                    textInputType: TextInputType.visiblePassword,
                    validator: (value) => controller.passwordValidater(value!),
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
                  title: StringConstants.createAccount,
                  onTap: () => controller.checkLogin(),
                  borderRadius: 50,
                ),
                20.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.dividerColor,
                      ),
                      child: SizedBox(
                        height: 1,
                        width: 26.kw,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.kw),
                      child: Text(
                        StringConstants.orContinueWith,
                        style: TextStyleUtil.kText14_4(color: context.dividerColor),
                      ),
                    ),
                    DecoratedBox(
                      decoration: BoxDecoration(
                        color: context.dividerColor,
                      ),
                      child: SizedBox(
                        height: 1,
                        width: 26.kw,
                      ),
                    ),
                  ],
                ),
                20.kheightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SignInProviderButton(onTap: () {}, img: Assets.svg.googleLogo.svg(height: 50.kh, width: 50.kw)),
                    10.kwidthBox,
                    SignInProviderButton(onTap: () {}, img: Assets.svg.appleLogo.svg(height: 50.kh, width: 50.kw)),
                    10.kwidthBox,
                    SignInProviderButton(onTap: () {}, img: Assets.svg.yahooLogo.svg(height: 50.kh, width: 50.kw)),
                  ],
                ),
                20.kheightBox,
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: StringConstants.alreadyHaveAnAccount,
                      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: " ${StringConstants.logIn}",
                          style: TextStyleUtil.kText16_7(color: context.kcPrimaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(Routes.LOGIN),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
