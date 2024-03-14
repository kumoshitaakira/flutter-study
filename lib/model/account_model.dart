import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel implements _$AccountModel {
  const factory AccountModel({
    required String id,
    required String userName,
    required DateTime birthDay,
  }) = _AccountModel;

  factory AccountModel.empty() =>
      AccountModel(id: '', userName: '', birthDay: DateTime.now());

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);

  factory AccountModel.fromDocument(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data()!;
    return AccountModel.fromJson(data).copyWith(id: doc.id);
  }
}
