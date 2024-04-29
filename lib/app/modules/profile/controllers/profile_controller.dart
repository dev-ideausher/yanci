import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/home/controllers/home_controller.dart';
import 'package:yanci/app/services/dialog_helper.dart';

import '../../orders/controllers/orders_controller.dart';

class ProfileController extends GetxController {
  List<String> genders = [
    StringConstants.male,
    StringConstants.female,
    StringConstants.preferNotToSay,
  ];
  String selectedGender = StringConstants.male;

  List<String> maritalStatus = [
    StringConstants.single,
    StringConstants.married,
    StringConstants.preferNotToSay,
  ];
  String selectedMaritalStatus = StringConstants.single;

  List<String> nationality = [
    StringConstants.residentGhanaian,
    StringConstants.residentGhanaian,
    StringConstants.nonResidentGhanaian,
    StringConstants.nonResidentForeigner,
  ];
  String selectedNationality = StringConstants.residentGhanaian;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final gpsController = TextEditingController();

  RxBool generalNotificationValue = true.obs;
  RxBool marketNotificationValue = true.obs;
  RxBool isPassVisible = false.obs;
  RxBool isNewPassVisible = false.obs;
  RxBool isConfPassVisible = false.obs;
  RxString selectedContact = StringConstants.query.obs;
  RxString selectedTypeOfQuery = StringConstants.general.obs;
  Rx<DateTime> dateOfBirth = DateTime.now().obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  TextEditingController queryController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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

  void submitQuery() {
    DialogHelper.showSuccess(
      then: (p0) {
        queryController.clear();
        Get.back();
      },
      title: StringConstants.submitted,
      description: StringConstants.submittedQuery,
    );
  }

  @override
  void onClose() {
    passwordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    placeOfBirthController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    gpsController.dispose();

    queryController.dispose();
    super.onClose();
  }
}
