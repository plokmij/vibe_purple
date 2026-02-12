import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Colors;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/helpers.dart';
import 'package:purple_task/core/styles/macos_themes.dart';
import 'package:purple_task/features/settings/controllers/settings_controller.dart';
import 'package:purple_task/features/todos/controllers/tasks_controller.dart';
import 'package:purple_task/features/todos/models/task.dart';
import 'package:purple_task/features/todos/views/macos_task_menu.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosTaskItem extends ConsumerStatefulWidget {
  const MacosTaskItem({required this.task, super.key});

  final Task task;

  @override
  ConsumerState<MacosTaskItem> createState() => _MacosTaskItemState();
}

class _MacosTaskItemState extends ConsumerState<MacosTaskItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final typography = MacosTypography.of(context);
    final tasksController = ref.watch(tasksProvider.notifier);
    final settings = ref.watch(settingsProvider);
    final brightness = MacosTheme.of(context).brightness;
    final hoverColor = PurpleMacosTheme.getTaskItemHoverColor(brightness);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        decoration: BoxDecoration(
          color: _isHovered ? hoverColor : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            MacosCheckbox(
              value: widget.task.isDone,
              onChanged: (value) {
                final updatedTask = widget.task.copyWith(
                  isDone: value,
                  doneTime: value
                      ? () => DateTime.now().millisecondsSinceEpoch
                      : () => null,
                );
                tasksController.updateTask(task: updatedTask);
              },
            ),
            const SizedBox(width: 8),
            Expanded(
              child: GestureDetector(
                onTap: () => _showEditDialog(context, tasksController),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.task.name,
                      style: widget.task.isDone
                          ? typography.body.copyWith(
                              color: MacosColors.systemGrayColor,
                              decoration: TextDecoration.lineThrough,
                            )
                          : typography.body,
                    ),
                    if (widget.task.dueDate != null)
                      Text(
                        _formatDueDate(widget.task.dueDate!, tr),
                        style: typography.callout.copyWith(
                          color: _isDueDateOverdue(widget.task.dueDate!)
                              ? CupertinoColors.systemRed
                              : MacosColors.systemGrayColor,
                        ),
                      ),
                    if (settings.value != null &&
                        settings.value!.showDoneTime &&
                        widget.task.isDone &&
                        widget.task.doneTime != null)
                      Text(
                        '${tr.completedTasksHeader}: ${TimeConverter.millisToDateAndTime(
                          widget.task.doneTime!,
                          dateFormat: settings.value?.dateFormat ?? 'd MMM y',
                          timeFormat: settings.value?.timeFormat ?? 'Hm',
                        )}',
                        style: typography.callout.copyWith(
                          color: MacosColors.systemGrayColor,
                        ),
                      ),
                  ],
                ),
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: _isHovered ? 1.0 : 0.0,
              child: MacosTaskMenu(task: widget.task),
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    TasksNotifier tasksController,
  ) {
    final tr = AppLocalizations.of(context);
    final controller = TextEditingController(text: widget.task.name);

    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const Icon(CupertinoIcons.pencil, size: 64),
        title: Text(tr.changeTaskName),
        message: CupertinoTextField(
          controller: controller,
          autofocus: true,
          onSubmitted: (_) {
            if (controller.text.trim().isNotEmpty) {
              final updatedTask =
                  widget.task.copyWith(name: controller.text.trim());
              tasksController.updateTask(task: updatedTask);
            }
            Navigator.of(context).pop();
          },
        ),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          onPressed: () {
            if (controller.text.trim().isNotEmpty) {
              final updatedTask =
                  widget.task.copyWith(name: controller.text.trim());
              tasksController.updateTask(task: updatedTask);
            }
            Navigator.of(context).pop();
          },
          child: Text(tr.saveButton),
        ),
        secondaryButton: PushButton(
          controlSize: ControlSize.large,
          secondary: true,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr.cancelButton),
        ),
      ),
    );
  }

  String _formatDueDate(int dueDate, AppLocalizations tr) {
    final date = DateTime.fromMillisecondsSinceEpoch(dueDate);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(const Duration(days: 1));
    final taskDate = DateTime(date.year, date.month, date.day);

    if (taskDate.isAtSameMomentAs(today)) {
      return tr.today;
    } else if (taskDate.isAtSameMomentAs(tomorrow)) {
      return tr.tomorrow;
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  bool _isDueDateOverdue(int dueDate) {
    final date = DateTime.fromMillisecondsSinceEpoch(dueDate);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final taskDate = DateTime(date.year, date.month, date.day);
    return taskDate.isBefore(today);
  }
}
