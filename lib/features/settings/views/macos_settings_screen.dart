import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/constants/supported_locales.dart';
import 'package:purple_task/core/styles/providers/providers.dart';
import 'package:purple_task/core/styles/themes.dart';
import 'package:purple_task/features/settings/controllers/settings_controller.dart';
import 'package:purple_task/features/settings/providers/providers.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosSettingsScreen extends ConsumerWidget {
  const MacosSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);

    return MacosSheet(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr.settings,
                  style: MacosTheme.of(context).typography.largeTitle,
                ),
                MacosIconButton(
                  icon: const Icon(CupertinoIcons.xmark),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const _LanguageSetting(),
            const SizedBox(height: 16),
            const _ThemeSetting(),
            const SizedBox(height: 16),
            const _TimeFormatSetting(),
            const SizedBox(height: 16),
            const _DateFormatSetting(),
            const SizedBox(height: 16),
            const _ShowDoneTimeSetting(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _LanguageSetting extends ConsumerWidget {
  const _LanguageSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final localeController = ref.watch(appLocaleProvider.notifier);
    final currentLocale = Localizations.localeOf(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tr.settingsOptionLanguage),
        MacosPopupButton<Locale>(
          value: currentLocale,
          items: AppLocalizations.supportedLocales.map((locale) {
            return MacosPopupMenuItem(
              value: locale,
              child: Text(SupportedLocales.localeToString(locale)),
            );
          }).toList(),
          onChanged: (locale) {
            if (locale != null) {
              localeController.update(locale);
            }
          },
        ),
      ],
    );
  }
}

class _ThemeSetting extends ConsumerWidget {
  const _ThemeSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final settingsState = ref.watch(settingsProvider);
    final themeController = ref.watch(appThemeProvider.notifier);

    String themeName(AppThemeMode? themeMode) {
      return switch (themeMode) {
        AppThemeMode.system => tr.themeModeSystem,
        AppThemeMode.light => tr.themeModeLight,
        AppThemeMode.dark => tr.themeModeDark,
        _ => tr.themeModeSystem,
      };
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tr.settingsOptionThemeMode),
        MacosPopupButton<AppThemeMode>(
          value: settingsState.value?.theme ?? AppThemeMode.system,
          items: AppThemeMode.values.map((mode) {
            return MacosPopupMenuItem(
              value: mode,
              child: Text(themeName(mode)),
            );
          }).toList(),
          onChanged: (mode) {
            if (mode != null) {
              themeController.update(mode);
            }
          },
        ),
      ],
    );
  }
}

class _TimeFormatSetting extends ConsumerWidget {
  const _TimeFormatSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.watch(settingsProvider.notifier);

    final timeFormats = ['Hm', 'jm'];
    final currentFormat = settings.value?.timeFormat ?? 'Hm';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tr.settingsOptionTimeFormat),
        MacosPopupButton<String>(
          value: currentFormat,
          items: timeFormats.map((format) {
            final label = format == 'Hm' ? '24h (14:30)' : '12h (2:30 PM)';
            return MacosPopupMenuItem(
              value: format,
              child: Text(label),
            );
          }).toList(),
          onChanged: (format) {
            if (format != null) {
              controller.setTimeFormat(timeFormat: format);
            }
          },
        ),
      ],
    );
  }
}

class _DateFormatSetting extends ConsumerWidget {
  const _DateFormatSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.watch(settingsProvider.notifier);

    final dateFormats = ['d MMM y', 'MMM d, y', 'd/M/y', 'M/d/y'];
    final currentFormat = settings.value?.dateFormat ?? 'd MMM y';

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tr.settingsOptionDateFormat),
        MacosPopupButton<String>(
          value: currentFormat,
          items: dateFormats.map((format) {
            final example = switch (format) {
              'd MMM y' => '15 Jan 2024',
              'MMM d, y' => 'Jan 15, 2024',
              'd/M/y' => '15/1/2024',
              'M/d/y' => '1/15/2024',
              _ => format,
            };
            return MacosPopupMenuItem(
              value: format,
              child: Text(example),
            );
          }).toList(),
          onChanged: (format) {
            if (format != null) {
              controller.setDateFormat(dateFormat: format);
            }
          },
        ),
      ],
    );
  }
}

class _ShowDoneTimeSetting extends ConsumerWidget {
  const _ShowDoneTimeSetting();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = AppLocalizations.of(context);
    final settings = ref.watch(settingsProvider);
    final controller = ref.watch(settingsProvider.notifier);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(tr.settingsOptionDisplayTimeCompleted),
        MacosCheckbox(
          value: settings.value?.showDoneTime ?? false,
          onChanged: (value) {
            controller.setDisplayTaskDoneTimePref(showDoneTime: value);
          },
        ),
      ],
    );
  }
}
