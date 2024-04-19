import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/common_signin_provider_button.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/components/custom_textfield.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/app/utils/validation.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                    StringConstants.welcomeBack,
                    style: TextStyleUtil.kText24_6(fontWeight: FontWeight.bold),
                  ),
                ),
                52.kheightBox,
                StTextField(
                  title: StRichText(text: StringConstants.email, color: context.kcPrimaryColor),
                  hint: StringConstants.emailText,
                  controller: controller.emailController,
                  textInputType: TextInputType.emailAddress,
                  validator: (value) => !isValidEmail(value, isRequired: true) ? 'Please enter a valid  Email' : null,
                ),
                16.kheightBox,
                Obx(
                  () => StTextField(
                    title: StRichText(text: StringConstants.password, color: context.kcPrimaryColor),
                    hint: StringConstants.passwordText,
                    controller: controller.passwordController,
                    textInputType: TextInputType.emailAddress,
                    validator: (value) => controller.passwordValidater(value!),
                    isObscure: !controller.isPassVisible.value,
                    onChanged: (value) => controller.password.value,
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
                Row(
                  children: [
                    const Spacer(),
                    InkWell(
                      // onTap: () => Get.toNamed(Routes.FORGOT_PASSWORD),
                      child: Text(
                        textAlign: TextAlign.center,
                        'Forgot Password ?',
                        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500, color: Get.context!.blackColor),
                      ),
                    ),
                  ],
                ),
                20.kheightBox,
                CustomButton(
                  title: StringConstants.logIn,
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
                      text: StringConstants.dontHaveAnAccount,
                      style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                          text: " ${StringConstants.createAccount}",
                          style: TextStyleUtil.kText16_7(color: context.kcPrimaryColor),
                          recognizer: TapGestureRecognizer()..onTap = () => Get.offNamed(Routes.SIGN_UP),
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
