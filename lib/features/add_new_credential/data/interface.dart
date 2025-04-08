import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

abstract interface class CredentialInterface {
  Future<bool> createNewCredential(
    String siteUrl,
    String userName,
    String emailId,
    String titleController,
    String mobileNumber,
    String password,
    String categoryCred,
    String passwordChangeReminder,
  );
  Future<List<CredentialModel>> getAllCredentail();
  Future<List<CredentialModel>> searchCredential();
}
