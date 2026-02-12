import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Divider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/styles/macos_themes.dart';
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
    final brightness = MacosTheme.of(context).brightness;
    final sectionHeaderColor = PurpleMacosTheme.getSectionHeaderColor(brightness);
    final dividerColor = PurpleMacosTheme.getSectionDividerColor(brightness);
    final cardBackground = PurpleMacosTheme.getCardBackground(brightness);

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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        itemCount: sections.length,
        itemBuilder: (context, sectionIndex) {
          final section = sections[sectionIndex];
          return Padding(
            padding: EdgeInsets.only(
              top: sectionIndex == 0 ? 8 : 20,
              bottom: sectionIndex == sections.length - 1 ? 8 : 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (section.title != null)
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      bottom: 8,
                    ),
                    child: Text(
                      section.title!.toUpperCase(),
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.5,
                        color: sectionHeaderColor,
                      ),
                    ),
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: cardBackground,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: dividerColor,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    children: [
                      for (int i = 0; i < section.tasks.length; i++) ...[
                        MacosTaskItem(task: section.tasks[i]),
                        if (i < section.tasks.length - 1)
                          Padding(
                            padding: const EdgeInsets.only(left: 44),
                            child: Divider(
                              height: 1,
                              thickness: 0.5,
                              color: dividerColor,
                            ),
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
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
