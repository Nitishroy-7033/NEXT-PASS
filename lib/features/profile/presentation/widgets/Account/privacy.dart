// import '../../../../../core/constants/app_linker.dart';

// class Privacy extends StatelessWidget {
//   const Privacy({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }




import 'package:flutter/material.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy Policy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            SectionTitle('1. Introduction'),
            SectionText(
                'Welcome to Next-Pass. Your privacy is extremely important to us. This Privacy Policy outlines how we collect, use, protect, and store your data when you use our password manager app.'),

            SectionTitle('2. Data We Collect'),
            SectionText(
                'We collect minimal personal information necessary to provide our services. This may include:\n- Your name and email address (for account creation)\n- Encrypted passwords and credentials\n- Usage data (e.g., login times, feature usage)\n- Device information (for biometric login or analytics)\n\nWe do NOT collect or store raw passwords. All sensitive data is encrypted before storage.'),

            SectionTitle('3. How We Use Your Data'),
            SectionText(
                'We use your data to:\n- Authenticate and manage your account\n- Encrypt and store passwords securely\n- Provide cross-device sync (if enabled)\n- Improve the app experience through anonymized analytics'),

            SectionTitle('4. Data Encryption & Security'),
            SectionText(
                'Your security is our top priority:\n- Passwords are encrypted using AES-256 before being saved in our database.\n- A master password is required to unlock your stored credentials — this is never shared or stored.\n- End-to-end encryption ensures your data is secure, even from us.'),

            SectionTitle('5. Third-Party Services'),
            SectionText(
                'We do not sell or share your personal data with third parties. Any third-party services (e.g., cloud storage, crash reporting) are vetted for strong privacy standards.'),

            SectionTitle('6. Biometric Login'),
            SectionText(
                'If you choose to enable biometric login (Face ID, fingerprint), your biometric data is never stored or transmitted. Authentication is handled securely by your device.'),

            SectionTitle('7. User Control & Data Deletion'),
            SectionText(
                'You have full control over your data. You can:\n- Update or delete stored passwords\n- Delete your account at any time, which removes all associated data from our servers\n- Request a backup or export of your data (encrypted)'),

            SectionTitle('8. Cookies & Analytics'),
            SectionText(
                'We may use local storage and analytics tools to improve app performance. We do not use tracking cookies or serve ads.'),

            SectionTitle("9. Children's Privacy"),
            SectionText(
                'Our app is not intended for users under 13. We do not knowingly collect data from children.'),

            SectionTitle('10. Changes to This Policy'),
            SectionText(
                'We may update this policy from time to time. Users will be notified of significant changes via email or in-app notification.'),

            SectionTitle('11. Contact Us'),
            SectionText(
                'If you have any questions about this policy, feel free to contact us at:\nsupport@nextpass.app'),
          ],
        ),
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
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
        style: const TextStyle(fontSize: 16),
     ),
);
}
}