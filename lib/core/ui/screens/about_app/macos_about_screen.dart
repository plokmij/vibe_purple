import 'package:flutter/cupertino.dart';
import 'package:macos_ui/macos_ui.dart';
import 'package:purple_task/core/constants/strings/strings.dart' as s;
import 'package:purple_task/core/helpers.dart';
import 'package:purple_task/l10n/app_localizations.dart';

class MacosAboutScreen extends StatelessWidget {
  const MacosAboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tr = AppLocalizations.of(context);
    final typography = MacosTypography.of(context);

    return MacosSheet(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  tr.aboutAppViewTitle,
                  style: MacosTheme.of(context).typography.largeTitle,
                ),
                MacosIconButton(
                  icon: const Icon(CupertinoIcons.xmark),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Image.asset('assets/images/icon.png', height: 80),
            const SizedBox(height: 12),
            Text(
              '${s.appName} ${s.appVersion}',
              style: typography.title1.copyWith(
                color: const Color(0xFF673AB7),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              tr.appDescription,
              textAlign: TextAlign.center,
              style: typography.body,
            ),
            const SizedBox(height: 20),
            MacosListTile(
              title: Text(tr.license),
              subtitle: const Text(s.licenseShort),
              onClick: () => _showLicenseDialog(context, tr),
            ),
            MacosListTile(
              title: Text(tr.sourceCode),
              onClick: () => UrlHelper().openUrl(s.sourceCodeUrl),
            ),
            MacosListTile(
              title: Text(tr.reportIssuesButton),
              onClick: () => UrlHelper().openUrl(s.bugsUrl),
            ),
            MacosListTile(
              leading: const Icon(CupertinoIcons.globe),
              title: const Text(s.helpWithTranslationTitle),
              subtitle: const Text(s.helpWithTranslationSubtitle),
              onClick: () => UrlHelper().openUrl(s.contributingUrl),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void _showLicenseDialog(BuildContext context, AppLocalizations tr) {
    showMacosAlertDialog(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: const Icon(CupertinoIcons.doc_text, size: 64),
        title: Text(tr.license),
        message: const SingleChildScrollView(
          child: Text(s.mitLicense),
        ),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          onPressed: () => Navigator.of(context).pop(),
          child: Text(tr.closeButton),
        ),
      ),
    );
  }
}
