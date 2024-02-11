// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_page_controller_alive.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$riverpodPageControllerAliveHash() =>
    r'c4ccfd986e8c1f964845069b3e9078cd432b288a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$RiverpodPageControllerAlive extends BuildlessNotifier<int> {
  late final int value;

  int build(
    int value,
  );
}

/// See also [RiverpodPageControllerAlive].
@ProviderFor(RiverpodPageControllerAlive)
const riverpodPageControllerAliveProvider = RiverpodPageControllerAliveFamily();

/// See also [RiverpodPageControllerAlive].
class RiverpodPageControllerAliveFamily extends Family<int> {
  /// See also [RiverpodPageControllerAlive].
  const RiverpodPageControllerAliveFamily();

  /// See also [RiverpodPageControllerAlive].
  RiverpodPageControllerAliveProvider call(
    int value,
  ) {
    return RiverpodPageControllerAliveProvider(
      value,
    );
  }

  @override
  RiverpodPageControllerAliveProvider getProviderOverride(
    covariant RiverpodPageControllerAliveProvider provider,
  ) {
    return call(
      provider.value,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'riverpodPageControllerAliveProvider';
}

/// See also [RiverpodPageControllerAlive].
class RiverpodPageControllerAliveProvider
    extends NotifierProviderImpl<RiverpodPageControllerAlive, int> {
  /// See also [RiverpodPageControllerAlive].
  RiverpodPageControllerAliveProvider(
    int value,
  ) : this._internal(
          () => RiverpodPageControllerAlive()..value = value,
          from: riverpodPageControllerAliveProvider,
          name: r'riverpodPageControllerAliveProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$riverpodPageControllerAliveHash,
          dependencies: RiverpodPageControllerAliveFamily._dependencies,
          allTransitiveDependencies:
              RiverpodPageControllerAliveFamily._allTransitiveDependencies,
          value: value,
        );

  RiverpodPageControllerAliveProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.value,
  }) : super.internal();

  final int value;

  @override
  int runNotifierBuild(
    covariant RiverpodPageControllerAlive notifier,
  ) {
    return notifier.build(
      value,
    );
  }

  @override
  Override overrideWith(RiverpodPageControllerAlive Function() create) {
    return ProviderOverride(
      origin: this,
      override: RiverpodPageControllerAliveProvider._internal(
        () => create()..value = value,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        value: value,
      ),
    );
  }

  @override
  NotifierProviderElement<RiverpodPageControllerAlive, int> createElement() {
    return _RiverpodPageControllerAliveProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RiverpodPageControllerAliveProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RiverpodPageControllerAliveRef on NotifierProviderRef<int> {
  /// The parameter `value` of this provider.
  int get value;
}

class _RiverpodPageControllerAliveProviderElement
    extends NotifierProviderElement<RiverpodPageControllerAlive, int>
    with RiverpodPageControllerAliveRef {
  _RiverpodPageControllerAliveProviderElement(super.provider);

  @override
  int get value => (origin as RiverpodPageControllerAliveProvider).value;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
