import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purple_task/core/constants/strings/strings.dart' as s;
import 'package:purple_task/core/ui/screens/main_screen/macos_main_screen.dart';
import 'package:purple_task/core/ui/screens/macos_welcome_screen.dart';
import 'package:purple_task/features/app_version/controllers/app_version_controller.dart';

class MacosRedirectScreen extends ConsumerWidget {
  const MacosRedirectScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      appVersionProvider,
      (previous, next) {
        return switch (next) {
          AsyncData(:final value) =>
            Navigator.of(context).pushReplacement(_createRoute(value)),
          AsyncError(:final error) => debugPrint('Error: $error'),
          _ => debugPrint('Loading...'),
        };
      },
    );

    return Container();
  }

  Route<void> _createRoute(String? appVersion) {
    final target = switch (appVersion) {
      s.appVersion => const MacosMainScreen(),
      _ => const MacosWelcomeScreen(),
    };

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
