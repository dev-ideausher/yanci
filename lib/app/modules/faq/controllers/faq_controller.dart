import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/faq_model.dart';
import '../../../services/dio/api_service.dart';

class FaqController extends GetxController {
  final RxBool isLoad = true.obs;
  final RxList<FaqModelData> faqs = <FaqModelData>[].obs;
  final RxString searchQuery = ''.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getFaq();
    isLoad.value = false;
    debounce(searchQuery, (_) {
      getFaq(query: {"search": searchQuery.value.trim()});
    }, time: const Duration(milliseconds: 500)); // Adjust the duration as needed
  }

  getFaq({Map<String, dynamic>? query}) async {
    try {
      final response = await APIManager.getFaq(queryParameters: query);
      FaqModel faqModel = FaqModel.fromJson(response.data);
      faqs.value = faqModel.data!;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void search(String searchFaq) {
    searchQuery.value = searchFaq; // This will trigger the debounce function
  }
}
