import 'package:dropdown_flutter/custom_dropdown.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/services/colors.dart';
import 'package:yanci/app/services/responsive_size.dart';
import 'package:yanci/app/services/text_style_util.dart';

class StDropSearchDown extends StatelessWidget {
  final void Function(String) onSelected;
  final List<String> dropdownMenuEntries;
  final Widget? title;
  final double width;
  final bool isForm;
  final String value;

  const StDropSearchDown({
    super.key,
    required this.dropdownMenuEntries,
    this.title,
    required this.onSelected,
    this.width = 340,
    this.isForm = true,
    required this.value,
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
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.kh),
              border: Border.all(color: Get.context!.borderColor, width: 1.kh),
              color: context.kGreyBack,
            ),
            child: DropdownSearch<String>(
              items: dropdownMenuEntries,
              selectedItem: value,
              onChanged: (value) => onSelected(value!),
              popupProps: PopupProps.menu(
                showSearchBox: true,
                searchFieldProps: TextFieldProps(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: StringConstants.search,
                  ),
                ),
              ),
            ),
          ),
          /*DropdownMenu<String>(
            onSelected: (value) => onSelected(value!),
            width: width.kw,
            menuStyle: MenuStyle(
              backgroundColor: WidgetStatePropertyAll(context.whiteColor),
              surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
              visualDensity: VisualDensity.comfortable,
            ),
            initialSelection: value,
            enableSearch: false,
            selectedTrailingIcon: isForm
                ? null
                : Transform.translate(
                    offset: const Offset(10, -2),
                    child: const Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 20,
                    ),
                  ),
            trailingIcon: isForm
                ? null
                : Transform.translate(
                    offset: const Offset(10, -2),
                    child: const Icon(
                      Icons.keyboard_arrow_down_outlined,
                      size: 20,
                    ),
                  ),
            textStyle: TextStyleUtil.kText14_4(fontWeight: FontWeight.w500),
            inputDecorationTheme: InputDecorationTheme(
              isDense: true,
              constraints: isForm ? null : BoxConstraints(maxHeight: 40.kh, minHeight: 40.kh),
              contentPadding: isForm ? null : EdgeInsets.symmetric(horizontal: 10.kw),
              filled: true,
              fillColor: isForm ? context.kGreyBack : context.whiteColor,
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kcPrimaryColor, width: 1.kh)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kNotActive, width: 1.kh)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.borderColor, width: 1.kh)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.kh), borderSide: BorderSide(color: Get.context!.kcPrimaryColor, width: 1.kh)),
            ),
            dropdownMenuEntries: dropdownMenuEntries,
          ),*/
        ],
      ),
    );
  }
}
