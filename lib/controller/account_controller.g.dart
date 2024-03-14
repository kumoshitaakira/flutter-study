// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$accountRepositoryHash() => r'637487a27d1d97c124897273cac7b44a509d1aed';

/// See also [accountRepository].
@ProviderFor(accountRepository)
final accountRepositoryProvider =
    AutoDisposeProvider<AccountRepository>.internal(
  accountRepository,
  name: r'accountRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef AccountRepositoryRef = AutoDisposeProviderRef<AccountRepository>;
String _$accountControllerHash() => r'f65f961cdedd6c39205a6b51b41a476438f40e4d';

/// See also [AccountController].
@ProviderFor(AccountController)
final accountControllerProvider = AutoDisposeAsyncNotifierProvider<
    AccountController, List<AccountModel>>.internal(
  AccountController.new,
  name: r'accountControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$accountControllerHash,
  dependencies: <ProviderOrFamily>[accountRepositoryProvider],
  allTransitiveDependencies: <ProviderOrFamily>{
    accountRepositoryProvider,
    ...?accountRepositoryProvider.allTransitiveDependencies
  },
);

typedef _$AccountController = AutoDisposeAsyncNotifier<List<AccountModel>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
