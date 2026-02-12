// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NewCategoryNotifier)
final newCategoryProvider = NewCategoryNotifierProvider._();

final class NewCategoryNotifierProvider
    extends $NotifierProvider<NewCategoryNotifier, NewCategoryState> {
  NewCategoryNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'newCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$newCategoryNotifierHash();

  @$internal
  @override
  NewCategoryNotifier create() => NewCategoryNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NewCategoryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NewCategoryState>(value),
    );
  }
}

String _$newCategoryNotifierHash() =>
    r'b993092b381d48cb85bf0990b65b4b14c085aeb0';

abstract class _$NewCategoryNotifier extends $Notifier<NewCategoryState> {
  NewCategoryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NewCategoryState, NewCategoryState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<NewCategoryState, NewCategoryState>,
        NewCategoryState,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
