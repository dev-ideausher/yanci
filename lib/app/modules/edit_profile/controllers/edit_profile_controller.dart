import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../../constants/string_constants.dart';
import '../../../data/models/user_info_model.dart';
import '../../../services/dio/api_service.dart';
import '../../../services/download_manager.dart';
import '../../../services/snackbar.dart';

class EditProfileController extends GetxController {
  final RxBool isLoading = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final RxString initialSelectionCountryCode = "+233".obs;
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
    StringConstants.residentForeigner,
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

  Rx<DateTime> dateOfBirth = DateTime.now().obs;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  DownloadManager? downloadManager;

  String cdrFileUrl="";
  @override
  Future<void> onInit() async {
    super.onInit();
    await getUserInfo();
    isLoading.value = false;

    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsDarwin = DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin!.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );

    downloadManager = DownloadManager(flutterLocalNotificationsPlugin!);
  }
  // Callback for when a notification is tapped
  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse) {
    final String filePath = notificationResponse.payload!;
    if (filePath != null && filePath.isNotEmpty) {
      OpenFile.open(filePath);
    }
  }
  Future<void> getUserInfo() async {
    try {
      final response = await APIManager.user();
      final UserInfoModel userInfoModel = UserInfoModel.fromJson(response.data);
      saveData(userInfoModel.data);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void saveData(UserInfoModelData? data) {
    if (data != null) {
      firstNameController.text = data.user?.firstName ?? "";
      lastNameController.text = data.user?.lastName ?? "";
      placeOfBirthController.text = data.user?.originCountry ?? "";
      phoneNumberController.text = data.user?.phone ?? "";
      initialSelectionCountryCode.value = data.user?.countryCode ?? "+233";
      countryController.text = data.user?.originCountry ?? "";
      selectedGender = data.user?.gender ?? "";
      selectedMaritalStatus = data.user?.maritalStatus ?? "";
      selectedNationality = data.user?.residentialStatus ?? "";
      stateController.text = data.address?.state ?? "";
      cityController.text = data.address?.city ?? "";
      gpsController.text = "${data.address?.latitude ?? ""},${data.address?.longitude ?? ""}";
      cdrFileUrl=data.user?.cdsForm?.url??"";
    }
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    placeOfBirthController.dispose();
    phoneNumberController.dispose();
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    gpsController.dispose();
    super.onClose();
  }

  Future<void> updateProfile() async {
    try {
      if (!formKey.currentState!.validate()) {
        return;
      }
      /*   if (selectedResidentialStatus.value == StringConstants.selectResidentialStatuss) {
        showMySnackbar(msg: StringConstants.selectResidentialStatuss);
      } else {*/
      /*   if (passportPic?.value != null) {
          final filePassportPic = passportPic!.value!.path;
          final extensionPic = path.extension(passportPic!.value!.path.toString()).replaceAll(".", "");*/
      final response = await APIManager.users(body: {
        /*  'passportPic': await MultipartFile.fromFile(filePassportPic, filename: 'passportPic', contentType: MediaType('image', extensionPic)),
            "title": selectedTitle,
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "gender": selectedGender,
            "nationality": selectedNationality,
            "residentialStatus": selectedResidentialStatus.value,
            "maritalStatus": selectedMaritalStatus,
            "originCountry": selectedCountry,
            "dob": dateOfBirth.value.toString(),*/
        "countryCode": initialSelectionCountryCode.value,
        "phone": phoneNumberController.text
      });
      if (response.data['status'] ?? false) {
        showMySnackbar(msg: response.data['message'], title: StringConstants.error);
      } else {
        showMySnackbar(msg: response.data['message'], title: StringConstants.error);
      }
      /*} else {
          showMySnackbar(msg: StringConstants.passportPicRequired, title: StringConstants.error);
        }*/
      /* }*/
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  downloadKycForm () {
    downloadManager?.downloadFile(cdrFileUrl, 'kyc_form.pdf');
  }
}
