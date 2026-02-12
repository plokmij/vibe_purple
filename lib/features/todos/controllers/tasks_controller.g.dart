// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TasksNotifier)
final tasksProvider = TasksNotifierProvider._();

final class TasksNotifierProvider
    extends $AsyncNotifierProvider<TasksNotifier, List<Task>> {
  TasksNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'tasksProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$tasksNotifierHash();

  @$internal
  @override
  TasksNotifier create() => TasksNotifier();
}

String _$tasksNotifierHash() => r'0714384c545a2a55a3512e894d34cfe066fb70cb';

abstract class _$TasksNotifier extends $AsyncNotifier<List<Task>> {
  FutureOr<List<Task>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Task>>, List<Task>>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<List<Task>>, List<Task>>,
        AsyncValue<List<Task>>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
