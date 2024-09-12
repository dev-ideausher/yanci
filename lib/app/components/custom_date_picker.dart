import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yanci/app/components/custom_required_rich_text.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StDatePicker extends StatelessWidget {
  final void Function()? onTap;
  final DateTime? date;
  final String title;
  final bool isRequired;
  final double? height;

  const StDatePicker({
    super.key,
    required this.date,
    this.onTap,
    required this.title,
    this.height,
    this.isRequired = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 4.kh),
          child: isRequired
              ? StRichText(text: title, color: context.redColor)
              : Text(
                  title,
                  style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.kh),
            border: Border.all(color: Get.context!.borderColor, width: 1.kh),
            color: context.kGreyBack,
          ),
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              height: height ?? 60.kh,
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(10.kh),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      date == null ? "" : DateFormat('dd/MM/yyyy').format(date!),
                      style: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
                    ),
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Color.fromARGB(255, 99, 99, 99),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
