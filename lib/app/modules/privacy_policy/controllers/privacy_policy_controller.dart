import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/dio/api_service.dart';

import '../../../services/snackbar.dart';

class PrivacyPolicyController extends GetxController {
  final RxString privacyPolicyText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    privacyPolicyText.value = Get.arguments;
  }

  privacyPolicy() async {
    try {
      final response = await APIManager.agreeToLatestVersion(type: "PrivacyPolicy");
      (response.data['status'] ?? false) ? Get.offAllNamed(Routes.HOME) : showMySnackbar(msg: response.data['message']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
