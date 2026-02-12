// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'controllers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MigrationStateController)
final migrationStateControllerProvider = MigrationStateControllerProvider._();

final class MigrationStateControllerProvider
    extends $NotifierProvider<MigrationStateController, MigrationState> {
  MigrationStateControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'migrationStateControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$migrationStateControllerHash();

  @$internal
  @override
  MigrationStateController create() => MigrationStateController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MigrationState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MigrationState>(value),
    );
  }
}

String _$migrationStateControllerHash() =>
    r'47077c85c1da9537825392eb503eb03daf089a5f';

abstract class _$MigrationStateController extends $Notifier<MigrationState> {
  MigrationState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MigrationState, MigrationState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MigrationState, MigrationState>,
        MigrationState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
