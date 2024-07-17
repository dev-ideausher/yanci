import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../services/dio/api_service.dart';
import '../../../services/snackbar.dart';

class TermsController extends GetxController {
  final RxString termsOfUseText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    termsOfUseText.value = Get.arguments;
  }

  termsOfUse() async {
    try {
      final response = await APIManager.agreeToLatestVersion(type: "TermsAndCondition");
      (response.data['status'] ?? false) ? Get.offAllNamed(Routes.HOME) : showMySnackbar(msg: response.data['message']);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
