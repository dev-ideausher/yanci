import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'enigma.dart';

class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  // we are utilisig encrypt class we decrypt once we read and encrypt before write.

  String get encjwToken => decryptAESCryptoJS(_runData.read('jwToken')) ?? '';

  set encjwToken(String val) => _runData.write('jwToken', encryptAESCryptoJS(val));

  String get id => decryptAESCryptoJS(_runData.read('id')) ?? '';

  set id(String val) => _runData.write('id', encryptAESCryptoJS(val));

  String get email => decryptAESCryptoJS(_runData.read('email')) ?? '';

  set email(String val) => _runData.write('email', encryptAESCryptoJS(val));

  String get profilePic => decryptAESCryptoJS(_runData.read('profilePic')) ?? '';

  set profilePic(String val) => _runData.write('profilePic', encryptAESCryptoJS(val));

  String get dob => decryptAESCryptoJS(_runData.read('dob')) ?? '';

  set dob(String val) => _runData.write('dob', encryptAESCryptoJS(val));



  String get firstName => decryptAESCryptoJS(_runData.read('firstName')??"") ?? '';

  set firstName(String val) => _runData.write('firstName', encryptAESCryptoJS(val));


  String get lastName => decryptAESCryptoJS(_runData.read('lastName')??"") ?? '';

  set lastName(String val) => _runData.write('lastName', encryptAESCryptoJS(val));



  String get firebaseUid => decryptAESCryptoJS(_runData.read('firebaseUid')) ?? '';

  set firebaseUid(String val) => _runData.write('firebaseUid', encryptAESCryptoJS(val));

  String get firebaseSignInProvider => decryptAESCryptoJS(_runData.read('firebaseSignInProvider')) ?? '';

  set firebaseSignInProvider(String val) => _runData.write('firebaseSignInProvider', encryptAESCryptoJS(val));

  String get nationality => decryptAESCryptoJS(_runData.read('nationality')) ?? '';

  set nationality(String val) => _runData.write('nationality', encryptAESCryptoJS(val));

  String get preferencesId => decryptAESCryptoJS(_runData.read('preferencesId')) ?? '';

  set preferencesId(String val) => _runData.write('preferencesId', encryptAESCryptoJS(val));

  bool get isLoggedIn => _runData.read('isLogin') ?? false;

  set isLoggedIn(bool val) => _runData.write('isLogin', val);

  bool get notificationEnabled => _runData.read('notificationEnabled') ?? false;

  set notificationEnabled(bool val) => _runData.write('notificationEnabled', val);

  bool get locationShared => _runData.read('locationShared') ?? false;

  set locationShared(bool val) => _runData.write('locationShared', val);

  bool get isFirstTime => _runData.read('isFirstTime') ?? false;

  set isFirstTime(bool val) => _runData.write('isFirstTime', val);

  void logout() {
    _runData.erase();
  }
}
