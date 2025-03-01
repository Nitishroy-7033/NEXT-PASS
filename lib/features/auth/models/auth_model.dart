class AuthModel {
  String? token;
  String? refreshToken;
  String? role;
  String? expires;
  String? issuedAt;

  AuthModel({
    this.token,
    this.refreshToken,
    this.role,
    this.expires,
    this.issuedAt,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      token: json["token"],
      refreshToken: json["refreshToken"],
      role: json["role"],
      expires: json["expires"],
      issuedAt: json["issuedAt"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "refreshToken": refreshToken,
      "role": role,
      "expires": expires,
      "issuedAt": issuedAt,
    };
  }
}
