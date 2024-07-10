class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl = "http://3.139.241.224:8000/v1/";
  static const String users = "users";
  static const String addUpdateAddress = "users/addUpdateAddress";
  static const String addUpdateProof = "users/addUpdateProof";
  static const String addUpdateInvestmentProfile = "users/addUpdateInvestmentProfile";
  static const String addUpdateBankDetails = "users/addUpdateBankDetails";
  static const String addUpdateBeneficiaryInformation = "users/addUpdateBeneficiaryInformation";
  static const String addUpdateInvestorProfile = "users/addUpdateInvestorProfile";
  static const String addUpdatePinNumber = "users/addUpdatePinNumber";
  static const String addUpdateSignature = "users/addUpdateSignature";
  static const String generateKycPdf = "users/generateKycPdf";

  static const String login = "auth/login";
  static const String register = "auth/register";

  // receiveTimeout
  static const int receiveTimeout = 150000;

  // connectTimeout
  static const int connectionTimeout = 150000;
}
