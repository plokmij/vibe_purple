// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(settingsMigrator)
final settingsMigratorProvider = SettingsMigratorProvider._();

final class SettingsMigratorProvider extends $FunctionalProvider<
    SettingsMigrator,
    SettingsMigrator,
    SettingsMigrator> with $Provider<SettingsMigrator> {
  SettingsMigratorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingsMigratorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingsMigratorHash();

  @$internal
  @override
  $ProviderElement<SettingsMigrator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SettingsMigrator create(Ref ref) {
    return settingsMigrator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsMigrator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsMigrator>(value),
    );
  }
}

String _$settingsMigratorHash() => r'a777daf1c374cdd9997a8c5e413358db44177e7b';

@ProviderFor(categoriesMigrator)
final categoriesMigratorProvider = CategoriesMigratorProvider._();

final class CategoriesMigratorProvider extends $FunctionalProvider<
    CategoriesMigrator,
    CategoriesMigrator,
    CategoriesMigrator> with $Provider<CategoriesMigrator> {
  CategoriesMigratorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'categoriesMigratorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$categoriesMigratorHash();

  @$internal
  @override
  $ProviderElement<CategoriesMigrator> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CategoriesMigrator create(Ref ref) {
    return categoriesMigrator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CategoriesMigrator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CategoriesMigrator>(value),
    );
  }
}

String _$categoriesMigratorHash() =>
    r'c35b7d7a0c7a0e546b3dec2c1ea13a111a66fd81';

@ProviderFor(tasksMigrator)
final tasksMigratorProvider = TasksMigratorProvider._();

final class TasksMigratorProvider
    extends $FunctionalProvider<TasksMigrator, TasksMigrator, TasksMigrator>
    with $Provider<TasksMigrator> {
  TasksMigratorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tasksMigratorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tasksMigratorHash();

  @$internal
  @override
  $ProviderElement<TasksMigrator> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  TasksMigrator create(Ref ref) {
    return tasksMigrator(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(TasksMigrator value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<TasksMigrator>(value),
    );
  }
}

String _$tasksMigratorHash() => r'84ee3ab26917e4de6e7c737bc6c750957dae4f34';

@ProviderFor(needsMigrationFromHive)
final needsMigrationFromHiveProvider = NeedsMigrationFromHiveProvider._();

final class NeedsMigrationFromHiveProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, FutureOr<bool>>
    with $FutureModifier<bool>, $FutureProvider<bool> {
  NeedsMigrationFromHiveProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'needsMigrationFromHiveProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$needsMigrationFromHiveHash();

  @$internal
  @override
  $FutureProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<bool> create(Ref ref) {
    return needsMigrationFromHive(ref);
  }
}

String _$needsMigrationFromHiveHash() =>
    r'bd1bba51f691cc22613f08fc70fcd8d7c6d85f12';
