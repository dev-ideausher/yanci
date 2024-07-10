import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yanci/app/components/common_signin_provider_button.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

import '../controllers/on_board_controller.dart';

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 500.kh,
            child: PageView(
              controller: controller.pageController,
              onPageChanged: (value) => controller.pageCount.value = value,
              children: [
                onboardingWidget(
                  img: Assets.images.onboarding1.image(height: 280.kh, width: 300.kw),
                  title: RichText(
                    text: TextSpan(
                      text: StringConstants.welcomeTo,
                      style: TextStyleUtil.kText25_7(),
                      children: [
                        TextSpan(
                          text: StringConstants.yanciEmoji,
                          style: TextStyleUtil.kText25_7(color: context.kcPrimaryColor),
                        ),
                      ],
                    ),
                  ),
                  subTitle: StringConstants.onboard1SubTitle,
                ),
                onboardingWidget(
                  img: Assets.images.onboarding2.image(height: 280.kh, width: 300.kw),
                  title: Text(
                    StringConstants.onboard2Title,
                    style: TextStyleUtil.kText25_7(),
                  ),
                  subTitle: StringConstants.onboard2SubTitle,
                ),
                onboardingWidget(
                  img: Assets.images.onboarding3.image(height: 280.kh, width: 300.kw),
                  title: Text(
                    StringConstants.onboard3Title,
                    style: TextStyleUtil.kText25_7(),
                  ),
                  subTitle: StringConstants.onboard3SubTitle,
                ),
                onboardingWidget(
                  img: Assets.images.onboarding4.image(height: 280.kh, width: 300.kw),
                  title: Text(
                    StringConstants.onboard4Title,
                    style: TextStyleUtil.kText25_7(),
                  ),
                  subTitle: StringConstants.onboard4SubTitle,
                ),
              ],
            ),
          ),
          SmoothPageIndicator(
            controller: controller.pageController,
            count: 4,
            effect: ExpandingDotsEffect(
              activeDotColor: Get.context!.kcPrimaryColor,
              dotColor: Get.context!.dotNotActive,
              dotHeight: 10.kh,
              spacing: 10.kh,
              dotWidth: 10.kh,
              expansionFactor: 4.5,
            ),
            onDotClicked: (index) => controller.onDotClicked(index),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Divider(
              color: context.dividerColor,
            ),
          ),
          16.kheightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton(
              title: StringConstants.createAccount,
              onTap: () => Get.toNamed(Routes.SIGN_UP),
              borderRadius: 50,
            ),
          ),
          10.kheightBox,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomButton.outline(
              title: StringConstants.logIn,
              onTap: () => Get.toNamed(Routes.LOGIN),
              borderRadius: 50,
            ),
          ),
          10.kheightBox,
          Text(
            StringConstants.orContinueWith,
            style: TextStyleUtil.kText14_4(color: context.greyTextColor),
          ),
          10.kheightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SignInProviderButton(onTap: () =>controller.googleLogin(), img: Assets.svg.googleLogo.svg(height: 50.kh, width: 50.kw)),
              10.kwidthBox,
              SignInProviderButton(onTap: () =>controller.appleLogin(), img: Assets.svg.appleLogo.svg(height: 50.kh, width: 50.kw)),
              10.kwidthBox,
              SignInProviderButton(onTap: () =>controller.yahooLogin(), img: Assets.svg.yahooLogo.svg(height: 50.kh, width: 50.kw)),
            ],
          ),
        ],
      ),
    );
  }

//onBoard widget
  Widget onboardingWidget({required Image img, required Widget title, required String subTitle}) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(child: Image(image: img.image)),
            110.kheightBox,
          ],
        ),
        Column(
          children: [
            260.kheightBox,
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.0),
                    Colors.white
                  ],
                  stops: const [
                    0,
                    0.4,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SizedBox(
                height: 240.kh,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      title,
                      20.kheightBox,
                      SizedBox(
                        height: 40.kh,
                        child: Text(
                          subTitle,
                          style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w400, color: Get.context!.subtitleColor),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      15.kheightBox,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
