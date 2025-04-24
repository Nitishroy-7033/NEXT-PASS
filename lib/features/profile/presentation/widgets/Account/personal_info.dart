import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_pass/features/profile/controllers/getx/profile_controller.dart';
import 'package:next_pass/features/profile/presentation/widgets/profile_header/profile_header_section.dart';

class PersonalInfoPage extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  PersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("Personal Info"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Profile header
            ProfileHeaderSection(profileController: profileController),
            const SizedBox(height: 24),

            // Stylish info cards
            Obx(() {
              final profile = profileController.profileModel.value;
              return Column(
                children: [
                  Obx(() {
                    final profile = profileController.profileModel.value;
                    final fullName =
                        "${profile?.firstName ?? ""} ${profile?.lastName ?? ""}"
                            .trim();

                    return Column(
                      children: [
                        InfoCard(
                          icon: Icons.person,
                          label: "Name",
                          value: fullName.isNotEmpty ? fullName : "N/A",
                        ),
                        InfoCard(
                          icon: Icons.email,
                          label: "Email",
                          value: profile?.email ?? "N/A",
                        ),
                      ],
                    );
                  }),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(value),
      ),
    );
  }
}
