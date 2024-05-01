import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:yanci/app/components/custom_image_capture_widget.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/controllers/kyc_controller.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';
import 'package:yanci/gen/assets.gen.dart';
import 'package:yanci/main.dart';

class TakeIdPictureView extends StatefulWidget {
  const TakeIdPictureView({super.key});

  @override
  State<TakeIdPictureView> createState() => _TakeIdPictureViewState();
}

class _TakeIdPictureViewState extends State<TakeIdPictureView> {
  final CameraController cameraController = CameraController(
    cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.back),
    ResolutionPreset.max,
  );
  @override
  void initState() {
    initializeCamera();
    super.initState();
  }

  Future<void> initializeCamera() async {
    try {
      await cameraController.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  final controller = Get.find<KycController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(16.kh),
        child: Column(
          children: [
            Text(
              StringConstants.photoIdCard,
              style: TextStyleUtil.kText18_6(fontWeight: FontWeight.w700),
            ),
            10.kheightBox,
            Text(
              StringConstants.photoIdCardDescp,
              textAlign: TextAlign.center,
              style: TextStyleUtil.kText14_4(),
            ),
            60.kheightBox,
            Center(
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.all(7.kh),
                    child: SizedBox(
                      height: 354.kh,
                      width: 292.kw,
                      child: CameraPreview(cameraController),
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
              onTapCamera: () => controller.captureIdImage(cameraController),
              onTapGallery: () {},
              onTapFiles: () {},
            ),
          ],
        ),
      ),
    );
  }
}
