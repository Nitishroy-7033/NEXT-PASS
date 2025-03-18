import 'package:next_pass/features/add_new_credential/models/new_credenatial.dart';

abstract interface class CredentialInterface {
<<<<<<< HEAD
  Future<bool> createNewCredential(String siteUrl, String userName,
      String emailId, String mobileNumber, String password);
=======
  Future<bool> createNewCredential(
      String siteUrl, String userName, String emailId, String mobileNumber, String password);
>>>>>>> 11329ca341e15bcebc644df914a1d8a6caffdbd3
  Future<List<CredentialModel>> getAllCredentail();
  Future<List<CredentialModel>> searchCredential();
}
