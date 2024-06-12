import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:yanci/app/services/colors.dart';

Future<DateTime?> pickDate(DateTime? initialDate, [String confirmText = "OK"]) async {
  final DateTime? pickedDate = await showDatePicker(
    builder: (context, child) {
      return Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Get.context!.kcPrimaryColor, // header background color
            onPrimary: Colors.white, // header text color
            onSurface: Colors.black, // body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Get.context!.kcPrimaryColor, // button text color
            ),
          ),
        ),
        child: child!,
      );
    },
    confirmText: confirmText,
    cancelText: "CANCEL",
    context: Get.context!,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  return pickedDate;
}

String formatDate(DateTime date) {
  return DateFormat('dd-MM-yyyy').format(date);
}
