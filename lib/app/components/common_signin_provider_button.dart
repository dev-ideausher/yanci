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
        padding: const MaterialStatePropertyAll(EdgeInsets.all(10)),
        elevation: const MaterialStatePropertyAll(3),
        fixedSize: MaterialStatePropertyAll(Size(70.kw, 60.kh)),
        foregroundColor: MaterialStatePropertyAll(Get.context!.whiteColor),
        backgroundColor: MaterialStatePropertyAll(Get.context!.whiteColor),
        surfaceTintColor: MaterialStatePropertyAll(Get.context!.whiteColor),
        shadowColor: MaterialStatePropertyAll(Get.context!.dotNotActive),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      ),
      child: Center(
        child: img,
      ),
    );
  }
}
