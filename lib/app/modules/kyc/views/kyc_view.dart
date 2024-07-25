import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../controllers/kyc_controller.dart';

class KycView extends GetView<KycController> {
  const KycView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (pop) {
        if (controller.index.value > 0) {
          if (controller.index.value == 1) {
            if (controller.isIdImageSelected.value) {
              controller.isIdImageSelected?.value = false;
            } else {
              controller.index.value--;
            }
          } else {
            controller.index.value--;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: Visibility(
            visible: controller.index.value != 0,
            child: IconButton(
              icon: Obx(
                () => Icon(
                  Icons.arrow_back_rounded,
                  size: 24.kh,
                  color: controller.index.value == 0 ? context.disabledColor : context.blackColor,
                ),
              ),
              onPressed: () {
                if (controller.index.value > 0) {
                  if (controller.index.value == 1) {
                    if (controller.isIdImageSelected.value) {
                      controller.isIdImageSelected?.value = false;
                    } else {
                      controller.index.value--;
                    }
                  } else {
                    controller.index.value--;
                  }
                }
              },
            ),
          ),
          title: Obx(
            () => controller.index.value < 8
                ? Stack(
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: context.greyColor),
                        child: SizedBox(
                          height: 6.kh,
                          width: 266.kw,
                        ),
                      ),
                      Obx(
                        () => DecoratedBox(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(40), color: context.kcPrimaryColor),
                          child: SizedBox(
                            height: 6.kh,
                            width: (266.kw / 8) * (controller.index.value + 1),
                          ),
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Obx(
              () => controller.pages[controller.index.value],
            ),
          ),
        ),
      ),
    );
  }
}
