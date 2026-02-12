import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/constants/strings/strings.dart';
import 'package:purple_task/core/helpers.dart';
import 'package:purple_task/core/ui/screens/main_screen/macos_main_screen.dart';
import 'package:purple_task/features/migrator/controllers/controllers.dart';
import 'package:purple_task/features/migrator/models/migration_state.dart';

class MacosMigrateFromHiveScreen extends ConsumerWidget {
  const MacosMigrateFromHiveScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final migrationState = ref.watch(migrationStateControllerProvider);

    final buttonText = switch (migrationState.migrationStatus) {
      MigrationStatus.idle => startMigration,
      MigrationStatus.pending => migrating,
      MigrationStatus.success => continueToNext,
      MigrationStatus.error => tryAgain,
    };

    final buttonAction = switch (migrationState.migrationStatus) {
      MigrationStatus.idle => () =>
          ref.read(migrationStateControllerProvider.notifier).migrateHive(),
      MigrationStatus.pending => null,
      MigrationStatus.success => () => Navigator.of(context)
          .pushReplacement(_createRoute(const MacosMainScreen())),
      MigrationStatus.error => () =>
          ref.read(migrationStateControllerProvider.notifier).migrateHive(),
    };

    return MacosScaffold(
      toolBar: const ToolBar(
        title: Text(migrationTitle),
        centerTitle: true,
      ),
      children: [
        ContentArea(
          builder: (context, scrollController) {
            return Align(
              alignment: Alignment.topCenter,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: MacosScrollbar(
                  controller: scrollController,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    primary: false,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          const Text(migrationInfo),
                          const SizedBox(height: 24),
                          if (migrationState.errorMessage != null) ...[
                            const Text(problemHappened),
                            const SizedBox(height: 8),
                            Text(
                              '${migrationState.errorMessage}',
                              style: TextStyle(
                                color: CupertinoColors.systemRed.resolveFrom(context),
                              ),
                            ),
                            const SizedBox(height: 8),
                            PushButton(
                              controlSize: ControlSize.large,
                              secondary: true,
                              onPressed: () => UrlHelper().openUrl(bugsUrl),
                              child: const Text(reportBug),
                            ),
                            const SizedBox(height: 24),
                          ],
                          PushButton(
                            controlSize: ControlSize.large,
                            onPressed: buttonAction,
                            child: Text(buttonText),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Route<void> _createRoute(Widget target) {
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
