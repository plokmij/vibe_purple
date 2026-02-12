import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/features/todos/controllers/tasks_controller.dart';
import 'package:purple_task/features/todos/models/task.dart';
import 'package:purple_task/features/todos/providers/providers.dart';
import 'package:purple_task/features/todos/views/macos_add_task_field.dart';
import 'package:purple_task/features/todos/views/macos_task_list.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosUncategorizedContent extends ConsumerStatefulWidget {
  const MacosUncategorizedContent({super.key});

  @override
  ConsumerState<MacosUncategorizedContent> createState() =>
      _MacosUncategorizedContentState();
}

class _MacosUncategorizedContentState
    extends ConsumerState<MacosUncategorizedContent> {
  late MacosTabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = MacosTabController(initialIndex: 0, length: 3);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final uncategorizedTasks = ref.watch(uncategorizedTasksProvider);
    final brightness = MacosTheme.of(context).brightness;
    final backgroundColor = brightness == Brightness.dark
        ? const Color(0xFF2D2D2D)
        : CupertinoColors.systemBackground;

    return ColoredBox(
      color: backgroundColor,
      child: Column(
        children: [
          if (uncategorizedTasks.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8),
              child: MacosSegmentedControl(
                tabs: [
                  MacosTab(label: tr.toDoTasksHeader),
                  MacosTab(label: tr.allTasksHeader),
                  MacosTab(label: tr.completedTasksHeader),
                ],
                controller: _tabController,
              ),
            ),
          Expanded(
            child: MacosTaskList(
              categoryId: -1,
              filterType: _tabController.index,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: MacosAddTaskField(
              onAddTask: (value) {
                final task = Task(
                  name: value,
                  categoryId: -1,
                  createTime: DateTime.now().millisecondsSinceEpoch,
                );
                ref.read(tasksProvider.notifier).add(task: task);
              },
            ),
          ),
        ],
      ),
    );
  }
}
