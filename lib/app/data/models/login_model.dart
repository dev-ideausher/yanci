///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class LoginModelDataPreferences {
/*
{
  "notificationEnabled": false,
  "locationShared": false,
  "_id": "668cd6190ae55efe8d746f1a"
}
*/

  bool? notificationEnabled;
  bool? locationShared;
  String? Id;

  LoginModelDataPreferences({
    this.notificationEnabled,
    this.locationShared,
    this.Id,
  });
  LoginModelDataPreferences.fromJson(Map<String, dynamic> json) {
    notificationEnabled = json['notificationEnabled'];
    locationShared = json['locationShared'];
    Id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notificationEnabled'] = notificationEnabled;
    data['locationShared'] = locationShared;
    data['_id'] = Id;
    return data;
  }
}

class LoginModelDataPassportPic {
/*
{
  "key": "public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
  "url": "https://yanci-uploads.s3.us-east-2.amazonaws.com/public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
  "_id": "668d37040ae55efe8d746f3a"
}
*/

  String? key;
  String? url;
  String? Id;

  LoginModelDataPassportPic({
    this.key,
    this.url,
    this.Id,
  });
  LoginModelDataPassportPic.fromJson(Map<String, dynamic> json) {
    key = json['key']?.toString();
    url = json['url']?.toString();
    Id = json['_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['url'] = url;
    data['_id'] = Id;
    return data;
  }
}

class LoginModelData {
/*
{
  "_id": "668cd6190ae55efe8d746f1b",
  "firstName": "Sach",
  "lastName": "Singh",
  "email": "sach@yopmail.com",
  "profilePic": "",
  "signature": "",
  "cdsForm": "",
  "passportPic": {
    "key": "public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
    "url": "https://yanci-uploads.s3.us-east-2.amazonaws.com/public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
    "_id": "668d37040ae55efe8d746f3a"
  },
  "dob": "2024-07-09T18:39:35.494Z",
  "firebaseUid": "mXsiGyYOnCgRmP6g1ZvwxD0N5kk2",
  "firebaseSignInProvider": "password",
  "pinNumber": "",
  "isBlocked": false,
  "isDeleted": false,
  "beneficiaryInfo": false,
  "preferences": {
    "notificationEnabled": false,
    "locationShared": false,
    "_id": "668cd6190ae55efe8d746f1a"
  },
  "investorInfo": false,
  "bankingInfo": false,
  "investmentInfo": false,
  "proofInfo": false,
  "signatureInfo": false,
  "pinNumberInfo": false,
  "personalWithAddressInfo": true,
  "generatedCds": false,
  "createdAt": "2024-07-09T06:18:01.982Z",
  "updatedAt": "2024-07-09T13:16:20.389Z",
  "gender": "Male",
  "maritalStatus": "Single",
  "nationality": "Resident Ghanaian",
  "originCountry": "United States of America",
  "title": "Sach"
}
*/

  String? Id;
  String? firstName;
  String? lastName;
  String? email;
  String? profilePic;
  String? signature;
  String? cdsForm;
  LoginModelDataPassportPic? passportPic;
  String? dob;
  String? firebaseUid;
  String? firebaseSignInProvider;
  String? pinNumber;
  bool? isBlocked;
  bool? isDeleted;
  bool? beneficiaryInfo;
  LoginModelDataPreferences? preferences;
  bool? investorInfo;
  bool? bankingInfo;
  bool? investmentInfo;
  bool? proofInfo;
  bool? signatureInfo;
  bool? pinNumberInfo;
  bool? personalWithAddressInfo;
  bool? generatedCds;
  String? createdAt;
  String? updatedAt;
  String? gender;
  String? maritalStatus;
  String? nationality;
  String? originCountry;
  String? title;

  LoginModelData({
    this.Id,
    this.firstName,
    this.lastName,
    this.email,
    this.profilePic,
    this.signature,
    this.cdsForm,
    this.passportPic,
    this.dob,
    this.firebaseUid,
    this.firebaseSignInProvider,
    this.pinNumber,
    this.isBlocked,
    this.isDeleted,
    this.beneficiaryInfo,
    this.preferences,
    this.investorInfo,
    this.bankingInfo,
    this.investmentInfo,
    this.proofInfo,
    this.signatureInfo,
    this.pinNumberInfo,
    this.personalWithAddressInfo,
    this.generatedCds,
    this.createdAt,
    this.updatedAt,
    this.gender,
    this.maritalStatus,
    this.nationality,
    this.originCountry,
    this.title,
  });
  LoginModelData.fromJson(Map<String, dynamic> json) {
    Id = json['_id']?.toString();
    firstName = json['firstName']?.toString();
    lastName = json['lastName']?.toString();
    email = json['email']?.toString();
    profilePic = json['profilePic']?.toString();
    signature = json['signature']?.toString();
    cdsForm = json['cdsForm']?.toString();
    passportPic = (json['passportPic'] != null) ? LoginModelDataPassportPic.fromJson(json['passportPic']) : null;
    dob = json['dob']?.toString();
    firebaseUid = json['firebaseUid']?.toString();
    firebaseSignInProvider = json['firebaseSignInProvider']?.toString();
    pinNumber = json['pinNumber']?.toString();
    isBlocked = json['isBlocked'];
    isDeleted = json['isDeleted'];
    beneficiaryInfo = json['beneficiaryInfo'];
    preferences = (json['preferences'] != null) ? LoginModelDataPreferences.fromJson(json['preferences']) : null;
    investorInfo = json['investorInfo'];
    bankingInfo = json['bankingInfo'];
    investmentInfo = json['investmentInfo'];
    proofInfo = json['proofInfo'];
    signatureInfo = json['signatureInfo'];
    pinNumberInfo = json['pinNumberInfo'];
    personalWithAddressInfo = json['personalWithAddressInfo'];
    generatedCds = json['generatedCds'];
    createdAt = json['createdAt']?.toString();
    updatedAt = json['updatedAt']?.toString();
    gender = json['gender']?.toString();
    maritalStatus = json['maritalStatus']?.toString();
    nationality = json['nationality']?.toString();
    originCountry = json['originCountry']?.toString();
    title = json['title']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = Id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['profilePic'] = profilePic;
    data['signature'] = signature;
    data['cdsForm'] = cdsForm;
    if (passportPic != null) {
      data['passportPic'] = passportPic!.toJson();
    }
    data['dob'] = dob;
    data['firebaseUid'] = firebaseUid;
    data['firebaseSignInProvider'] = firebaseSignInProvider;
    data['pinNumber'] = pinNumber;
    data['isBlocked'] = isBlocked;
    data['isDeleted'] = isDeleted;
    data['beneficiaryInfo'] = beneficiaryInfo;
    if (preferences != null) {
      data['preferences'] = preferences!.toJson();
    }
    data['investorInfo'] = investorInfo;
    data['bankingInfo'] = bankingInfo;
    data['investmentInfo'] = investmentInfo;
    data['proofInfo'] = proofInfo;
    data['signatureInfo'] = signatureInfo;
    data['pinNumberInfo'] = pinNumberInfo;
    data['personalWithAddressInfo'] = personalWithAddressInfo;
    data['generatedCds'] = generatedCds;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['gender'] = gender;
    data['maritalStatus'] = maritalStatus;
    data['nationality'] = nationality;
    data['originCountry'] = originCountry;
    data['title'] = title;
    return data;
  }
}

class LoginModel {
/*
{
  "status": true,
  "data": {
    "_id": "668cd6190ae55efe8d746f1b",
    "firstName": "Sach",
    "lastName": "Singh",
    "email": "sach@yopmail.com",
    "profilePic": "",
    "signature": "",
    "cdsForm": "",
    "passportPic": {
      "key": "public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
      "url": "https://yanci-uploads.s3.us-east-2.amazonaws.com/public/passportPictures/64a62a73-69d7-4462-96e4-fe7d14611d5f",
      "_id": "668d37040ae55efe8d746f3a"
    },
    "dob": "2024-07-09T18:39:35.494Z",
    "firebaseUid": "mXsiGyYOnCgRmP6g1ZvwxD0N5kk2",
    "firebaseSignInProvider": "password",
    "pinNumber": "",
    "isBlocked": false,
    "isDeleted": false,
    "beneficiaryInfo": false,
    "preferences": {
      "notificationEnabled": false,
      "locationShared": false,
      "_id": "668cd6190ae55efe8d746f1a"
    },
    "investorInfo": false,
    "bankingInfo": false,
    "investmentInfo": false,
    "proofInfo": false,
    "signatureInfo": false,
    "pinNumberInfo": false,
    "personalWithAddressInfo": true,
    "generatedCds": false,
    "createdAt": "2024-07-09T06:18:01.982Z",
    "updatedAt": "2024-07-09T13:16:20.389Z",
    "gender": "Male",
    "maritalStatus": "Single",
    "nationality": "Resident Ghanaian",
    "originCountry": "United States of America",
    "title": "Sach"
  }
}
*/

  bool? status;
  LoginModelData? data;

  LoginModel({
    this.status,
    this.data,
  });
  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = (json['data'] != null) ? LoginModelData.fromJson(json['data']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    if (data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}