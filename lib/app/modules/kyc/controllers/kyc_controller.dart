import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:image_picker/image_picker.dart';
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
import 'package:yanci/app/services/dio/api_service.dart';
import 'package:path/path.dart' as path;
import 'package:http_parser/http_parser.dart';
import 'package:yanci/app/services/snackbar.dart';
import 'package:yanci/app/services/storage.dart';

import '../../../components/otp_dialog.dart';
import '../../../services/yanci_image_picker.dart';

class KycController extends GetxController {
  Rxn<XFile>? passportPic = Rxn<XFile>();
  List<String> titles = [StringConstants.mr, StringConstants.mrs, StringConstants.miss, StringConstants.master, StringConstants.dr];
  String selectedTitle = StringConstants.mr;

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

  String selectedNationality = StringConstants.nationalities.first;

  RxList<String> residentialStatuss = [
    StringConstants.selectResidentialStatuss,
    StringConstants.residentGhanaian,
    StringConstants.residentForeigner,
    StringConstants.nonResidentGhanaian,
    StringConstants.nonResidentForeigner,
  ].obs;
  RxString selectedResidentialStatus = StringConstants.selectResidentialStatuss.obs;

  List<String> countries = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bhutan',
    'Bolivia',
    'Bosnia and Herzegovina',
    'Botswana',
    'Brazil',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Central African Republic',
    'Chad',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo (Congo-Brazzaville)',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Cyprus',
    'Czechia (Czech Republic)',
    'Democratic Republic of the Congo',
    'Denmark',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Eswatini (fmr. "Swaziland")',
    'Ethiopia',
    'Fiji',
    'Finland',
    'France',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Greece',
    'Grenada',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Honduras',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kiribati',
    'Kuwait',
    'Kyrgyzstan',
    'Laos',
    'Latvia',
    'Lebanon',
    'Lesotho',
    'Liberia',
    'Libya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Marshall Islands',
    'Mauritania',
    'Mauritius',
    'Mexico',
    'Micronesia',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Morocco',
    'Mozambique',
    'Myanmar (formerly Burma)',
    'Namibia',
    'Nauru',
    'Nepal',
    'Netherlands',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'North Korea',
    'North Macedonia',
    'Norway',
    'Oman',
    'Pakistan',
    'Palau',
    'Palestine State',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Vincent and the Grenadines',
    'Samoa',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Slovakia',
    'Slovenia',
    'Solomon Islands',
    'Somalia',
    'South Africa',
    'South Korea',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'Sudan',
    'Suriname',
    'Sweden',
    'Switzerland',
    'Syria',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Tonga',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turkmenistan',
    'Tuvalu',
    'Uganda',
    'Ukraine',
    'United Arab Emirates',
    'United Kingdom',
    'United States of America',
    'Uruguay',
    'Uzbekistan',
    'Vanuatu',
    'Vatican City',
    'Venezuela',
    'Vietnam',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ];
  String selectedCountry = "United States of America";

  List<String> employmentStatus = [
    StringConstants.iMEmployed,
    StringConstants.iMUnemployed,
  ];
  String selectedEmploymentStatus = StringConstants.iMEmployed;

  List<String> occupation = [
    StringConstants.privateJob,
    StringConstants.governmentJob,
    StringConstants.iOwnBusiness,
    StringConstants.selfEmployed,
    StringConstants.student
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

  List<String> whereHearYanci = [StringConstants.socialMedia, StringConstants.marketingCampaign, StringConstants.wordOfMouth, StringConstants.self];
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

  List<String> investHorizon = [StringConstants.longTerm, StringConstants.shortTerm];
  String selectedHorizon = StringConstants.longTerm;

  List<String> investmentKnowledge = [
    StringConstants.novice,
    StringConstants.intermediate,
    StringConstants.expert,
  ];
  String selectedKnowledge = StringConstants.high;

  List<String> sourceOfFunds = [
    StringConstants.salary,
    StringConstants.businessProfit,
    StringConstants.businessProfit,
    StringConstants.interest,
    StringConstants.otherSources,
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

  List<String> additionalInfo = [StringConstants.none];
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
    StringConstants.uncle,
    StringConstants.aunt,
    StringConstants.grandfather,
    StringConstants.grandmother,
    StringConstants.sonInLaw,
    StringConstants.daughterInLaw,
    StringConstants.grandson,
    StringConstants.granddaughter
  ];
  String selectedRelation = StringConstants.wife;

  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 5,
    penColor: Colors.black,
    exportBackgroundColor: Colors.transparent,
    exportPenColor: Colors.black,
    strokeCap: StrokeCap.round,
    strokeJoin: StrokeJoin.round,
  );

  RxInt index = 0.obs;
  Uint8List? signature;
  Rxn<XFile>? idImage = Rxn<XFile>();
  RxBool isIdImageSelected = false.obs;
  Rxn<XFile>? selfieWithId = Rxn<XFile>();

  Rx<DateTime> dateOfBirth = DateTime(DateTime.now().year - 18, DateTime.now().month, DateTime.now().day).obs;

  //pin
  final TextEditingController pinController = TextEditingController();
  final List<Widget> pages = [
    PersonalInfoPage(),
    IdProofPage(),
    const SelfieWithIdPage(),
    BankDetailsPage(),
    InvestorProfilePage(),
    InvestmentProfilePage(),
    BeneficiaryPage(),
    const SignaturePage(),
    SetYourPinPage(),
    const PreviewCSDformPage(),
  ];

  // personal info
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final placeOfBirthController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController eOtp = TextEditingController();
  final countryController = TextEditingController();
  final stateController = TextEditingController();
  final cityController = TextEditingController();
  final streetController = TextEditingController();
  final gpsController = TextEditingController();
  final referralCodeController = TextEditingController();

  // id proof

  final ghanaCardNumberController = TextEditingController();
  Rx<DateTime> cardStartDate = DateTime.now().obs;
  Rx<DateTime> cardExpiryDate = DateTime.now().obs;
  final placeOfIssueController = TextEditingController();

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

  //CDR Url

  final RxString cdrFileUrl = "".obs;
  final RxBool isLoadCdr = false.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.find<GetStorageService>().nationality.isNotEmpty) {
      selectedResidentialStatus.value = Get.find<GetStorageService>().nationality;
    }
    index.value = Get.arguments;
  }

  Future<void> nextPage() async {
    if (index.value == 0) {
      await addUserAndAddress();
    } else if (index.value == 1) {
      if (idImage?.value != null) {
        index++;
      } else {
        showMySnackbar(msg: StringConstants.fillAllFields, title: StringConstants.error);
      }
    } else if (index.value == 2) {
      if (selfieWithId?.value != null) {
        await updateIdProof();
      } else {
        showMySnackbar(msg: StringConstants.fillAllFields, title: StringConstants.error);
      }
    } else if (index.value == 3) {
      addBankDetail();
    } else if (index.value == 4) {
      addInvestorProfile();
    } else if (index.value == 5) {
      addInvestmentProfile();
    } else if (index.value == 6) {
      addBeneficiaryInformation();
    } else if (index.value == 7) {
      saveSignature();
    } else if (index.value == 8) {
      addUpdatePinNumber();
    } else {}
    /*if (index.value < pages.length - 1) {
      index.value++;
    }*/
  }

  void captureIdImage(CameraController controller) async {
    try {
      final XFile image = await controller.takePicture();
      idImage!.value = await YanciImagePicker.compressImage(File(image.path));
      isIdImageSelected.value = true;
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  chooseFile() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      idImage!.value = await YanciImagePicker.compressImage(File(pickedImage!.path));
      isIdImageSelected.value = true;
      Get.back();
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void clearSelfieImage() {
    selfieWithId!.value = null;
  }

  void captureSelfieImage(CameraController controller) async {
    try {
      final XFile image = await controller.takePicture();
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
        then: (p0) {
          isIdImageSelected.value = false;
          Get.back();
        },
        title: StringConstants.verified,
        description: StringConstants.idProofVerified,
      );
    }
  }

  void resetSignature() {
    signatureController.clear();
  }

  void saveSignature() async {
    if (signatureController.isNotEmpty) {
      signature = await signatureController.toPngBytes();
      if (signature != null) {
        addUpdateSignature();
      }
    }

    // index++;
  }

  @override
  void onClose() {
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

  Future<void> addUserAndAddress() async {
    try {
      if (selectedResidentialStatus.value == StringConstants.selectResidentialStatuss) {
        showMySnackbar(msg: StringConstants.selectResidentialStatuss);
      } else {
        if (passportPic?.value != null) {
          final filePassportPic = passportPic!.value!.path;
          final extensionPic = path.extension(passportPic!.value!.path.toString()).replaceAll(".", "");
          final response = await APIManager.users(body: {
            'passportPic': await MultipartFile.fromFile(filePassportPic, filename: 'passportPic', contentType: MediaType('image', extensionPic)),
            "title": selectedTitle,
            "firstName": firstNameController.text,
            "lastName": lastNameController.text,
            "gender": selectedGender,
            "nationality": selectedNationality,
            "residentialStatus": selectedResidentialStatus.value,
            "maritalStatus": selectedMaritalStatus,
            "originCountry": selectedCountry,
            "dob": dateOfBirth.value.toString(),
            "phone": phoneNumberController.text
          });
          if (response.data['status'] ?? false) {
            await updateAdress();
          } else {
            showMySnackbar(msg: response.data['message'], title: StringConstants.error);
          }
        } else {
          showMySnackbar(msg: StringConstants.passportPicRequired, title: StringConstants.error);
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> updateAdress() async {
    try {
      final latLong = gpsController.text.split(',').map((s) => s.trim()).toList();
      final lat = latLong.first;
      final long = latLong.last;
      final response = await APIManager.addUpdateAddress(body: {
        "country": countryController.text,
        "state": stateController.text,
        "city": cityController.text,
        "address": streetController.text,
        "latitude": lat,
        "longitude": long
      });
      if (response.data['status'] ?? false) {
        if (index.value < pages.length - 1) {
          index.value++;
        }
      } else {
        showMySnackbar(msg: response.data['message'], title: StringConstants.error);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  updateIdProof() async {
    try {
      final pathFile = idImage!.value!.path;
      final extension = path.extension(idImage!.value!.path.toString()).replaceAll(".", "");

      final proofPicFile = selfieWithId!.value!.path;
      final extensionPic = path.extension(selfieWithId!.value!.path.toString()).replaceAll(".", "");

      final response = await APIManager.addUpdateProof(body: {
        'proofPic': await MultipartFile.fromFile(pathFile, filename: 'proofPic', contentType: MediaType('image', extension)),
        'proofWithId': await MultipartFile.fromFile(proofPicFile, filename: 'proofWithId', contentType: MediaType('image', extensionPic)),
        'cardNumber': ghanaCardNumberController.text,
        'issueDate': cardStartDate.value.toString(),
        'expiryDate': cardExpiryDate.value.toString(),
        'placeOfIssue': placeOfIssueController.text
      });

      if (response.data['status'] ?? false) {
        index++;
      } else {
        showMySnackbar(msg: response.data['message'], title: StringConstants.error);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addBankDetail() async {
    try {
      // need to confirm :   "bankName":"ICICI Bank",
      final response = await APIManager.addUpdateBankDetails(body: {
        "accountNumber": accountNumberController.text,
        "accountName": nameAsPerAccController.text,
        "swiftCode": swiftCodeController.text,
        "branchName": branchNameController.text,
        "routingNumber": routingNumberController.text,
      });
      if (response.data['status'] ?? false) {
        if (index.value < pages.length - 1) {
          index.value++;
        }
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addInvestorProfile() async {
    try {
      final response = await APIManager.addUpdateInvestorProfile(body: {
        "employmentStatus": selectedEmploymentStatus,
        "occupation": selectedOccupation,
        "monthlyIncome": selectedIncome,
        "employer": employerNameController.text,
        "businessNature": selectedNature,
        "ghanaSecurity": selectedSecurity.toLowerCase(),
        "informationSource": selectedHearYanci
      });
      if (response.data['status'] ?? false) {
        if (index.value < pages.length - 1) {
          index.value++;
        }
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addInvestmentProfile() async {
    try {
      final response = await APIManager.addUpdateInvestmentProfile(body: {
        "investmentObjective": selectedObj,
        "riskTolerance": selectedRisk,
        "investmentHorizon": selectedHorizon,
        "investmentKnowledge": selectedKnowledge,
        "fundSource": selectedSource,
        "topUpPeriod": selectedTopUps,
        "withdrawalPeriod": selectedWithdrawal,
        "initialInvestmentAmount": initialInvestmentAmountController.text,
        "regularTopUpAmount": topupController.text,
        "regularWithdrawalAmount": regualWithdrawalController.text,
        "clientAdditionalInformation": selectedInfo
      });
      if (response.data['status'] ?? false) {
        if (index.value < pages.length - 1) {
          index.value++;
        }
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addBeneficiaryInformation() async {
    try {
      final latLong = beneficiaryGpsController.text.split(',').map((s) => s.trim()).toList();
      final lat = latLong.first;
      final long = latLong.last;
      final response = await APIManager.addUpdateBeneficiaryInformation(body: {
        "fullName": beneficiaryNameController.text,
        "relationship": selectedRelation,
        "phone": beneficiaryPhoneNumberController.text,
        "country": beneficiaryCountryController.text,
        "state": beneficiaryStateController.text,
        "city": beneficiaryCityController.text,
        "streetAddress": beneficiaryStreetController.text,
        "latitude": lat,
        "longitude": long
      });
      if (response.data['status'] ?? false) {
        DialogHelper.showSuccess(
          then: (p0) {
            Get.back();
            DialogHelper.showSuccess(
              then: (p0) => index++,
              title: StringConstants.verified,
              description: StringConstants.accountVerified,
            );
          },
          title: StringConstants.submittedSuccessfully,
          description: StringConstants.yourSubmissionRecieved,
        );
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addUpdateSignature() async {
    try {
      final response = await APIManager.addUpdateSignature(body: {
        'signature': MultipartFile.fromBytes(signature!, filename: 'signature', contentType: MediaType('image', 'png')),
      });
      if (response.data['status'] ?? false) {
        index++;
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> addUpdatePinNumber() async {
    try {
      final response = await APIManager.addUpdatePinNumber(body: {"pinNumber": pinController.text});
      if (response.data['status'] ?? false) {
        DialogHelper.showSuccess(
          then: (p0) {
            index++;
            getKycData();
          },
          title: StringConstants.successful,
          description: StringConstants.profileHasBeenCreated,
        );
      } else {
        showMySnackbar(msg: response.data['message']);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getKycData() async {
    isLoadCdr.value = true;
    try {
      final response = await APIManager.generateKycPdf();
      cdrFileUrl.value = response.data['pdf'].toString();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoadCdr.value = false;
  }

  homePage() {
    Get.find<GetStorageService>().isLoggedIn = true;
    Get.offAllNamed(Routes.HOME);
  }

  getPassPortPic(BuildContext context) {
    YanciImagePicker.imgOpt(
        context: context,
        onBack: (XFile? pickedImage) async {
          if (pickedImage != null) {
            passportPic?.value = pickedImage;
          }
        });
  }

  sendOTP({isResend = false}) async {
    Get.dialog(OtpDialog(onTap: () {
      //verfiyOtp();
    }));
    /* try {
      final response = await APIManager.sendOtp();
      if (response.data['status'] == true) {
*/ /*        Get.dialog(OtpDialog(
            text: LocaleKeys.app_eventSuccessfullyCreatedon.tr,
            img: Assets.svgEventCreated,
            onTap: () {
              verfiyOtp();
            }));*/ /*
      }
    } catch (e) {
      debugPrint(e.toString());
    }*/
  }
}
