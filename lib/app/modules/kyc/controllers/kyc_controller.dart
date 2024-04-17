import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/views/pages/bank_details_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/beneficiary_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/id_proof_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/personal_info_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/questions_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/selfie_with_id_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/signature_page.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/main.dart';

class KycController extends GetxController {
  late CameraController cameraController;
  late CameraController selfieCameraController;

  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    strokeCap: StrokeCap.butt,
    strokeJoin: StrokeJoin.round,
  );

  @override
  void onInit() async {
    super.onInit();

    cameraController = CameraController(cameras[0], ResolutionPreset.max);
    await cameraController.initialize();
    selfieCameraController = CameraController(cameras[1], ResolutionPreset.max);
    await selfieCameraController.initialize();
  }

  RxInt index = 0.obs;

  Rxn<XFile>? idImage = Rxn<XFile>();
  Rxn<XFile>? selfieWithId = Rxn<XFile>();

  final List<Widget> pages = const [
    PersonalInfoPage(),
    QuestionsPage(),
    IdProofPage(),
    SelfieWithIdPage(),
    BeneficiaryPage(),
    BankDetailsPage(),
    SignaturePage(),
  ];

  // personal info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final resdAddress1Controller = TextEditingController();
  final resdAddress2Controller = TextEditingController();

  // qustions
  final employerNameController = TextEditingController();

  // beneficiary
  final beneficiaryNameController = TextEditingController();
  final beneficiaryPhoneNumberController = TextEditingController();
  final beneficiaryAddress = TextEditingController();

  // bank details
  final nameAsPerAccController = TextEditingController();
  final accountNumberController = TextEditingController();
  final swiftCodeController = TextEditingController();
  final branchNameController = TextEditingController();
  final routingNumberController = TextEditingController();

  void nextPage() {
    if (index.value < pages.length - 1) {
      index.value++;
    }
  }

  void captureIdImage() async {
    try {
      final XFile image = await cameraController.takePicture();
      idImage!.value = image;
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clearSelfieImage() {
    selfieWithId!.value = null;
  }

  void captureSelfieImage() async {
    try {
      final XFile image = await selfieCameraController.takePicture();
      selfieWithId!.value = image;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void verifyId() {
    if (idImage?.value == null) {
      return;
    } else {
      DialogHelper.showSuccess(
        then: (p0) => index++,
        title: StringConstants.verified,
        description: StringConstants.idProofVerified,
      );
    }
  }

  void verifyAcc() {
    DialogHelper.showSuccess(
      then: (p0) => index++,
      title: StringConstants.verified,
      description: StringConstants.accountVerified,
    );
  }

  void resetSignature() {
    signatureController.clear();
  }

  @override
  void onClose() {
    cameraController.dispose();
    selfieCameraController.dispose();

    signatureController.dispose();

    firstNameController.dispose();
    lastNameController.dispose();
    placeOfBirthController.dispose();
    phoneNumberController.dispose();
    resdAddress1Controller.dispose();
    resdAddress2Controller.dispose();

    employerNameController.dispose();

    beneficiaryNameController.dispose();
    beneficiaryPhoneNumberController.dispose();
    beneficiaryAddress.dispose();

    nameAsPerAccController.dispose();
    accountNumberController.dispose();
    swiftCodeController.dispose();
    branchNameController.dispose();
    routingNumberController.dispose();
    super.onClose();
  }
}
