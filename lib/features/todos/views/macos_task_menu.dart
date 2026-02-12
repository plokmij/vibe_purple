import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/features/todos/controllers/categories_controller.dart';
import 'package:purple_task/features/todos/controllers/tasks_controller.dart';
import 'package:purple_task/features/todos/models/task.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosTaskMenu extends ConsumerWidget {
  const MacosTaskMenu({required this.task, super.key});

  final Task task;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final categories = ref.watch(categoriesProvider);
    final otherCategories =
        categories.value?.where((element) => element.id != task.categoryId);

    return MacosPulldownButton(
      icon: CupertinoIcons.ellipsis,
      items: [
        MacosPulldownMenuItem(
          title: Text(tr.delete),
          onTap: () => ref.read(tasksProvider.notifier).remove(taskId: task.id!),
        ),
        const MacosPulldownMenuDivider(),
        MacosPulldownMenuItem(
          title: Text(tr.setDueDate),
          onTap: () => _showDueDateMenu(context, ref, tr),
        ),
        if (otherCategories != null && otherCategories.isNotEmpty) ...[
          const MacosPulldownMenuDivider(),
          MacosPulldownMenuItem(
            title: Text(tr.taskOptionMoveToCategory),
            onTap: () => _showMoveMenu(context, ref, tr),
          ),
        ],
      ],
    );
  }

  void _showDueDateMenu(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations tr,
  ) {
    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const Icon(CupertinoIcons.calendar, size: 64),
        title: Text(tr.setDueDate),
        message: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _DateOption(
              title: tr.today,
              onTap: () {
                final now = DateTime.now();
                final today = DateTime(now.year, now.month, now.day);
                ref.read(tasksProvider.notifier).updateTask(
                      task: task.copyWith(
                        dueDate: () => today.millisecondsSinceEpoch,
                      ),
                    );
                Navigator.of(context).pop();
              },
            ),
            _DateOption(
              title: tr.tomorrow,
              onTap: () {
                final now = DateTime.now();
                final tomorrow = DateTime(now.year, now.month, now.day + 1);
                ref.read(tasksProvider.notifier).updateTask(
                      task: task.copyWith(
                        dueDate: () => tomorrow.millisecondsSinceEpoch,
                      ),
                    );
                Navigator.of(context).pop();
              },
            ),
            _DateOption(
              title: tr.customDate,
              onTap: () async {
                Navigator.of(context).pop();
                await _showDatePicker(context, ref);
              },
            ),
            _DateOption(
              title: tr.noDate,
              onTap: () {
                ref
                    .read(tasksProvider.notifier)
                    .updateTask(task: task.copyWith(dueDate: () => null));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          secondary: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr.cancelButton),
        ),
      ),
    );
  }

  Future<void> _showDatePicker(BuildContext context, WidgetRef ref) async {
    final now = DateTime.now();
    var selectedDate = task.dueDate != null
        ? DateTime.fromMillisecondsSinceEpoch(task.dueDate!)
        : now;

    await showMacosSheet(
      context: context,
      builder: (context) => MacosSheet(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 200,
                child: MacosDatePicker(
                  initialDate: selectedDate,
                  onDateChanged: (date) {
                    selectedDate = date;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PushButton(
                    controlSize: ControlSize.large,
                    secondary: true,
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  PushButton(
                    controlSize: ControlSize.large,
                    onPressed: () {
                      ref.read(tasksProvider.notifier).updateTask(
                            task: task.copyWith(
                              dueDate: () => selectedDate.millisecondsSinceEpoch,
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoveMenu(
    BuildContext context,
    WidgetRef ref,
    AppLocalizations tr,
  ) {
    final categories = ref.read(categoriesProvider).value ?? [];
    final otherCategories =
        categories.where((element) => element.id != task.categoryId).toList();

    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const Icon(CupertinoIcons.folder, size: 64),
        title: Text(tr.taskOptionMoveToCategory),
        message: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...otherCategories.map(
              (category) => _DateOption(
                title: category.name,
                icon: IconData(
                  category.icon,
                  fontFamily: 'AntIcons',
                  fontPackage: 'ant_icons',
                ),
                iconColor: category.color,
                onTap: () {
                  ref
                      .read(tasksProvider.notifier)
                      .updateTask(task: task.copyWith(categoryId: category.id));
                  Navigator.of(context).pop();
                },
              ),
            ),
            if (task.categoryId != -1)
              _DateOption(
                title: tr.noCategoryHeader,
                onTap: () {
                  ref
                      .read(tasksProvider.notifier)
                      .updateTask(task: task.copyWith(categoryId: -1));
                  Navigator.of(context).pop();
                },
              ),
          ],
        ),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          secondary: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr.cancelButton),
        ),
      ),
    );
  }
}

class _DateOption extends StatelessWidget {
  const _DateOption({
    required this.title,
    required this.onTap,
    this.icon,
    this.iconColor,
  });

  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return MacosListTile(
      leading: icon != null
          ? Icon(icon!, color: iconColor)
          : const SizedBox(width: 20),
      title: Text(title),
      onClick: onTap,
    );
  }
}
