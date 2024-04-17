import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:yanci/app/constants/string_constants.dart';
import 'package:yanci/app/modules/kyc/views/pages/bank_details_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/beneficiary_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/id_proof_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/investment_profile_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/investor_profile_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/personal_info_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/preview_csd_form.dart';
import 'package:yanci/app/modules/kyc/views/pages/selfie_with_id_page.dart';
import 'package:yanci/app/modules/kyc/views/pages/set_your_pin.dart';
import 'package:yanci/app/modules/kyc/views/pages/signature_page.dart';
import 'package:yanci/app/routes/app_pages.dart';
import 'package:yanci/app/services/dialog_helper.dart';
import 'package:yanci/main.dart';

class KycController extends GetxController {
  // data for drop dowwns
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
    StringConstants.ghana,
    StringConstants.foreigner,
    StringConstants.preferNotToSay,
  ];
  String selectedNationality = StringConstants.ghana;

  List<String> countries = [
    StringConstants.ghana,
  ];
  String selectedCountry = StringConstants.ghana;

  List<String> employmentStatus = [
    StringConstants.iMEmployed,
    StringConstants.iMUnemployed,
    StringConstants.iOwnBusiness,
    StringConstants.selfEmployed,
  ];
  String selectedEmploymentStatus = StringConstants.iMEmployed;

  List<String> occupation = [
    StringConstants.privateJob,
  ];
  String selectedOccupation = StringConstants.privateJob;

  List<String> monthlyIncome = [
    StringConstants.below1000Ghc,
    StringConstants.above1000Ghc,
  ];
  String selectedIncome = StringConstants.above1000Ghc;

  List<String> natureOfBusiness = [
    StringConstants.financialService,
  ];
  String selectedNature = StringConstants.financialService;

  List<String> everBoughtGhanaSecurity = [
    StringConstants.yes,
    StringConstants.no,
  ];
  String selectedSecurity = StringConstants.yes;

  List<String> whereHearYanci = [
    StringConstants.socialMedia,
  ];
  String selectedHearYanci = StringConstants.socialMedia;

  List<String> investObj = [
    StringConstants.iWantToGrowCap,
    StringConstants.iWantToPreserveCap,
    StringConstants.iWantToIncTradeKnowledge,
    StringConstants.iWantToGenPassIncm,
  ];
  String selectedObj = StringConstants.iWantToGrowCap;

  List<String> riskTolerance = [
    StringConstants.high,
    StringConstants.medium,
    StringConstants.low,
  ];
  String selectedRisk = StringConstants.high;

  List<String> investHorizon = [
    StringConstants.longTerm,
    StringConstants.midTerm,
    StringConstants.shortTerm,
  ];
  String selectedHorizon = StringConstants.longTerm;

  List<String> investmentKnowledge = [
    StringConstants.high,
    StringConstants.medium,
    StringConstants.low,
  ];
  String selectedKnowledge = StringConstants.high;

  List<String> sourceOfFunds = [
    StringConstants.salary,
    StringConstants.businessProfit,
    StringConstants.rentalIncome,
  ];
  String selectedSource = StringConstants.salary;

  List<String> topUps = [
    StringConstants.monthly,
    StringConstants.quarterly,
    StringConstants.halfYearly,
    StringConstants.yearly,
  ];
  String selectedTopUps = StringConstants.monthly;

  List<String> withdrawals = [
    StringConstants.monthly,
    StringConstants.quarterly,
    StringConstants.halfYearly,
    StringConstants.yearly,
  ];
  String selectedWithdrawal = StringConstants.monthly;

  List<String> additionalInfo = [
    StringConstants.none,
  ];
  String selectedInfo = StringConstants.none;

  List<String> relationToAccHolder = [
    StringConstants.wife,
    StringConstants.husband,
    StringConstants.father,
    StringConstants.mother,
    StringConstants.son,
    StringConstants.daughter,
    StringConstants.brother,
    StringConstants.sister,
    StringConstants.fatherInLaw,
    StringConstants.motherInLaw,
    StringConstants.brotherInLaw,
    StringConstants.sisterInLaw,
  ];
  String selectedRelation = StringConstants.wife;

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
    try {
      cameraController = CameraController(
        cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.back),
        ResolutionPreset.max,
      );
      await cameraController.initialize();

      selfieCameraController = CameraController(
        cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.front),
        ResolutionPreset.max,
      );
      await selfieCameraController.initialize();
    } catch (error, stackTrace) {
      debugPrint("Error initializing cameras: $error\n$stackTrace");
    }
    debugPrint(cameraController.toString());
  }

  RxInt index = 0.obs;
  Uint8List? signature;
  Rxn<XFile>? idImage = Rxn<XFile>();
  Rxn<XFile>? selfieWithId = Rxn<XFile>();

  final List<Widget> pages = const [
    PersonalInfoPage(),
    IdProofPage(),
    SelfieWithIdPage(),
    BankDetailsPage(),
    InvestorProfilePage(),
    InvestmentProfilePage(),
    BeneficiaryPage(),
    SignaturePage(),
    PreviewCSDformPage(),
    SetYourPinPage(),
  ];

  // personal info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final gpsController = TextEditingController();

  // investor profile
  final employerNameController = TextEditingController();
  // investment profile
  final initialInvestmentAmountController = TextEditingController();
  final topupController = TextEditingController();
  final regualWithdrawalController = TextEditingController();

  // beneficiary
  final beneficiaryNameController = TextEditingController();
  final beneficiaryPhoneNumberController = TextEditingController();
  final beneficiaryCountryController = TextEditingController();
  final beneficiaryStateController = TextEditingController();
  final beneficiaryCityController = TextEditingController();
  final beneficiaryStreetController = TextEditingController();
  final beneficiaryGpsController = TextEditingController();

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

  void setPin() {
    DialogHelper.showSuccess(
      then: (p0) => Get.offAllNamed(Routes.HOME),
      title: StringConstants.successful,
      description: StringConstants.profileHasBeenCreated,
    );
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

  void saveSignature() async {
    signature = await signatureController.toPngBytes();
    index++;
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
    countryController.dispose();
    stateController.dispose();
    cityController.dispose();
    gpsController.dispose();

    employerNameController.dispose();

    beneficiaryNameController.dispose();
    beneficiaryPhoneNumberController.dispose();
    beneficiaryCountryController.dispose();
    beneficiaryStateController.dispose();
    beneficiaryCityController.dispose();
    beneficiaryStreetController.dispose();
    beneficiaryGpsController.dispose();

    nameAsPerAccController.dispose();
    accountNumberController.dispose();
    swiftCodeController.dispose();
    branchNameController.dispose();
    routingNumberController.dispose();

    initialInvestmentAmountController.dispose();
    topupController.dispose();
    regualWithdrawalController.dispose();
    super.onClose();
  }
}
