import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

abstract class CredentialInterface {
  Future<List<CredentialModel>> getAllCredentials();
}
