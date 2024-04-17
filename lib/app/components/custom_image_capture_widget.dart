import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/gen/assets.gen.dart';

class CustomImageCaptureWidget extends StatelessWidget {
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;
  final VoidCallback onTapFiles;
  const CustomImageCaptureWidget({
    super.key,
    required this.onTapCamera,
    required this.onTapGallery,
    required this.onTapFiles,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.greyColor,
            ),
            child: GestureDetector(
              onTap: () => onTapGallery(),
              child: SizedBox(
                height: 68.kh,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Assets.svg.gallery.svg(),
                ),
              ),
            ),
          ),
        ),
        30.kwidthBox,
        DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                Color(0xff35BAB2),
                Color(0xff3592BA)
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              //
            ),
          ),
          child: GestureDetector(
            onTap: () => onTapCamera(),
            child: SizedBox(
              height: 96.kh,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Assets.svg.camera.svg(),
              ),
            ),
          ),
        ),
        30.kwidthBox,
        DecoratedBox(
          decoration: BoxDecoration(shape: BoxShape.circle, color: context.greyColor),
          child: GestureDetector(
            onTap: () => onTapFiles(),
            child: SizedBox(
              height: 96.kh,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Assets.svg.files.svg(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
