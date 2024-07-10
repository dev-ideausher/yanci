import 'dart:convert';
import 'package:dio/dio.dart';
import 'client.dart';
import 'endpoints.dart';

class APIManager {
  ///Post API
  static Future<Response> register() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.register);

  static Future<Response> login() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: true).post(Endpoints.login);

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

  static Future<Response> generateKycPdf() async => await DioClient(Dio(), showSnakbar: true, isOverlayLoader: false).get(Endpoints.generateKycPdf);
}
