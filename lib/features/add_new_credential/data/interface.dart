import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

abstract interface class CredentialInterface {
  Future<bool> createNewCredeantial(CredentialModel newCredenatil);
  Future<List<CredentialModel>> getAllCredentail();
  Future<List<CredentialModel>> searchCredential();
}