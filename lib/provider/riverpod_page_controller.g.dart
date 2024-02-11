// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'riverpod_page_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$riverpodPageControllerHash() =>
    r'1d095fd079de64bad84e40f24b7a6291c13593cb';

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

abstract class _$RiverpodPageController
    extends BuildlessAutoDisposeNotifier<int> {
  late final int value;

  int build(
    int value,
  );
}

/// See also [RiverpodPageController].
@ProviderFor(RiverpodPageController)
const riverpodPageControllerProvider = RiverpodPageControllerFamily();

/// See also [RiverpodPageController].
class RiverpodPageControllerFamily extends Family<int> {
  /// See also [RiverpodPageController].
  const RiverpodPageControllerFamily();

  /// See also [RiverpodPageController].
  RiverpodPageControllerProvider call(
    int value,
  ) {
    return RiverpodPageControllerProvider(
      value,
    );
  }

  @override
  RiverpodPageControllerProvider getProviderOverride(
    covariant RiverpodPageControllerProvider provider,
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
  String? get name => r'riverpodPageControllerProvider';
}

/// See also [RiverpodPageController].
class RiverpodPageControllerProvider
    extends AutoDisposeNotifierProviderImpl<RiverpodPageController, int> {
  /// See also [RiverpodPageController].
  RiverpodPageControllerProvider(
    int value,
  ) : this._internal(
          () => RiverpodPageController()..value = value,
          from: riverpodPageControllerProvider,
          name: r'riverpodPageControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$riverpodPageControllerHash,
          dependencies: RiverpodPageControllerFamily._dependencies,
          allTransitiveDependencies:
              RiverpodPageControllerFamily._allTransitiveDependencies,
          value: value,
        );

  RiverpodPageControllerProvider._internal(
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
    covariant RiverpodPageController notifier,
  ) {
    return notifier.build(
      value,
    );
  }

  @override
  Override overrideWith(RiverpodPageController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RiverpodPageControllerProvider._internal(
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
  AutoDisposeNotifierProviderElement<RiverpodPageController, int>
      createElement() {
    return _RiverpodPageControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RiverpodPageControllerProvider && other.value == value;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, value.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin RiverpodPageControllerRef on AutoDisposeNotifierProviderRef<int> {
  /// The parameter `value` of this provider.
  int get value;
}

class _RiverpodPageControllerProviderElement
    extends AutoDisposeNotifierProviderElement<RiverpodPageController, int>
    with RiverpodPageControllerRef {
  _RiverpodPageControllerProviderElement(super.provider);

  @override
  int get value => (origin as RiverpodPageControllerProvider).value;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
