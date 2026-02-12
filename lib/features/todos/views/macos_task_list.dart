import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/features/todos/providers/providers.dart';
import 'package:purple_task/features/todos/views/macos_task_item.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosTaskList extends ConsumerWidget {
  const MacosTaskList({
    required this.categoryId,
    required this.filterType,
    super.key,
  });

  final int categoryId;
  /// 0 = planned/todo, 1 = all, 2 = completed
  final int filterType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);

    // Get tasks based on filter type
    final noDueDateTasks =
        ref.watch(noDueDateTasksInCategoryProvider(categoryId));
    final overdueTasks = ref.watch(overdueTasksInCategoryProvider(categoryId));
    final todayTasks = ref.watch(todayTasksInCategoryProvider(categoryId));
    final tomorrowTasks =
        ref.watch(tomorrowTasksInCategoryProvider(categoryId));
    final futureTasks = ref.watch(futureTasksInCategoryProvider(categoryId));
    final todayCompletedTasks =
        ref.watch(todayCompletedTasksInCategoryProvider(categoryId));
    final yesterdayCompletedTasks =
        ref.watch(yesterdayCompletedTasksInCategoryProvider(categoryId));
    final pastCompletedTasks =
        ref.watch(pastCompletedTasksInCategoryProvider(categoryId));

    // Build sections based on filter type
    final sections = <_TaskSection>[];

    switch (filterType) {
      case 0: // Planned/Todo
        if (noDueDateTasks.isNotEmpty) {
          sections.add(_TaskSection(tasks: noDueDateTasks));
        }
        if (overdueTasks.isNotEmpty) {
          sections.add(
            _TaskSection(title: tr.overdueTasksHeader, tasks: overdueTasks),
          );
        }
        if (todayTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.today, tasks: todayTasks));
        }
        if (tomorrowTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.tomorrow, tasks: tomorrowTasks));
        }
        if (futureTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.later, tasks: futureTasks));
        }
      case 1: // All tasks
        if (noDueDateTasks.isNotEmpty) {
          sections.add(_TaskSection(tasks: noDueDateTasks));
        }
        if (overdueTasks.isNotEmpty) {
          sections.add(
            _TaskSection(title: tr.overdueTasksHeader, tasks: overdueTasks),
          );
        }
        if (todayTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.today, tasks: todayTasks));
        }
        if (tomorrowTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.tomorrow, tasks: tomorrowTasks));
        }
        if (futureTasks.isNotEmpty) {
          sections.add(_TaskSection(title: tr.later, tasks: futureTasks));
        }
        if (todayCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedTodayTasksHeader,
              tasks: todayCompletedTasks,
            ),
          );
        }
        if (yesterdayCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedYesterdayTasksHeader,
              tasks: yesterdayCompletedTasks,
            ),
          );
        }
        if (pastCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedEarlierTasksHeader,
              tasks: pastCompletedTasks,
            ),
          );
        }
      case 2: // Completed only
        if (todayCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedTodayTasksHeader,
              tasks: todayCompletedTasks,
            ),
          );
        }
        if (yesterdayCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedYesterdayTasksHeader,
              tasks: yesterdayCompletedTasks,
            ),
          );
        }
        if (pastCompletedTasks.isNotEmpty) {
          sections.add(
            _TaskSection(
              title: tr.completedEarlierTasksHeader,
              tasks: pastCompletedTasks,
            ),
          );
        }
    }

    if (sections.isEmpty) {
      return const SizedBox.shrink();
    }

    return MacosScrollbar(
      child: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: sections.length,
        itemBuilder: (context, sectionIndex) {
          final section = sections[sectionIndex];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (section.title != null)
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    section.title!,
                    style: MacosTheme.of(context).typography.headline,
                  ),
                ),
              ...section.tasks.map(
                (task) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: MacosTaskItem(task: task),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _TaskSection {
  const _TaskSection({this.title, required this.tasks});
  final String? title;
  final List<dynamic> tasks;
}
