import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/explore/controllers/explore_controller.dart';
import 'package:yanci/app/modules/home/controllers/home_controller.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';
import 'colors.dart';
import 'responsive_size.dart';

class DialogHelper {
  static void showLoading([String? message, bool canPop = false]) {
    Get.dialog(
      PopScope(
        canPop: canPop,
        onPopInvoked: (pop) => Future.value(false),
        child: const SizedBox(
          child: Center(child: CircularProgressIndicator()),
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void deleteWatchList(String name, VoidCallback onTap, [bool canPop = true]) {
    Get.dialog(
      PopScope(
        canPop: canPop,
        onPopInvoked: (pop) => Future.value(true),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: SizedBox(
              width: 316.kw,
              height: 184.kh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 14.kw, vertical: 26.kh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.sureYouWantToDeleteWatchList,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "$name?",
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText18_6(color: Get.context!.blackColor),
                    ),
                    30.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomButton(
                          height: 48.kh,
                          width: 140.kw,
                          borderRadius: 50,
                          title: StringConstants.delete,
                          onTap: () => onTap(),
                        ),
                        CustomButton.outline(
                          borderRadius: 50,
                          height: 48.kh,
                          width: 140.kw,
                          title: StringConstants.cancel,
                          onTap: () => Get.back(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showSuccess({required FutureOr Function(dynamic) then, required String title, required String description}) {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(50),
            ),
            child: SizedBox(
              width: 312.kw,
              height: 340.kh,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.kh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.kheightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        15.kwidthBox,
                        Assets.images.successful.image(),
                      ],
                    ),
                    8.kheightBox,
                    Text(
                      title,
                      style: TextStyleUtil.kText20_6(
                        fontWeight: FontWeight.w700,
                        color: Get.context!.kcPrimaryColor,
                      ),
                    ),
                    8.kheightBox,
                    Text(
                      description,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText16_5(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.blackColor,
                      ),
                    ),
                    10.kheightBox,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    ).then(then);
  }

  static void showBuyDialog(
      {required String title,
      required String description,
      required VoidCallback onTap,
      required double height,
      String? buttonText1,
      String? buttonText2,
      Color? buttoncolor}) {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 284.kw,
              height: height.kh,
              child: Padding(
                padding: EdgeInsets.all(18.kh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: TextStyleUtil.kText19_6()),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(Icons.close, size: 24.kh, color: Get.context!.subtitleColor),
                        ),
                      ],
                    ),
                    10.kheightBox,
                    Text(
                      description,
                      style: TextStyleUtil.kText16_5(
                        fontWeight: FontWeight.w400,
                        color: Get.context!.subtitleColor,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () => Get.back(),
                          child: Text(
                            buttonText2 ?? StringConstants.cancel,
                            style: TextStyleUtil.kText16_5(
                              fontWeight: FontWeight.w600,
                              color: Get.context!.kcPrimaryColor,
                            ),
                          ),
                        ),
                        10.kwidthBox,
                        CustomButton(
                          color: buttoncolor,
                          title: buttonText1 ?? StringConstants.buy.toUpperCase(),
                          height: 40,
                          width: 100,
                          borderRadius: 50,
                          onTap: () => onTap(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showGlossary() {
    List<Map<String, dynamic>> glossaryData = [
      {
        'title': StringConstants.marketOrder,
        'description': StringConstants.marketOrderText,
      },
      {
        'title': StringConstants.limitOrder,
        'description': StringConstants.limitOrderText,
      },
      {
        'title': StringConstants.stopLoss,
        'description': StringConstants.stopLossText,
      },
      {
        'title': StringConstants.timeInForce,
        'description': StringConstants.timeInForceText,
      },
    ];
    List<Map<String, dynamic>> timeInForceData = [
      {
        'title': StringConstants.dayOrderDO,
        'description': StringConstants.dayOrderDOText,
      },
      {
        'title': StringConstants.goodTillCancelledGTC,
        'description': StringConstants.goodTillCancelledGTCText,
      },
      {
        'title': StringConstants.goodTillDateGTD,
        'description': StringConstants.goodTillDateGTDText,
      },
    ];
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SizedBox(
              width: 327.kw,
              height: 530.kh,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40.kh,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.all(10.kh),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: Get.back,
                            child: Icon(Icons.arrow_back_rounded, size: 24.kh, color: Get.context!.blackColor),
                          ),
                          10.kwidthBox,
                          Text(
                            StringConstants.glossary,
                            style: TextStyleUtil.kText18_6(
                              color: Get.context!.blackColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 4),
                      child: Scrollbar(
                        radius: const Radius.circular(6),
                        interactive: true,
                        thickness: 6.kw,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16.kh),
                            child: SizedBox(
                              width: double.maxFinite,
                              child: Column(
                                children: [
                                  ...glossaryData.map(
                                    (e) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e['title'],
                                          style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          e['description'],
                                          style: TextStyleUtil.kText14_4(),
                                        ),
                                        e['title'] != StringConstants.timeInForce ? 10.kheightBox : 0.kheightBox,
                                      ],
                                    ),
                                  ),
                                  ...timeInForceData.map(
                                    (e) => Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text.rich(
                                          TextSpan(
                                            text: e['title'] + " - ",
                                            style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                                            children: [
                                              TextSpan(
                                                text: e['description'],
                                                style: TextStyleUtil.kText14_4(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        10.kheightBox,
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: true,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Center(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: Get.context!.whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: 327.kw,
              height: 514.kh,
              child: Padding(
                padding: EdgeInsets.all(16.kh),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => hideDialog(),
                        child: const Icon(Icons.close),
                      ),
                    ),
                    Assets.images.appTutorial.image(height: 230.kh, width: 230.kw),
                    8.kheightBox,
                    Text(
                      StringConstants.tutorialTitle,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText24_6(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    8.kheightBox,
                    Text(
                      StringConstants.tutorialSubTitle,
                      textAlign: TextAlign.center,
                      style: TextStyleUtil.kText14_4(
                        color: Get.context!.greyTextColor,
                      ),
                    ),
                    20.kheightBox,
                    CustomButton(
                      title: StringConstants.launchQuickTips,
                      borderRadius: 50,
                      onTap: () {
                        hideDialog();
                        showStockTutorial();
                      },
                    ),
                    10.kheightBox,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showStockTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              top: 21,
              left: 0,
              child: SizedBox(
                height: 35,
                width: 50.w,
                child: Column(
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Get.context!.whiteColor,
                        child: Center(
                          child: Text(
                            StringConstants.stocks,
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Get.context!.kcPrimaryColor,
                      child: SizedBox(
                        height: 2.kh,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 20.w,
              child: Assets.svg.triangleUp.svg(height: 13),
            ),
            Positioned(
              top: 73,
              left: 13.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 200.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.stocksTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.stocksTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.next,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<ExploreController>().tabController.index = 1;
                                showWatchListTutorial();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showWatchListTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              top: 21,
              right: 0,
              child: SizedBox(
                height: 35,
                width: 50.w,
                child: Column(
                  children: [
                    Expanded(
                      child: ColoredBox(
                        color: Get.context!.whiteColor,
                        child: Center(
                          child: Text(
                            StringConstants.watchlist,
                            style: TextStyleUtil.kText16_5(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                          ),
                        ),
                      ),
                    ),
                    ColoredBox(
                      color: Get.context!.kcPrimaryColor,
                      child: SizedBox(
                        height: 2.kh,
                        width: double.infinity,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 60,
              right: 20.w,
              child: Assets.svg.triangleUp.svg(height: 13),
            ),
            Positioned(
              top: 73,
              right: 13.w,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 180.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.watchListTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.watchlistTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "2/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.next,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<HomeController>().index.value = 0;
                                showMyStocksTutorial();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showMyStocksTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                height: 57,
                width: 20.w,
                child: ColoredBox(
                  color: Get.context!.whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.myStocks.svg(colorFilter: ColorFilter.mode(Get.context!.kcPrimaryColor, BlendMode.srcIn)),
                      Text(
                        StringConstants.myStocks,
                        style: TextStyleUtil.kText13_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 8.w,
              child: Assets.svg.triangleDown.svg(height: 13),
            ),
            Positioned(
              bottom: 73,
              left: 15.kw,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 220.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.myStocksTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.myStocksTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.next,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<HomeController>().index.value = 3;
                                showOrdersTutorial();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showOrdersTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 20.w,
              child: SizedBox(
                height: 57,
                width: 20.w,
                child: ColoredBox(
                  color: Get.context!.whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.orders.svg(colorFilter: ColorFilter.mode(Get.context!.kcPrimaryColor, BlendMode.srcIn)),
                      Text(
                        StringConstants.orders,
                        style: TextStyleUtil.kText13_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 25.w,
              child: Assets.svg.triangleDown.svg(height: 13),
            ),
            Positioned(
              bottom: 73,
              left: 20.kw,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 200.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.ordersTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.ordersTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "4/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.next,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<HomeController>().index.value = 1;
                                showNewsTutorial();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showNewsTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 20.w,
              child: SizedBox(
                height: 57,
                width: 20.w,
                child: ColoredBox(
                  color: Get.context!.whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.news.svg(colorFilter: ColorFilter.mode(Get.context!.kcPrimaryColor, BlendMode.srcIn)),
                      Text(
                        StringConstants.news,
                        style: TextStyleUtil.kText13_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              left: 25.w,
              child: Assets.svg.triangleDown.svg(height: 13),
            ),
            Positioned(
              bottom: 73,
              left: 20.kw,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 220.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.newsTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.newsTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.next,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<HomeController>().index.value = 4;
                                showMoreTutorial();
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  static void showMoreTutorial() {
    Get.dialog(
      PopScope(
        canPop: true,
        onPopInvoked: (pop) => Future.value(false),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              right: 0.w,
              child: SizedBox(
                height: 57,
                width: 20.w,
                child: ColoredBox(
                  color: Get.context!.whiteColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.svg.more.svg(colorFilter: ColorFilter.mode(Get.context!.kcPrimaryColor, BlendMode.srcIn)),
                      Text(
                        StringConstants.more,
                        style: TextStyleUtil.kText13_4(fontWeight: FontWeight.w600, color: Get.context!.kcPrimaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60,
              right: 8.w,
              child: Assets.svg.triangleDown.svg(height: 13),
            ),
            Positioned(
              bottom: 73,
              right: 20.kw,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Get.context!.whiteColor,
                  borderRadius: BorderRadius.circular(8.kh),
                ),
                child: SizedBox(
                  height: 200.kh,
                  width: 284.kw,
                  child: Padding(
                    padding: EdgeInsets.all(16.kh),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.moreTutorial,
                              style: TextStyleUtil.kText19_6(),
                            ),
                            GestureDetector(onTap: () => hideDialog(), child: const Icon(Icons.close)),
                          ],
                        ),
                        10.kheightBox,
                        Text(
                          StringConstants.moreTutorialText,
                          style: TextStyleUtil.kText16_5(
                            fontWeight: FontWeight.w400,
                            color: Get.context!.greyTextColor,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "6/6",
                              style: TextStyleUtil.kText12_4(
                                fontWeight: FontWeight.w600,
                                color: Get.context!.greyTextColor,
                              ),
                            ),
                            CustomButton(
                              title: StringConstants.finish,
                              height: 40.kh,
                              width: 112.kw,
                              borderRadius: 50.kh,
                              onTap: () {
                                hideDialog();
                                Get.find<ExploreController>().tabController.index = 0;
                                Get.find<HomeController>().index.value = 2;
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    );
  }

  //hide loading
  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.until((route) => !Get.isDialogOpen!);
  }
}
