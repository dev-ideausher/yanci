import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/data/models/user_info_model.dart';
import 'package:yanci/app/modules/home/controllers/home_controller.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/auth.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/app/services/dio/api_service.dart';

import '../../../services/snackbar.dart';
import '../../orders/controllers/orders_controller.dart';

class ProfileController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController queryController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();


  RxBool generalNotificationValue = true.obs;
  RxBool marketNotificationValue = true.obs;
  RxBool isPassVisible = false.obs;
  RxBool isNewPassVisible = false.obs;
  RxBool isConfPassVisible = false.obs;
  RxInt selectedEdIndex = 0.obs;
  RxString selectedContact = StringConstants.query.obs;
  RxString selectedTypeOfQuery = StringConstants.general.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void resetPassword() {
    if (formKey.currentState!.validate()) {
      DialogHelper.showSuccess(
        then: (p0) {
          passwordController.clear();
          newPasswordController.clear();
          confirmPasswordController.clear();
          isPassVisible = false.obs;
          isNewPassVisible = false.obs;
          isConfPassVisible = false.obs;
          Get.back();
        },
        title: StringConstants.passwordUpdated,
        description: StringConstants.passwordUpdatedText,
      );
    }
  }

  void onAllOrdersTapped() {
    final homeController = Get.find<HomeController>();
    final ordersController = Get.find<OrdersController>();
    ordersController.isAllOrdersScreen.value = true;
    homeController.index.value = 3;
  }

  Future<void> submitQuery() async {
    if (queryController.text.isEmpty) {
      showMySnackbar(msg: "Please enter a description", title: StringConstants.error);
      return;
    } else if (queryController.text.length < 10) {
      showMySnackbar(msg: "Description must be at least 10 characters long");
    } else {
      Map<String, String> requestBody = {
        "type": selectedContact.value == StringConstants.query ? "QUERY" : "FEEDBACK",
        "description": queryController.text,
      };
      if (selectedContact.value == StringConstants.query) {
        requestBody["title"] = selectedTypeOfQuery.value;
      }
      try {
        final response = await APIManager.submitQuery(body: requestBody);
        if (response.data['data'] != null) {
          DialogHelper.showSuccess(
            then: (p0) {
              queryController.clear();
              Get.back();
            },
            title: StringConstants.submitted,
            description: StringConstants.submittedQuery,
          );
        } else {
          showMySnackbar(msg: response.data['data'], title: StringConstants.error);
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  editProfile() {
    Get.toNamed(Routes.EDIT_PROFILE);
  }

  logout() {
    Auth().logOutUser();
    Get.offAllNamed(Routes.LOGIN);
  }
  String? passwordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (value.length < 6) {
      return "Character must me 6 or more";
    }
    return null;
  }

  String? newPasswordValidater(String value) {
    if (value.isEmpty) {
      return "Password required";
    } else if (value.length < 6) {
      return "Character must me 6 or more";
    } else if (newPasswordController.text != confirmPasswordController.text) {
      return "Passwords don't match";
    }
    return null;
  }  @override
  void onClose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    queryController.dispose();
    super.onClose();
  }
}
