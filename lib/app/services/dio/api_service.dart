import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> register() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.register);

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);

  static Future<Response> sendOtp() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.sendOtp);
  static Future<Response> submitQuery({required dynamic body}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints
      .submitQuery, data: jsonEncode(body));

  ///PATCH API
  static Future<Response> users({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.users, data: FormData.fromMap(body));

  static Future<Response> addUpdateAddress({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateAddress, data: jsonEncode(body));

  static Future<Response> addUpdateProof({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateProof, data: FormData.fromMap(body));

  static Future<Response> addUpdateInvestmentProfile({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateInvestmentProfile, data: jsonEncode(body));

  static Future<Response> addUpdateBankDetails({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateBankDetails, data: jsonEncode(body));

  static Future<Response> addUpdateBeneficiaryInformation({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateBeneficiaryInformation, data: jsonEncode(body));

  static Future<Response> addUpdateInvestorProfile({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateInvestorProfile, data: jsonEncode(body));

  static Future<Response> addUpdatePinNumber({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdatePinNumber, data: jsonEncode(body));

  static Future<Response> addUpdateSignature({required dynamic body}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).patch(Endpoints.addUpdateSignature, data: FormData.fromMap(body));

  ///GET API
  static Future<Response> user() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.users);

  static Future<Response> getQuery() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getQuery);
  static Future<Response> getFaq({  Map<String, dynamic>? queryParameters}) async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.getFaq, queryParameters: queryParameters);

  static Future<Response> generateKycPdf() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.generateKycPdf);

  static Future<Response> homepage() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.homepage);

  static Future<Response> agreeToLatestVersion({required String type}) async =>
      await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).get(Endpoints.agreeToLatestVersion + type);
}
