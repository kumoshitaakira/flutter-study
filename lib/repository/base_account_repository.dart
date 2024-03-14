import 'package:demoapp/model/account_model.dart';

abstract class BaseAccountRepository {
  Future<List<AccountModel>> getAccounts();
  Future<void> createAccount({required AccountModel accountModel});
  Future<void> updateAccount({required AccountModel accountModel});
  Future<void> deleteAccount({required AccountModel accountModel});
}
