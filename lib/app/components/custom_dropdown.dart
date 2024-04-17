import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StDropDown extends StatelessWidget {
  final void Function(String) onSelected;
  final List<DropdownMenuEntry<String>> dropdownMenuEntries;
  final Widget? title;
  const StDropDown({
    super.key,
    required this.dropdownMenuEntries,
    this.title,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title != null
              ? Padding(
                  padding: EdgeInsets.symmetric(vertical: 4.0.kh),
                  child: title,
                )
              : const SizedBox(),
          DropdownMenu<String>(
            onSelected: (value) {},
            width: 340.kh,
            menuStyle: MenuStyle(
              backgroundColor: MaterialStatePropertyAll(context.whiteColor),
              surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
              visualDensity: VisualDensity.compact,
            ),
            initialSelection: dropdownMenuEntries[0].label,
            enableSearch: false,
            textStyle: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            inputDecorationTheme: InputDecorationTheme(
              filled: true,
              fillColor: context.kGreyBack,
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kcPrimaryColor, width: 1.kh)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kNotActive, width: 1.kh)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.borderColor, width: 1.kh)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kcPrimaryColor, width: 1.kh)),
            ),
            dropdownMenuEntries: dropdownMenuEntries,
          ),
        ],
      ),
    );
  }
}
