import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/constants/custom_styles.dart';
import 'package:purple_task/core/constants/strings/strings.dart' as s;
import 'package:purple_task/core/ui/screens/main_screen/macos_main_screen.dart';
import 'package:purple_task/features/migrator/providers/providers.dart';
import 'package:purple_task/features/migrator/views/macos_migrate_from_hive_screen.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosWelcomeScreen extends ConsumerWidget {
  const MacosWelcomeScreen({this.appVersion, super.key});

  final String? appVersion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final typography = MacosTypography.of(context);

    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text('${s.appName} ${s.appVersion}'),
        centerTitle: true,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Column(
                  children: [
                    Expanded(
                      child: MacosScrollbar(
                        controller: scrollController,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          primary: false,
                          child: Padding(
                            padding: const EdgeInsets.all(32),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  s.changesInVersion,
                                  style: CustomStyle.textStyle20.copyWith(
                                    color: typography.body.color,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesNewLocale}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  s.changesInPreviousVersions,
                                  style: CustomStyle.textStyle20.copyWith(
                                    color: typography.body.color,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesThemeChange}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesLocalization}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Image.asset(
                                  'assets/images/purple-change-theme.gif',
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesUiRedesign}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesCategoriesReorder}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Image.asset(
                                  'assets/images/purple-reorder-categories.gif',
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '- ${s.changesTasksReorder}',
                                  style: typography.body,
                                ),
                                const SizedBox(height: 8),
                                Image.asset(
                                  'assets/images/purple-reorder-tasks.gif',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(32),
                      child: PushButton(
                        controlSize: ControlSize.large,
                        onPressed: () async {
                          final needsMigration = await ref
                              .read(needsMigrationFromHiveProvider.future);
                          if (context.mounted) {
                            await Navigator.of(context)
                                .pushReplacement(_createRoute(needsMigration));
                          }
                        },
                        child: Text(tr.continueButton),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Route<void> _createRoute(bool needsMigration) {
    final target = needsMigration
        ? const MacosMigrateFromHiveScreen()
        : const MacosMainScreen();

    return PageRouteBuilder(
      pageBuilder: (context, anim1, anim2) => target,
      transitionsBuilder: (context, anim1, anim2, child) {
        return FadeTransition(
          opacity: anim1,
          child: child,
        );
      },
    );
  }
}
