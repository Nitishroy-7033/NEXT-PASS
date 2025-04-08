class HomeModel {
  final String siteUrl;
  final String title;
  final String username; // ✅ Ensure it's here
  final String emailId; // ✅ Ensure it's here
  final String password; // ✅ Ensure it's here
  final String passwordStrength;

  HomeModel({
    required this.siteUrl,
    required this.title,
    required this.username, // ✅ Ensure this matches API response
    required this.emailId,
    required this.password,
    required this.passwordStrength,
  });

  factory HomeModel.fromMap(Map<String, dynamic> json) {
    return HomeModel(
      siteUrl: json['siteUrl'] ?? '',
      title: json['title'] ?? '',
      username: json['userName'] ?? '', // ✅ Ensure this matches API response
      emailId: json['emailId'] ?? '', // ✅ Ensure this matches API response
      password: json['password'] ?? '', // ✅ Ensure this matches API response
      passwordStrength: json['passwordStrength'] ?? 0,
    );
  }
}

// for new pr
