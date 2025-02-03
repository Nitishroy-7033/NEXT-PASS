import 'package:flutter/widgets.dart';
import 'package:next_pass/core/utils/responsive.dart';
import 'package:next_pass/features/add_new_credential/presentation/screens/mobile_add_new_credential.dart';
import 'package:next_pass/features/add_new_credential/presentation/screens/web_add_new_credential.dart';

class ViewAddNewCredential extends StatelessWidget {
  const ViewAddNewCredential({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
        mobile: MobileAddNewCredential(),
        tablet: MobileAddNewCredential(),
        desktop: WebAddNewCredential());
  }
}
