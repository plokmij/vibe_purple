import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/constants/category_colors.dart';
import 'package:purple_task/core/constants/category_icons.dart';
import 'package:purple_task/features/todos/controllers/new_category_controller.dart';
import 'package:purple_task/features/todos/controllers/new_category_state.dart';
import 'package:purple_task/features/todos/views/macos_add_task_field.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosNewCategoryScreen extends ConsumerStatefulWidget {
  const MacosNewCategoryScreen({super.key});

  @override
  ConsumerState<MacosNewCategoryScreen> createState() =>
      _MacosNewCategoryScreenState();
}

class _MacosNewCategoryScreenState
    extends ConsumerState<MacosNewCategoryScreen> {
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final typography = MacosTypography.of(context);
    final state = ref.watch(newCategoryProvider);
    final controller = ref.watch(newCategoryProvider.notifier);

    return MacosSheet(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SizedBox(
          width: 500,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    tr.addCategoryButton,
                    style: MacosTheme.of(context).typography.largeTitle,
                  ),
                  MacosIconButton(
                    icon: const Icon(CupertinoIcons.xmark),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Progress indicator
              _buildProgressIndicator(state.status, tr),
              const SizedBox(height: 20),
              // Content based on status
              Expanded(
                child: _buildContent(
                  state,
                  controller,
                  tr,
                  typography,
                ),
              ),
              const SizedBox(height: 16),
              // Navigation buttons
              _buildNavigationButtons(state, controller, tr),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProgressIndicator(NewCategoryStatus status, AppLocalizations tr) {
    final steps = [
      tr.categoryNameLabel,
      tr.newCategoryColorLabel,
      tr.newCategoryIconLabel,
      tr.task,
    ];

    final currentStep = switch (status) {
      NewCategoryStatus.initial => 0,
      NewCategoryStatus.name => 0,
      NewCategoryStatus.color => 1,
      NewCategoryStatus.icon => 2,
      NewCategoryStatus.tasks => 3,
    };

    return Row(
      children: List.generate(steps.length, (index) {
        final isActive = index <= currentStep;
        return Expanded(
          child: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isActive
                      ? CupertinoColors.activeBlue
                      : CupertinoColors.systemGrey4,
                ),
                child: Center(
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      color: isActive
                          ? CupertinoColors.white
                          : CupertinoColors.systemGrey,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              if (index < steps.length - 1)
                Expanded(
                  child: Container(
                    height: 2,
                    color: index < currentStep
                        ? CupertinoColors.activeBlue
                        : CupertinoColors.systemGrey4,
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildContent(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
    MacosTypography typography,
  ) {
    return switch (state.status) {
      NewCategoryStatus.initial || NewCategoryStatus.name => _buildNameStep(
          state,
          controller,
          tr,
          typography,
        ),
      NewCategoryStatus.color => _buildColorStep(state, controller, tr),
      NewCategoryStatus.icon => _buildIconStep(state, controller, tr),
      NewCategoryStatus.tasks => _buildTasksStep(state, controller, tr),
    };
  }

  Widget _buildNameStep(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
    MacosTypography typography,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.categoryNameLabel, style: typography.headline),
        const SizedBox(height: 12),
        MacosTextField(
          controller: _nameController,
          placeholder: tr.categoryNameLabel,
          autofocus: true,
          onChanged: controller.changeName,
        ),
      ],
    );
  }

  Widget _buildColorStep(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: state.color,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            Text(state.name, style: MacosTheme.of(context).typography.headline),
          ],
        ),
        const SizedBox(height: 16),
        Text(tr.newCategoryColorLabel),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: categoryColors.length,
            itemBuilder: (context, index) {
              final color = Color(categoryColors[index]);
              final isSelected = color == state.color;
              return GestureDetector(
                onTap: () => controller.changeColor(color),
                child: Container(
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    border: isSelected
                        ? Border.all(
                            color: CupertinoColors.white,
                            width: 3,
                          )
                        : null,
                    boxShadow: isSelected
                        ? [
                            BoxShadow(
                              color: color.withAlpha(128),
                              blurRadius: 8,
                              spreadRadius: 2,
                            ),
                          ]
                        : null,
                  ),
                  child: isSelected
                      ? const Icon(
                          CupertinoIcons.checkmark,
                          color: CupertinoColors.white,
                        )
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildIconStep(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              IconData(
                state.icon,
                fontFamily: 'AntIcons',
                fontPackage: 'ant_icons',
              ),
              color: state.color,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(state.name, style: MacosTheme.of(context).typography.headline),
          ],
        ),
        const SizedBox(height: 16),
        Text(tr.newCategoryIconLabel),
        const SizedBox(height: 12),
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 6,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
            ),
            itemCount: categoryIcons.length,
            itemBuilder: (context, index) {
              final icon = categoryIcons[index];
              final isSelected = icon == state.icon;
              return GestureDetector(
                onTap: () => controller.changeIcon(icon),
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? state.color.withAlpha(50)
                        : MacosColors.systemGrayColor.withAlpha(30),
                    borderRadius: BorderRadius.circular(8),
                    border: isSelected
                        ? Border.all(color: state.color, width: 2)
                        : null,
                  ),
                  child: Icon(
                    IconData(
                      icon,
                      fontFamily: 'AntIcons',
                      fontPackage: 'ant_icons',
                    ),
                    color: isSelected
                        ? state.color
                        : MacosColors.systemGrayColor,
                    size: isSelected ? 28 : 24,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildTasksStep(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              IconData(
                state.icon,
                fontFamily: 'AntIcons',
                fontPackage: 'ant_icons',
              ),
              color: state.color,
              size: 28,
            ),
            const SizedBox(width: 8),
            Text(state.name, style: MacosTheme.of(context).typography.headline),
          ],
        ),
        const SizedBox(height: 16),
        MacosAddTaskField(
          onAddTask: controller.updateNewTasksList,
        ),
        const SizedBox(height: 8),
        Text(tr.newCategoryTasksInfo),
        const SizedBox(height: 12),
        Expanded(
          child: state.tasksNamesList.isEmpty
              ? const Center(child: Text('No tasks added yet'))
              : MacosScrollbar(
                  child: ListView.separated(
                    itemCount: state.tasksNamesList.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 4),
                    itemBuilder: (context, index) {
                      return MacosListTile(
                        leading: const MacosIcon(AntIcons.checkCircle),
                        title: Text(state.tasksNamesList[index]),
                      );
                    },
                  ),
                ),
        ),
      ],
    );
  }

  Widget _buildNavigationButtons(
    NewCategoryState state,
    NewCategoryNotifier controller,
    AppLocalizations tr,
  ) {
    final canGoBack = state.status != NewCategoryStatus.initial &&
        state.status != NewCategoryStatus.name;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if (canGoBack)
          PushButton(
            controlSize: ControlSize.large,
            secondary: true,
            onPressed: () {
              switch (state.status) {
                case NewCategoryStatus.color:
                  controller.backToName();
                case NewCategoryStatus.icon:
                  controller.backToColor();
                case NewCategoryStatus.tasks:
                  controller.backToIcon();
                default:
                  break;
              }
            },
            child: const Text('Back'),
          )
        else
          const SizedBox.shrink(),
        PushButton(
          controlSize: ControlSize.large,
          onPressed: state.name.isEmpty &&
                  (state.status == NewCategoryStatus.initial ||
                      state.status == NewCategoryStatus.name)
              ? null
              : () async {
                  switch (state.status) {
                    case NewCategoryStatus.initial:
                    case NewCategoryStatus.name:
                      controller.progressToColor();
                    case NewCategoryStatus.color:
                      controller.progressToIcon();
                    case NewCategoryStatus.icon:
                      controller.progressToTasks();
                    case NewCategoryStatus.tasks:
                      await controller.addNewCategoryAndTasks();
                      if (!mounted) return;
                      Navigator.of(context).pop();
                  }
                },
          child: Text(
            state.status == NewCategoryStatus.tasks
                ? tr.finishButton
                : tr.nextButton,
          ),
        ),
      ],
    );
  }
}
