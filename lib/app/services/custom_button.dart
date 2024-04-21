import 'package:flutter/material.dart';
import 'responsive_size.dart';
import 'colors.dart';
import 'text_style_util.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final bool disabled;
  final bool isloading;
  final void Function()? onTap;
  final bool outline;
  final Widget? leading;
  final Widget? trailing;
  final LinearGradient? linearGradient;
  final Color? color;
  final double? borderRadius;
  final TextStyle? style;
  final double? height;
  final double? width;

  const CustomButton({
    super.key,
    required this.title,
    this.disabled = false,
    this.isloading = false,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
    this.height,
    this.width,
    this.style,
  }) : outline = false;

  const CustomButton.outline({
    super.key,
    required this.title,
    this.onTap,
    this.leading,
    this.trailing,
    this.linearGradient,
    this.color,
    this.borderRadius,
    this.height,
    this.width,
    this.style,
  })  : disabled = false,
        isloading = false,
        outline = true;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
      child: Stack(
        children: [
          Container(
            width: width ?? double.infinity,
            height: height ?? 48.kh,
            alignment: Alignment.center,
            decoration: !outline
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    gradient: linearGradient ??
                        LinearGradient(begin: const Alignment(0, 0), end: const Alignment(0, 0), colors: [
                          !disabled ? color ?? context.kcPrimaryColor : color ?? context.kcPrimaryColor,
                          !disabled ? color ?? context.kcPrimaryColor : color ?? context.kcPrimaryColor
                        ]),
                  )
                : BoxDecoration(
                    color: context.kcPrimaryLight,
                    borderRadius: BorderRadius.circular(borderRadius ?? 12.kh),
                    border: Border.all(
                      color: color ?? context.kcPrimaryColor,
                      width: 1,
                    )),
            child: !isloading
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (leading != null) leading!,
                      if (leading != null) SizedBox(width: 5.kw),
                      Text(
                        title,
                        style: style ??
                            TextStyleUtil.kText16_7(
                              fontWeight: !outline ? FontWeight.bold : FontWeight.bold,
                              color: !outline ? Colors.white : context.kcPrimaryColor,
                            ),
                      ),
                      if (trailing != null) SizedBox(width: 5.kw),
                      if (trailing != null) trailing!,
                    ],
                  )
                : const CircularProgressIndicator(
                    strokeWidth: 8,
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () => onTap!(),
              child: Ink(
                width: width ?? double.infinity,
                height: height ?? 48.kh,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
