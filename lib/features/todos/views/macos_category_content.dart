import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/styles/macos_themes.dart';
import 'package:purple_task/features/todos/controllers/categories_controller.dart';
import 'package:purple_task/features/todos/controllers/tasks_controller.dart';
import 'package:purple_task/features/todos/models/category.dart';
import 'package:purple_task/features/todos/models/task.dart';
import 'package:purple_task/features/todos/views/macos_add_task_field.dart';
import 'package:purple_task/features/todos/views/macos_task_list.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosCategoryContent extends ConsumerStatefulWidget {
  const MacosCategoryContent({required this.category, super.key});

  final Category category;

  @override
  ConsumerState<MacosCategoryContent> createState() =>
      _MacosCategoryContentState();
}

class _MacosCategoryContentState extends ConsumerState<MacosCategoryContent> {
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
    final currentCategory = ref
        .watch(categoriesProvider)
        .value
        ?.firstWhere((element) => element.id == widget.category.id);

    if (currentCategory == null) {
      return const Center(child: ProgressCircle());
    }

    final brightness = MacosTheme.of(context).brightness;
    final backgroundColor = PurpleMacosTheme.getContentBackground(brightness);
    final dividerColor = PurpleMacosTheme.getSectionDividerColor(brightness);

    return ColoredBox(
      color: backgroundColor,
      child: Column(
        children: [
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
              categoryId: currentCategory.id,
              filterType: _tabController.index,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: dividerColor, width: 1),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: MacosAddTaskField(
              onAddTask: (value) {
                final task = Task(
                  name: value,
                  categoryId: currentCategory.id,
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
