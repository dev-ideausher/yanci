import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<DateTime?> pickDate(DateTime? initialDate) async {
  final DateTime? pickedDate = await showDatePicker(
    context: Get.context!,
    initialDate: initialDate ?? DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );

  return pickedDate;
}
