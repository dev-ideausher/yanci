import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/components/custom_image_capture_widget.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/custom_button.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';

class SelfieWithIdPage extends StatelessWidget {
  const SelfieWithIdPage({super.key});

  @override
  Widget build(BuildContext context) {
    final kycController = Get.find<KycController>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          StringConstants.selfieWithIdCard,
          style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
        ),
        10.kheightBox,
        Obx(
          () => kycController.selfieWithId?.value != null
              ? Text(
                  StringConstants.isThisPhotoGoodeEnough,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText14_4(),
                )
              : Text(
                  StringConstants.pointCameraAtID,
                  textAlign: TextAlign.center,
                  style: TextStyleUtil.kText14_4(),
                ),
        ),
        50.kheightBox,
        Obx(
          () => kycController.selfieWithId?.value != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.kheightBox,
                    ClipRRect(
                      borderRadius: BorderRadius.circular(150.kh),
                      child: SizedBox(
                        width: 284.kw,
                        height: 284.kh,
                        child: Image.file(
                          File(kycController.selfieWithId!.value!.path),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    110.kheightBox,
                    CustomButton.outline(
                      title: StringConstants.retake,
                      onTap: () => kycController.clearSelfieImage(),
                      borderRadius: 50,
                    ),
                    20.kheightBox,
                    CustomButton(
                      title: StringConstants.continueText,
                      onTap: () => kycController.nextPage(),
                      borderRadius: 50,
                    ),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.kh, horizontal: 10.kw),
                            child: SizedBox(
                              height: 284.kh,
                              width: 284.kw,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(150.kh),
                                child: CameraPreview(
                                  kycController.selfieCameraController,
                                ),
                              ),
                            ),
                          ),
                          Positioned(top: 0, child: Assets.svg.cameraBorder.svg()),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: Transform.flip(
                              flipX: true,
                              child: Assets.svg.cameraBorder.svg(),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Transform.flip(
                              flipY: true,
                              child: Assets.svg.cameraBorder.svg(),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Transform.flip(
                              flipX: true,
                              flipY: true,
                              child: Assets.svg.cameraBorder.svg(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    60.kheightBox,
                    CustomImageCaptureWidget(
                      onTapCamera: () => kycController.captureSelfieImage(),
                      onTapGallery: () {},
                      onTapFiles: () {},
                    ),
                  ],
                ),
        ),
      ],
    );
  }
}
