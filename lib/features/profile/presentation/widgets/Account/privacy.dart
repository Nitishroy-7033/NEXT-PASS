import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final privacyData = [
      {
        "title": "1. Introduction",
        "data":
            "Welcome to Next-Pass. Your privacy is extremely important to us. This Privacy Policy outlines how we collect, use, protect, and store your data when you use our password manager app.",
      },
      {
        "title": "2. Data We Collect",
        "data":
            "We collect minimal personal information necessary to provide our services. This may include:\n- Your name and email address (for account creation)\n- Encrypted passwords and credentials\n- Usage data (e.g., login times, feature usage)\n- Device information (for biometric login or analytics)\n\nWe do NOT collect or store raw passwords. All sensitive data is encrypted before storage.",
      },
      {
        "title": "3. How We Use Your Data",
        "data":
            "We use your data to:\n- Authenticate and manage your account\n- Encrypt and store passwords securely\n- Provide cross-device sync (if enabled)\n- Improve the app experience through anonymized analytics",
      },
      {
        "title": "4. Data Encryption & Security",
        "data":
            "Your security is our top priority:\n- Passwords are encrypted using AES-256 before being saved in our database.\n- A master password is required to unlock your stored credentials — this is never shared or stored.\n- End-to-end encryption ensures your data is secure, even from us.",
      },
      {
        "title": "5. Third-Party Services",
        "data":
            "We do not sell or share your personal data with third parties. Any third-party services (e.g., cloud storage, crash reporting) are vetted for strong privacy standards.",
      },
      {
        "title": "6. Biometric Login",
        "data":
            "If you choose to enable biometric login (Face ID, fingerprint), your biometric data is never stored or transmitted. Authentication is handled securely by your device.",
      },
      {
        "title": "7. User Control & Data Deletion",
        "data":
            "You have full control over your data. You can:\n- Update or delete stored passwords\n- Delete your account at any time, which removes all associated data from our servers\n- Request a backup or export of your data (encrypted)",
      },
      {
        "title": "8. Cookies & Analytics",
        "data":
            "We may use local storage and analytics tools to improve app performance. We do not use tracking cookies or serve ads.",
      },
      {
        "title": "9. Children's Privacy",
        "data":
            "Our app is not intended for users under 13. We do not knowingly collect data from children.",
      },
      {
        "title": "10. Changes to This Policy",
        "data":
            "We may update this policy from time to time. Users will be notified of significant changes via email or in-app notification.",
      },
      {
        "title": "11. Contact Us",
        "data":
            "If you have any questions about this policy, feel free to contact us at:\n\tsupport@nextpass.app",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
        scrolledUnderElevation: 0.0,
      ),
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: privacyData.map((data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionTitle(data["title"].toString()),
                SectionText(data["data"].toString()),
              ],
            );
          }).toList()
          ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class SectionText extends StatelessWidget {
  final String text;
  const SectionText(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        text,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
