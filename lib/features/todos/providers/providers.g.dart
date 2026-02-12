// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NoDueDateTasksInCategory)
final noDueDateTasksInCategoryProvider = NoDueDateTasksInCategoryFamily._();

final class NoDueDateTasksInCategoryProvider
    extends $NotifierProvider<NoDueDateTasksInCategory, List<Task>> {
  NoDueDateTasksInCategoryProvider._(
      {required NoDueDateTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'noDueDateTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$noDueDateTasksInCategoryHash();

  @override
  String toString() {
    return r'noDueDateTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  NoDueDateTasksInCategory create() => NoDueDateTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NoDueDateTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$noDueDateTasksInCategoryHash() =>
    r'955ab24c9ce07b80205d5ed9bb9528210c9265ca';

final class NoDueDateTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<NoDueDateTasksInCategory, List<Task>, List<Task>,
            List<Task>, int> {
  NoDueDateTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'noDueDateTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NoDueDateTasksInCategoryProvider call(
    int categoryId,
  ) =>
      NoDueDateTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'noDueDateTasksInCategoryProvider';
}

abstract class _$NoDueDateTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(OverdueTasksInCategory)
final overdueTasksInCategoryProvider = OverdueTasksInCategoryFamily._();

final class OverdueTasksInCategoryProvider
    extends $NotifierProvider<OverdueTasksInCategory, List<Task>> {
  OverdueTasksInCategoryProvider._(
      {required OverdueTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'overdueTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$overdueTasksInCategoryHash();

  @override
  String toString() {
    return r'overdueTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  OverdueTasksInCategory create() => OverdueTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is OverdueTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$overdueTasksInCategoryHash() =>
    r'e3bb599b9baab91c01b406ed38f8c35b772163e8';

final class OverdueTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<OverdueTasksInCategory, List<Task>, List<Task>,
            List<Task>, int> {
  OverdueTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'overdueTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  OverdueTasksInCategoryProvider call(
    int categoryId,
  ) =>
      OverdueTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'overdueTasksInCategoryProvider';
}

abstract class _$OverdueTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(TodayTasksInCategory)
final todayTasksInCategoryProvider = TodayTasksInCategoryFamily._();

final class TodayTasksInCategoryProvider
    extends $NotifierProvider<TodayTasksInCategory, List<Task>> {
  TodayTasksInCategoryProvider._(
      {required TodayTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'todayTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todayTasksInCategoryHash();

  @override
  String toString() {
    return r'todayTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TodayTasksInCategory create() => TodayTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TodayTasksInCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todayTasksInCategoryHash() =>
    r'11593ab944967b182bd816511867af5510768714';

final class TodayTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<TodayTasksInCategory, List<Task>, List<Task>,
            List<Task>, int> {
  TodayTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'todayTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TodayTasksInCategoryProvider call(
    int categoryId,
  ) =>
      TodayTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'todayTasksInCategoryProvider';
}

abstract class _$TodayTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(TomorrowTasksInCategory)
final tomorrowTasksInCategoryProvider = TomorrowTasksInCategoryFamily._();

final class TomorrowTasksInCategoryProvider
    extends $NotifierProvider<TomorrowTasksInCategory, List<Task>> {
  TomorrowTasksInCategoryProvider._(
      {required TomorrowTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'tomorrowTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tomorrowTasksInCategoryHash();

  @override
  String toString() {
    return r'tomorrowTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TomorrowTasksInCategory create() => TomorrowTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TomorrowTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$tomorrowTasksInCategoryHash() =>
    r'98f7e318b5401e0f31bac981dce51e9d034fa361';

final class TomorrowTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<TomorrowTasksInCategory, List<Task>, List<Task>,
            List<Task>, int> {
  TomorrowTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'tomorrowTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TomorrowTasksInCategoryProvider call(
    int categoryId,
  ) =>
      TomorrowTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'tomorrowTasksInCategoryProvider';
}

abstract class _$TomorrowTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(FutureTasksInCategory)
final futureTasksInCategoryProvider = FutureTasksInCategoryFamily._();

final class FutureTasksInCategoryProvider
    extends $NotifierProvider<FutureTasksInCategory, List<Task>> {
  FutureTasksInCategoryProvider._(
      {required FutureTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'futureTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$futureTasksInCategoryHash();

  @override
  String toString() {
    return r'futureTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  FutureTasksInCategory create() => FutureTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FutureTasksInCategoryProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$futureTasksInCategoryHash() =>
    r'b41e361f4f1543603ffcbc89c642a0632fd0bea6';

final class FutureTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<FutureTasksInCategory, List<Task>, List<Task>,
            List<Task>, int> {
  FutureTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'futureTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  FutureTasksInCategoryProvider call(
    int categoryId,
  ) =>
      FutureTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'futureTasksInCategoryProvider';
}

abstract class _$FutureTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(TodayCompletedTasksInCategory)
final todayCompletedTasksInCategoryProvider =
    TodayCompletedTasksInCategoryFamily._();

final class TodayCompletedTasksInCategoryProvider
    extends $NotifierProvider<TodayCompletedTasksInCategory, List<Task>> {
  TodayCompletedTasksInCategoryProvider._(
      {required TodayCompletedTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'todayCompletedTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$todayCompletedTasksInCategoryHash();

  @override
  String toString() {
    return r'todayCompletedTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TodayCompletedTasksInCategory create() => TodayCompletedTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TodayCompletedTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$todayCompletedTasksInCategoryHash() =>
    r'a847508c52907d12eeaf8a39e5b149191d3e50f9';

final class TodayCompletedTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<TodayCompletedTasksInCategory, List<Task>,
            List<Task>, List<Task>, int> {
  TodayCompletedTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'todayCompletedTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  TodayCompletedTasksInCategoryProvider call(
    int categoryId,
  ) =>
      TodayCompletedTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'todayCompletedTasksInCategoryProvider';
}

abstract class _$TodayCompletedTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(YesterdayCompletedTasksInCategory)
final yesterdayCompletedTasksInCategoryProvider =
    YesterdayCompletedTasksInCategoryFamily._();

final class YesterdayCompletedTasksInCategoryProvider
    extends $NotifierProvider<YesterdayCompletedTasksInCategory, List<Task>> {
  YesterdayCompletedTasksInCategoryProvider._(
      {required YesterdayCompletedTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'yesterdayCompletedTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() =>
      _$yesterdayCompletedTasksInCategoryHash();

  @override
  String toString() {
    return r'yesterdayCompletedTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  YesterdayCompletedTasksInCategory create() =>
      YesterdayCompletedTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is YesterdayCompletedTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$yesterdayCompletedTasksInCategoryHash() =>
    r'7d280bd054d3afb9bb0736a4abdbba186b396974';

final class YesterdayCompletedTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<YesterdayCompletedTasksInCategory, List<Task>,
            List<Task>, List<Task>, int> {
  YesterdayCompletedTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'yesterdayCompletedTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  YesterdayCompletedTasksInCategoryProvider call(
    int categoryId,
  ) =>
      YesterdayCompletedTasksInCategoryProvider._(
          argument: categoryId, from: this);

  @override
  String toString() => r'yesterdayCompletedTasksInCategoryProvider';
}

abstract class _$YesterdayCompletedTasksInCategory
    extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(PastCompletedTasksInCategory)
final pastCompletedTasksInCategoryProvider =
    PastCompletedTasksInCategoryFamily._();

final class PastCompletedTasksInCategoryProvider
    extends $NotifierProvider<PastCompletedTasksInCategory, List<Task>> {
  PastCompletedTasksInCategoryProvider._(
      {required PastCompletedTasksInCategoryFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'pastCompletedTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$pastCompletedTasksInCategoryHash();

  @override
  String toString() {
    return r'pastCompletedTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  PastCompletedTasksInCategory create() => PastCompletedTasksInCategory();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is PastCompletedTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$pastCompletedTasksInCategoryHash() =>
    r'c218feab95a7771fe409c35ab684a2d5aef23d6d';

final class PastCompletedTasksInCategoryFamily extends $Family
    with
        $ClassFamilyOverride<PastCompletedTasksInCategory, List<Task>,
            List<Task>, List<Task>, int> {
  PastCompletedTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'pastCompletedTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  PastCompletedTasksInCategoryProvider call(
    int categoryId,
  ) =>
      PastCompletedTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'pastCompletedTasksInCategoryProvider';
}

abstract class _$PastCompletedTasksInCategory extends $Notifier<List<Task>> {
  late final _$args = ref.$arg as int;
  int get categoryId => _$args;

  List<Task> build(
    int categoryId,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<Task>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<List<Task>, List<Task>>, List<Task>, Object?, Object?>;
    element.handleCreate(
        ref,
        () => build(
              _$args,
            ));
  }
}

@ProviderFor(numberOfAllActiveTasks)
final numberOfAllActiveTasksProvider = NumberOfAllActiveTasksProvider._();

final class NumberOfAllActiveTasksProvider
    extends $FunctionalProvider<int, int, int> with $Provider<int> {
  NumberOfAllActiveTasksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'numberOfAllActiveTasksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$numberOfAllActiveTasksHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return numberOfAllActiveTasks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$numberOfAllActiveTasksHash() =>
    r'719f041b69dcf6d7eb7a7c5c1685f3f9d37f1628';

@ProviderFor(uncategorizedTasks)
final uncategorizedTasksProvider = UncategorizedTasksProvider._();

final class UncategorizedTasksProvider
    extends $FunctionalProvider<List<Task>, List<Task>, List<Task>>
    with $Provider<List<Task>> {
  UncategorizedTasksProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'uncategorizedTasksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$uncategorizedTasksHash();

  @$internal
  @override
  $ProviderElement<List<Task>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Task> create(Ref ref) {
    return uncategorizedTasks(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Task> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Task>>(value),
    );
  }
}

String _$uncategorizedTasksHash() =>
    r'4013d9e97aa3b92db43ebc03e1de7430fecea4e3';

@ProviderFor(numberOfActiveTasksInCategory)
final numberOfActiveTasksInCategoryProvider =
    NumberOfActiveTasksInCategoryFamily._();

final class NumberOfActiveTasksInCategoryProvider
    extends $FunctionalProvider<int, int, int> with $Provider<int> {
  NumberOfActiveTasksInCategoryProvider._(
      {required NumberOfActiveTasksInCategoryFamily super.from,
      required int? super.argument})
      : super(
          retry: null,
          name: r'numberOfActiveTasksInCategoryProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$numberOfActiveTasksInCategoryHash();

  @override
  String toString() {
    return r'numberOfActiveTasksInCategoryProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as int?;
    return numberOfActiveTasksInCategory(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is NumberOfActiveTasksInCategoryProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$numberOfActiveTasksInCategoryHash() =>
    r'5117cb5433e813fcbe37446632c0763e38ff9a19';

final class NumberOfActiveTasksInCategoryFamily extends $Family
    with $FunctionalFamilyOverride<int, int?> {
  NumberOfActiveTasksInCategoryFamily._()
      : super(
          retry: null,
          name: r'numberOfActiveTasksInCategoryProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  NumberOfActiveTasksInCategoryProvider call(
    int? categoryId,
  ) =>
      NumberOfActiveTasksInCategoryProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'numberOfActiveTasksInCategoryProvider';
}

@ProviderFor(completionProgress)
final completionProgressProvider = CompletionProgressFamily._();

final class CompletionProgressProvider
    extends $FunctionalProvider<double, double, double> with $Provider<double> {
  CompletionProgressProvider._(
      {required CompletionProgressFamily super.from,
      required int super.argument})
      : super(
          retry: null,
          name: r'completionProgressProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$completionProgressHash();

  @override
  String toString() {
    return r'completionProgressProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    final argument = this.argument as int;
    return completionProgress(
      ref,
      argument,
    );
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CompletionProgressProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$completionProgressHash() =>
    r'1756a0d46961b8765f18fdca1869bd71f065e82d';

final class CompletionProgressFamily extends $Family
    with $FunctionalFamilyOverride<double, int> {
  CompletionProgressFamily._()
      : super(
          retry: null,
          name: r'completionProgressProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CompletionProgressProvider call(
    int categoryId,
  ) =>
      CompletionProgressProvider._(argument: categoryId, from: this);

  @override
  String toString() => r'completionProgressProvider';
}

@ProviderFor(appBackgroundColor)
final appBackgroundColorProvider = AppBackgroundColorProvider._();

final class AppBackgroundColorProvider
    extends $FunctionalProvider<Color, Color, Color> with $Provider<Color> {
  AppBackgroundColorProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appBackgroundColorProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appBackgroundColorHash();

  @$internal
  @override
  $ProviderElement<Color> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Color create(Ref ref) {
    return appBackgroundColor(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Color value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Color>(value),
    );
  }
}

String _$appBackgroundColorHash() =>
    r'acbf96cc00128f489e688f83fea140e606ea9e00';
