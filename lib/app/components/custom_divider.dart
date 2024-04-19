import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';

class StDivider extends StatelessWidget {
  const StDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: context.kWhitelight),
      child: SizedBox(
        height: 8.kh,
        width: double.maxFinite,
      ),
    );
  }
}
