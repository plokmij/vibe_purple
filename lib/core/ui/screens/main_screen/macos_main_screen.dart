import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/ui/screens/about_app/macos_about_screen.dart';
import 'package:purple_task/features/app_version/controllers/app_version_controller.dart';
import 'package:purple_task/features/settings/views/macos_settings_screen.dart';
import 'package:purple_task/features/todos/controllers/categories_controller.dart';
import 'package:purple_task/features/todos/controllers/category_controller.dart';
import 'package:purple_task/features/todos/views/macos_category_content.dart';
import 'package:purple_task/features/todos/views/macos_uncategorized_content.dart';
import 'package:purple_task/features/todos/views/new_category/macos_new_category_screen.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosMainScreen extends ConsumerStatefulWidget {
  const MacosMainScreen({super.key});

  @override
  ConsumerState<MacosMainScreen> createState() => _MacosMainScreenState();
}

class _MacosMainScreenState extends ConsumerState<MacosMainScreen> {
  int _sidebarIndex = 0;

  @override
  void initState() {
    super.initState();
    ref.read(appVersionProvider.notifier).setAppVersion();
  }

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final categories = ref.watch(categoriesProvider).value ?? [];
    final currentCategory = ref.watch(categoryProvider);

    // Build sidebar items
    final sidebarItems = <SidebarItem>[
      SidebarItem(
        leading: Icon(
          CupertinoIcons.tray_full,
          color: CupertinoColors.systemPurple.resolveFrom(context),
        ),
        label: Text(tr.noCategoryHeader),
      ),
      ...categories.map(
        (category) => SidebarItem(
          leading: Icon(
            IconData(
              category.icon,
              fontFamily: 'AntIcons',
              fontPackage: 'ant_icons',
            ),
            color: category.color,
          ),
          label: Text(category.name),
        ),
      ),
    ];

    // Update sidebar index when category changes
    if (currentCategory == null && _sidebarIndex != 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() => _sidebarIndex = 0);
      });
    } else if (currentCategory != null) {
      final categoryIndex = categories.indexWhere((c) => c.id == currentCategory.id);
      if (categoryIndex >= 0 && _sidebarIndex != categoryIndex + 1) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() => _sidebarIndex = categoryIndex + 1);
        });
      }
    }

    return MacosWindow(
      sidebar: Sidebar(
        minWidth: 200,
        builder: (context, scrollController) {
          return SidebarItems(
            scrollController: scrollController,
            items: sidebarItems,
            currentIndex: _sidebarIndex,
            onChanged: (index) {
              setState(() => _sidebarIndex = index);
              if (index == 0) {
                ref.read(categoryProvider.notifier).setCurrentCategory(null);
              } else {
                final selectedCategory = categories[index - 1];
                ref
                    .read(categoryProvider.notifier)
                    .setCurrentCategory(selectedCategory);
              }
            },
          );
        },
        bottom: MacosListTile(
          leading: const Icon(CupertinoIcons.add_circled),
          title: Text(tr.addCategoryButton),
          onClick: () {
            showMacosSheet(
              context: context,
              builder: (_) => const MacosNewCategoryScreen(),
            );
          },
        ),
      ),
      child: MacosScaffold(
        toolBar: ToolBar(
          title: Text(
            _sidebarIndex == 0
                ? tr.noCategoryHeader
                : (categories.isNotEmpty && _sidebarIndex - 1 < categories.length
                    ? categories[_sidebarIndex - 1].name
                    : ''),
          ),
          actions: [
            ToolBarIconButton(
              label: tr.settings,
              icon: const Icon(CupertinoIcons.gear),
              showLabel: false,
              onPressed: () {
                showMacosSheet(
                  context: context,
                  builder: (_) => const MacosSettingsScreen(),
                );
              },
            ),
            ToolBarIconButton(
              label: tr.aboutAppViewTitle,
              icon: const Icon(CupertinoIcons.info_circle),
              showLabel: false,
              onPressed: () {
                showMacosSheet(
                  context: context,
                  builder: (_) => const MacosAboutScreen(),
                );
              },
            ),
          ],
        ),
        children: [
          ContentArea(
            builder: (context, scrollController) {
              if (_sidebarIndex == 0) {
                return const MacosUncategorizedContent();
              } else if (categories.isNotEmpty &&
                  _sidebarIndex - 1 < categories.length) {
                return MacosCategoryContent(
                  category: categories[_sidebarIndex - 1],
                );
              }
              return const Center(child: ProgressCircle());
            },
          ),
        ],
      ),
    );
  }
}
