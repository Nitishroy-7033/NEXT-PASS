class CredentialModel {
  String? id;
  String? siteUrl;
  String? title;
  String? emailId;
  String? password;
  String? userName;
  String? phoneNumber;
  int? passwordChangeReminder; // Adjust to String? if backend expects "30 Days"
  String? categoryCred;
  bool? isPasswordLeaked;
  String? passwordStrength;
  bool? isPasswordCompromised;
  String? createdAt;
  String? updatedAt;
  String? lastPasswordChange;
  List<PasswordAccessed>? passwordAccessed;
  List<PasswordHistory>? passwordHistory;
  bool? twoFactorAuthEnabled;
  List<SecurityQuestions>? securityQuestions;
  Notifications? notifications;
  List<TrustedDevices>? trustedDevices;
  String? backupEmail;
  String? notes;

  CredentialModel({
    this.id,
    this.siteUrl,
    this.title,
    this.emailId,
    this.password,
    this.userName,
    this.phoneNumber,
    this.passwordChangeReminder,
    this.categoryCred,
    this.isPasswordLeaked,
    this.passwordStrength,
    this.isPasswordCompromised,
    this.createdAt,
    this.updatedAt,
    this.lastPasswordChange,
    this.passwordAccessed,
    this.passwordHistory,
    this.twoFactorAuthEnabled,
    this.securityQuestions,
    this.notifications,
    this.trustedDevices,
    this.backupEmail,
    this.notes,
  });

  CredentialModel.fromJson(Map<String, dynamic> json) {
    if (json["id"] is String) {
      id = json["id"];
    }
    if (json["siteUrl"] is String) {
      siteUrl = json["siteUrl"];
    }
    if (json["Title"] is String) {
      title = json["Title"];
    }
    if (json["emailId"] is String) {
      emailId = json["emailId"];
    }
    if (json["password"] is String) {
      password = json["password"];
    }
    if (json["userName"] is String) {
      userName = json["userName"];
    }
    if (json["phoneNumber"] is String) {
      phoneNumber = json["phoneNumber"];
    }
    if (json["passwordChangeReminder"] is int) {
      passwordChangeReminder = json["passwordChangeReminder"];
    }
    if (json["category"] is String) {
      categoryCred = json["category"];
    }
    if (json["isPasswordLeaked"] is bool) {
      isPasswordLeaked = json["isPasswordLeaked"];
    }
    if (json["passwordStrength"] is String) {
      passwordStrength = json["passwordStrength"];
    }
    if (json["isPasswordCompromised"] is bool) {
      isPasswordCompromised = json["isPasswordCompromised"];
    }
    if (json["createdAt"] is String) {
      createdAt = json["createdAt"];
    }
    if (json["updatedAt"] is String) {
      updatedAt = json["updatedAt"];
    }
    if (json["lastPasswordChange"] is String) {
      lastPasswordChange = json["lastPasswordChange"];
    }
    if (json["passwordAccessed"] is List) {
      passwordAccessed = json["passwordAccessed"] == null
          ? null
          : (json["passwordAccessed"] as List)
              .map((e) => PasswordAccessed.fromJson(e))
              .toList();
    }
    if (json["passwordHistory"] is List) {
      passwordHistory = json["passwordHistory"] == null
          ? null
          : (json["passwordHistory"] as List)
              .map((e) => PasswordHistory.fromJson(e))
              .toList();
    }
    if (json["twoFactorAuthEnabled"] is bool) {
      twoFactorAuthEnabled = json["twoFactorAuthEnabled"];
    }
    if (json["securityQuestions"] is List) {
      securityQuestions = json["securityQuestions"] == null
          ? null
          : (json["securityQuestions"] as List)
              .map((e) => SecurityQuestions.fromJson(e))
              .toList();
    }
    if (json["notifications"] is Map) {
      notifications = json["notifications"] == null
          ? null
          : Notifications.fromJson(json["notifications"]);
    }
    if (json["trustedDevices"] is List) {
      trustedDevices = json["trustedDevices"] == null
          ? null
          : (json["trustedDevices"] as List)
              .map((e) => TrustedDevices.fromJson(e))
              .toList();
    }
    if (json["backupEmail"] is String) {
      backupEmail = json["backupEmail"];
    }
    if (json["notes"] is String) {
      notes = json["notes"];
    }
  }

  static List<CredentialModel> fromList(List<Map<String, dynamic>> list) {
    return list.map(CredentialModel.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["siteUrl"] = siteUrl;
    data["Title"] = title;
    data["emailId"] = emailId;
    data["password"] = password;
    data["userName"] = userName;
    data["phoneNumber"] = phoneNumber;
    data["passwordChangeReminder"] = passwordChangeReminder;
    data["Category"] = categoryCred;
    data["isPasswordLeaked"] = isPasswordLeaked;
    data["passwordStrength"] = passwordStrength;
    data["isPasswordCompromised"] = isPasswordCompromised;
    data["createdAt"] = createdAt;
    data["updatedAt"] = updatedAt;
    data["lastPasswordChange"] = lastPasswordChange;
    if (passwordAccessed != null) {
      data["passwordAccessed"] =
          passwordAccessed?.map((e) => e.toJson()).toList();
    }
    if (passwordHistory != null) {
      data["passwordHistory"] =
          passwordHistory?.map((e) => e.toJson()).toList();
    }
    data["twoFactorAuthEnabled"] = twoFactorAuthEnabled;
    if (securityQuestions != null) {
      data["securityQuestions"] =
          securityQuestions?.map((e) => e.toJson()).toList();
    }
    if (notifications != null) {
      data["notifications"] = notifications?.toJson();
    }
    if (trustedDevices != null) {
      data["trustedDevices"] = trustedDevices?.map((e) => e.toJson()).toList();
    }
    data["backupEmail"] = backupEmail;
    data["notes"] = notes;
    return data;
  }
}

class TrustedDevices {
  String? deviceId;
  String? deviceName;
  String? lastAccessed;

  TrustedDevices({this.deviceId, this.deviceName, this.lastAccessed});

  TrustedDevices.fromJson(Map<String, dynamic> json) {
    if (json["deviceId"] is String) {
      deviceId = json["deviceId"];
    }
    if (json["deviceName"] is String) {
      deviceName = json["deviceName"];
    }
    if (json["lastAccessed"] is String) {
      lastAccessed = json["lastAccessed"];
    }
  }

  static List<TrustedDevices> fromList(List<Map<String, dynamic>> list) {
    return list.map(TrustedDevices.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["deviceId"] = deviceId;
    data["deviceName"] = deviceName;
    data["lastAccessed"] = lastAccessed;
    return data;
  }
}

class Notifications {
  bool? passwordAccessed;
  bool? passwordChanged;
  bool? passwordLeaked;

  Notifications(
      {this.passwordAccessed, this.passwordChanged, this.passwordLeaked});

  Notifications.fromJson(Map<String, dynamic> json) {
    if (json["passwordAccessed"] is bool) {
      passwordAccessed = json["passwordAccessed"];
    }
    if (json["passwordChanged"] is bool) {
      passwordChanged = json["passwordChanged"];
    }
    if (json["passwordLeaked"] is bool) {
      passwordLeaked = json["passwordLeaked"];
    }
  }

  static List<Notifications> fromList(List<Map<String, dynamic>> list) {
    return list.map(Notifications.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["passwordAccessed"] = passwordAccessed;
    data["passwordChanged"] = passwordChanged;
    data["passwordLeaked"] = passwordLeaked;
    return data;
  }
}

class SecurityQuestions {
  String? question;
  String? answer;

  SecurityQuestions({this.question, this.answer});

  SecurityQuestions.fromJson(Map<String, dynamic> json) {
    if (json["question"] is String) {
      question = json["question"];
    }
    if (json["answer"] is String) {
      answer = json["answer"];
    }
  }

  static List<SecurityQuestions> fromList(List<Map<String, dynamic>> list) {
    return list.map(SecurityQuestions.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["question"] = question;
    data["answer"] = answer;
    return data;
  }
}

class PasswordHistory {
  String? oldPassword;
  String? changeDate;
  String? changeReason;

  PasswordHistory({this.oldPassword, this.changeDate, this.changeReason});

  PasswordHistory.fromJson(Map<String, dynamic> json) {
    if (json["oldPassword"] is String) {
      oldPassword = json["oldPassword"];
    }
    if (json["changeDate"] is String) {
      changeDate = json["changeDate"];
    }
    if (json["changeReason"] is String) {
      changeReason = json["changeReason"];
    }
  }

  static List<PasswordHistory> fromList(List<Map<String, dynamic>> list) {
    return list.map(PasswordHistory.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["oldPassword"] = oldPassword;
    data["changeDate"] = changeDate;
    data["changeReason"] = changeReason;
    return data;
  }
}

class PasswordAccessed {
  String? deviceName;
  String? userId;
  String? latitude;
  String? longitude;
  String? timeStamp;
  String? ipAddress;
  String? deviceOs;
  String? deviceType;

  PasswordAccessed(
      {this.deviceName,
      this.userId,
      this.latitude,
      this.longitude,
      this.timeStamp,
      this.ipAddress,
      this.deviceOs,
      this.deviceType});

  PasswordAccessed.fromJson(Map<String, dynamic> json) {
    if (json["deviceName"] is String) {
      deviceName = json["deviceName"];
    }
    if (json["userId"] is String) {
      userId = json["userId"];
    }
    if (json["latitude"] is String) {
      latitude = json["latitude"];
    }
    if (json["longitude"] is String) {
      longitude = json["longitude"];
    }
    if (json["timeStamp"] is String) {
      timeStamp = json["timeStamp"];
    }
    if (json["ipAddress"] is String) {
      ipAddress = json["ipAddress"];
    }
    if (json["deviceOS"] is String) {
      deviceOs = json["deviceOS"];
    }
    if (json["deviceType"] is String) {
      deviceType = json["deviceType"];
    }
  }

  static List<PasswordAccessed> fromList(List<Map<String, dynamic>> list) {
    return list.map(PasswordAccessed.fromJson).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["deviceName"] = deviceName;
    data["userId"] = userId;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["timeStamp"] = timeStamp;
    data["ipAddress"] = ipAddress;
    data["deviceOS"] = deviceOs;
    data["deviceType"] = deviceType;
    return data;
  }
}







// {
//   "id": "",
//   "siteUrl": "",
//   "emailId": "",
//   "password": "",
//   "userName": "",
//   "phoneNumber": "",
//   "passwordChangeReminder": 30,
//   "isPasswordLeaked": false,
//   "passwordStrength": "",
//   "isPasswordCompromised": false,
//   "createdAt": "",
//   "updatedAt": "",
//   "lastPasswordChange": "",
//   "passwordAccessed": [
//     {
//       "deviceName": "",
//       "userId": "",
//       "latitude": "",
//       "longitude": "",
//       "timeStamp": "",
//       "ipAddress": "",
//       "deviceOS": "",
//       "deviceType": "" 
//     }
//   ],
//   "passwordHistory": [
//     {
//       "oldPassword": "",
//       "changeDate": "",
//       "changeReason": ""
//     }
//   ],
//   "twoFactorAuthEnabled": false,
//   "securityQuestions": [
//     {
//       "question": "",
//       "answer": ""
//     }
//   ],
//   "notifications": {
//     "passwordAccessed": false,
//     "passwordChanged": false,
//     "passwordLeaked": false
//   },
//   "trustedDevices": [
//     {
//       "deviceId": "",
//       "deviceName": "",
//       "lastAccessed": ""
//     }
//   ],
//   "backupEmail": "",
//   "notes": ""
// }


