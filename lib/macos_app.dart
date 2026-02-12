import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/styles/macos_themes.dart';
import 'package:purple_task/core/styles/providers/providers.dart';
import 'package:purple_task/core/ui/screens/macos_redirect_screen.dart';
import 'package:purple_task/features/settings/providers/providers.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosAppWrapper extends ConsumerWidget {
  const MacosAppWrapper({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeProvider);
    final selectedLocale = ref.watch(appLocaleProvider);

    return MacosApp(
      title: 'Purple Task',
      debugShowCheckedModeBanner: false,
      theme: PurpleMacosTheme.lightTheme,
      darkTheme: PurpleMacosTheme.darkTheme,
      themeMode: themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: selectedLocale,
      home: const MacosRedirectScreen(),
    );
  }
}
