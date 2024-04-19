import 'package:flutter/material.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StRadioButton extends StatelessWidget {
  final String title;
  final int value;
  final int groupValue;
  final Function(int) onChanged;

  const StRadioButton({
    super.key,
    required this.groupValue,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Row(
        children: [
          groupValue == value
              ? CircleAvatar(
                  radius: 12.kh,
                  backgroundColor: context.kcPrimaryColor,
                  child: Center(
                    child: CircleAvatar(
                      radius: 7.kh,
                      backgroundColor: context.whiteColor,
                    ),
                  ),
                )
              : DecoratedBox(
                  decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(50),
                    shape: BoxShape.circle,
                    color: context.whiteColor,
                    border: Border.all(
                      width: 1.6.kh,
                      color: const Color.fromARGB(102, 201, 201, 201),
                    ),
                  ),
                  child: SizedBox(
                    height: 24.kh,
                    width: 24.kh,
                  ),
                ),
          10.kwidthBox,
          Text(
            title,
            style: value == groupValue
                ? TextStyleUtil.kText14_4(fontWeight: FontWeight.w600, color: context.kcPrimaryColor)
                : TextStyleUtil.kText14_4(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff666666),
                  ),
          ),
        ],
      ),
    );
  }
}
