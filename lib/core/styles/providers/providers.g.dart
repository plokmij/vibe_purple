// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(savedTheme)
final savedThemeProvider = SavedThemeProvider._();

final class SavedThemeProvider extends $FunctionalProvider<
        AsyncValue<AppThemeMode>, AppThemeMode, FutureOr<AppThemeMode>>
    with $FutureModifier<AppThemeMode>, $FutureProvider<AppThemeMode> {
  SavedThemeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'savedThemeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$savedThemeHash();

  @$internal
  @override
  $FutureProviderElement<AppThemeMode> $createElement(
          $ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppThemeMode> create(Ref ref) {
    return savedTheme(ref);
  }
}

String _$savedThemeHash() => r'4f2c344c408f00ff2c1e9a1268fc5ddf631bea2e';

@ProviderFor(AppTheme)
final appThemeProvider = AppThemeProvider._();

final class AppThemeProvider extends $NotifierProvider<AppTheme, ThemeMode> {
  AppThemeProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appThemeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appThemeHash();

  @$internal
  @override
  AppTheme create() => AppTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$appThemeHash() => r'63b5f29ffe157930e2a47286ae2411ea80b7e68e';

abstract class _$AppTheme extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ThemeMode, ThemeMode>, ThemeMode, Object?, Object?>;
    element.handleCreate(ref, build);
  }
}
