import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:yanci/app/services/snackbar.dart';
import '../constants/string_constants.dart';
import '../data/models/login_model.dart';
import '../routes/app_pages.dart';
import 'dialog_helper.dart';
import 'dio/api_service.dart';
import 'dio/exceptions.dart';
import 'storage.dart';

class Auth extends GetxService {
  final auth = FirebaseAuthenticationService();
  AuthCredential? _pendingCredential;
  final _firebaseAuth = FirebaseAuth.instance;
  var phoneUpdate = "";

  Future<UserCredential?> signInWithYahoo() async {
    final yahooProvider = YahooAuthProvider();
    try {
      final userCredential = await FirebaseAuth.instance.signInWithProvider(yahooProvider);
      if (userCredential.user != null) {
        handleGetContact();
      } else {
        showMySnackbar(msg: "Something went wrong");
      }
    } catch (error) {
      showMySnackbar(msg: error.toString());
      return null;
    }
    return null;
  }

  google() async {
    await auth.signInWithGoogle().then((value) async {
      if (value.user == null) {
        showMySnackbar(msg: value.errorMessage ?? "Something went wrong");
      } else {
        await handleGetContact();
      }
    });
  }

  apple() async {
    //TODO: do the required setup mentioned in https://pub.dev/packages/sign_in_with_apple
    await auth
        .signInWithApple(
            //TODO: add your own handler id from firebase console
            appleRedirectUri: 'https://stacked-firebase-auth-test.firebaseapp.com/__/auth/handler',
            appleClientId: '')
        .then((value) async {
      if (value.user == null) {
        showMySnackbar(msg: value.errorMessage ?? "Something went wrong");
      } else {
        await handleGetContact();
      }
    });
  }

  loginEmailPass({required String email, required String pass}) async {
    await auth.loginWithEmail(email: email, password: pass).then((value) async {
      try {
        if (value.hasError) {
          if (value.errorMessage == "The supplied auth credential is malformed or has expired.") {

              createEmailPass(email: email, pass: pass);

          } else {
            showMySnackbar(msg: value.errorMessage ?? "Something went wrong");
          }
        } else {
          if (value.user!.emailVerified) {
            // User is verified, proceed with getting contacts
            handleGetContact();
          } else {
            // User created but email not verified
            showMySnackbar(title: "Email verify", msg: "Please verify your email and continue");
            await value.user!.sendEmailVerification();
          }
        }
      } on FirebaseAuthException catch (e) {
        showMySnackbar(title: e.code.toLowerCase(), msg: getErrorMessageFromFirebaseException(e));
      } on Exception {
        showMySnackbar(msg: 'We could not log into your account at this time. Please try again.');
      }
    });
  }

  createEmailPass({required String email, required String pass}) async {
    await auth.createAccountWithEmail(email: email, password: pass).then((value) async {
      if (value.user != null) {
        if (value.user!.emailVerified) {
          await handleGetContact();
        } else {
          await value.user?.sendEmailVerification();
          showMySnackbar(title: "Email verify ", msg: "Please verify your email and continue");
        }
      } else {
        showMySnackbar(msg: value.errorMessage ?? "");
      }
    });
  }

  Future<void> handleGetContact() async {
    final mytoken = await _firebaseAuth.currentUser?.getIdToken(true);
    Get.find<GetStorageService>().encjwToken = mytoken ?? "";
    final currentUser = _firebaseAuth.currentUser!;
    // {"name": currentUser.displayName ?? "", "email": currentUser.email ?? "", "phone": currentUser.phoneNumber ?? ""
    try {
      final response = await APIManager.login();
      final LoginModel loginModel = LoginModel.fromJson(response.data);
      if (loginModel.data != null) {
        setDataLoginUser(loginModel.data);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      if (errorMessage == "User doesn't exist. Please create account") {
        register();
        /* Get.offAllNamed(Routes.CREATE_PROFILE, arguments: mytoken, parameters: {
          "name": currentUser.displayName ?? "",
          "email": currentUser.email ?? "",
          "phone": phoneUpdate,
          "dialCode": countryCodeUpdate.dialCode,
          "cName": countryCodeUpdate.name,
          "code": countryCodeUpdate.code
        });*/
      }
    } catch (e) {
      debugPrint(e.toString());
    }

    debugPrint('i am user id${Get.find<GetStorageService>().encjwToken}');
  }

  Future<void> logOutUser() async {
    DialogHelper.showLoading();
    Get.find<GetStorageService>().logout();
    auth.logout();
    /*  await Get.offAllNamed(Routes.AUTH);
    await AgDialogHelper.hideDialog();*/
  }

  Future<void> register() async {
    try {
      final response = await APIManager.register();
      final LoginModel loginModel = LoginModel.fromJson(response.data);
      if (loginModel.data != null) {
        setDataLoginUser(loginModel.data, isNewUser: true);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void setDataLoginUser(LoginModelData? data, {isNewUser = false}) {
    Get.find<GetStorageService>().id = data?.Id ?? "";
    Get.find<GetStorageService>().email = data?.email ?? "";
    Get.find<GetStorageService>().dob = data?.dob ?? "";
    Get.find<GetStorageService>().firstName = data?.firstName ?? "";
    Get.find<GetStorageService>().lastName = data?.lastName ?? "";
    Get.find<GetStorageService>().profilePic = data?.passportPic?.url ?? "";
    Get.find<GetStorageService>().firebaseUid = data?.firebaseUid ?? '';
    Get.find<GetStorageService>().firebaseSignInProvider = data?.firebaseSignInProvider ?? "";
    Get.find<GetStorageService>().nationality = data?.nationality ?? "";
    Get.find<GetStorageService>().notificationEnabled = data?.preferences?.notificationEnabled ?? false;
    Get.find<GetStorageService>().locationShared = data?.preferences?.locationShared ?? false;
    if (isNewUser) {
      DialogHelper.showSuccess(
        then: (p0) => Get.offAllNamed(Routes.KYC, arguments: 0),
        title: StringConstants.successful,
        description: StringConstants.accHasBeenCreated,
      );
    } else {
      List<bool Function()> conditions = [
        () => data?.personalWithAddressInfo ?? false,
        () => data?.proofInfo ?? false,
        () => data?.bankingInfo ?? false,
        () => data?.investorInfo ?? false,
        () => data?.investmentInfo ?? false,
        () => data?.beneficiaryInfo ?? false,
        () => data?.signatureInfo ?? false,
        () => data?.pinNumberInfo ?? false
      ];

      int argument = 0;
      for (int i = 0; i < conditions.length; i++) {
        if (!conditions[i]()) {
          Get.offAllNamed(Routes.KYC, arguments: argument);
          return;
        }
        if (i == 1) {
          argument++;
          argument++;
        } else {
          argument++;
        }
      }

      Get.offAllNamed(Routes.HOME);
      Get.find<GetStorageService>().isLoggedIn = true;
    }
  }
}
