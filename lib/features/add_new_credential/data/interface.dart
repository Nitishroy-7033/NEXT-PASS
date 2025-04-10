import '../../../core/constants/app_linker.dart';

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
