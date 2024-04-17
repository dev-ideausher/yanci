import 'package:flutter/material.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StRichText extends StatelessWidget {
  final String text;
  final String? text2;
  final Color color;
  const StRichText({super.key, required this.text, required this.color, this.text2 = "*"});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
        children: [
          TextSpan(
            text: text2,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }
}
