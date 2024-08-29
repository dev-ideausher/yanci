import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../constants/string_constants.dart';
import '../../../../services/text_style_util.dart';

class ImageCard extends StatelessWidget {
  Rxn<XFile>? idImage;
  final String frontOrBack;
  final GestureTapCallback? onTap;

  ImageCard({super.key, this.idImage, this.onTap, required this.frontOrBack});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ClipRRect(
        borderRadius: BorderRadius.circular(10.kh),
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: 204.kh,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.kcPrimaryLight,
                borderRadius: BorderRadius.circular(10.kh),
                border: Border.all(
                  color: context.kcPrimaryColor,
                  width: 1,
                ),
              ),
              child: idImage?.value == null
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Assets.svg.selectFile.svg(),
                        Text(
                          "${StringConstants.selectFile} $frontOrBack",
                          style: TextStyleUtil.kText14_4(
                            color: context.blackColor,
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(10.kh),
                      child: SizedBox(
                        width: double.infinity,
                        height: 204.kh,
                        child: Image.file(
                          File(idImage?.value?.path ?? ""),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap?.call(),
                child: Ink(
                  width: double.infinity,
                  height: 204.kh,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
