import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
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
        child: SizedBox(
          child: Column(
            children: [
              SizedBox(height: 60.h),
              Center(
                child: Container(
                  height: 80.kh,
                  width: 80.kh,
                  decoration: BoxDecoration(
                    color: Get.context!.brandColor1,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0.kh),
                    ),
                  ),
                  padding: EdgeInsets.all(12.kh),
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              // message != null ? SizedBox(height: 8.kh) : const SizedBox(),
              // message != null ? Text(message) : const SizedBox(),
            ],
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
              height: 320.kh,
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
      barrierDismissible: true,
      barrierColor: const Color(0xff141A31).withOpacity(.4),
      useSafeArea: true,
    ).then(then);
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

  //hide loading
  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.until((route) => !Get.isDialogOpen!);
  }
}
