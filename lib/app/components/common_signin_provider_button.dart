import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

class SignInProviderButton extends StatelessWidget {
  final void Function() onTap;
  final SvgPicture img;
  const SignInProviderButton({super.key, required this.onTap, required this.img});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        padding: const WidgetStatePropertyAll(EdgeInsets.all(10)),
        elevation: const WidgetStatePropertyAll(3),
        fixedSize: WidgetStatePropertyAll(Size(70.kw, 60.kh)),
        foregroundColor: WidgetStatePropertyAll(Get.context!.whiteColor),
        backgroundColor: WidgetStatePropertyAll(Get.context!.whiteColor),
        surfaceTintColor: WidgetStatePropertyAll(Get.context!.whiteColor),
        shadowColor: WidgetStatePropertyAll(Get.context!.dotNotActive),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      child: Center(
        child: img,
      ),
    );
  }
}
