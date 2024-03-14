import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoapp/custom_exception.dart';
import 'package:demoapp/model/account_model.dart';
import 'package:demoapp/provider/firebase_firestore.dart';
import 'package:demoapp/repository/base_account_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension FirebaseFirestoreX on FirebaseFirestore {
  CollectionReference<Map<String, dynamic>> idListRef() =>
      collection('account');
}

class AccountRepository implements BaseAccountRepository {
  const AccountRepository(this.ref);

  final Ref ref;

  @override
  Future<List<AccountModel>> getAccounts() async {
    try {
      final accountList =
          await ref.read(firebaseFirestoreProvider).idListRef().get();
      return accountList.docs.map(AccountModel.fromDocument).toList();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> createAccount({required AccountModel accountModel}) async {
    try {
      await ref
          .read(firebaseFirestoreProvider)
          .idListRef()
          .doc(accountModel.id)
          .set(accountModel.toJson());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> updateAccount({required AccountModel accountModel}) async {
    try {
      await ref
          .read(firebaseFirestoreProvider)
          .idListRef()
          .doc(accountModel.id)
          .update(accountModel.toJson());
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }

  @override
  Future<void> deleteAccount({required AccountModel accountModel}) async {
    try {
      await ref
          .read(firebaseFirestoreProvider)
          .idListRef()
          .doc(accountModel.id)
          .delete();
    } on FirebaseException catch (e) {
      throw CustomException(message: e.message);
    }
  }
}
