import 'package:demoapp/custom_exception.dart';
import 'package:demoapp/model/account_model.dart';
import 'package:demoapp/provider/firebase_auth.dart';
import 'package:demoapp/repository/account_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_controller.g.dart';

@riverpod
AccountRepository accountRepository(AccountRepositoryRef ref) =>
    AccountRepository(ref);

@Riverpod(dependencies: [accountRepository])
class AccountController extends _$AccountController {
  @override
  Future<List<AccountModel>> build() async {
    if (ref.watch(firebaseAuthProvider).currentUser != null) {
      return await getAccounts();
    }
    return const [];
  }

  Future<List<AccountModel>> getAccounts({
    bool isRefresh = false,
  }) async {
    if (isRefresh) {
      state = const AsyncValue.loading();
    }

    try {
      final accountList =
          await ref.read(accountRepositoryProvider).getAccounts();
      return accountList;
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }

  Future<void> createAccount({
    required String id,
    required String userName,
    required DateTime birthDay,
  }) async {
    try {
      final account = AccountModel(
        id: id,
        userName: userName,
        birthDay: birthDay,
      );
      await ref
          .read(accountRepositoryProvider)
          .createAccount(accountModel: account);

      state.whenData((value) => state =
          AsyncValue.data(value..add(account.copyWith(id: account.id))));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateAccount({
    required String id,
    required String userName,
    required DateTime birthDay,
  }) async {
    try {
      final updateAccount = AccountModel(
        id: id,
        userName: userName,
        birthDay: birthDay,
      );
      await ref
          .read(accountRepositoryProvider)
          .updateAccount(accountModel: updateAccount);

      state.whenData((value) => state = AsyncValue.data([
            for (final account in value)
              if (account.id == updateAccount.id) updateAccount else account
            // account.id == updateAccount.id ? updateAccount : account
          ]));
    } on CustomException catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
