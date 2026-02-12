import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// Shows a dialog that adapts to the current platform.
/// Uses MacosAlertDialog on macOS and AlertDialog on other platforms.
Future<T?> showAdaptiveAlertDialog<T>({
  required BuildContext context,
  required String title,
  Widget? content,
  required String primaryButtonText,
  required VoidCallback onPrimaryPressed,
  String? secondaryButtonText,
  VoidCallback? onSecondaryPressed,
  IconData? icon,
}) {
  if (!kIsWeb && Platform.isMacOS) {
    return showMacosAlertDialog<T>(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: icon != null ? Icon(icon, size: 64) : const SizedBox.shrink(),
        title: Text(title),
        message: content ?? const SizedBox.shrink(),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          onPressed: onPrimaryPressed,
          child: Text(primaryButtonText),
        ),
        secondaryButton: secondaryButtonText != null
            ? PushButton(
                controlSize: ControlSize.large,
                secondary: true,
                onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
                child: Text(secondaryButtonText),
              )
            : null,
      ),
    );
  }

  return showDialog<T>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        if (secondaryButtonText != null)
          TextButton(
            onPressed: onSecondaryPressed ?? () => Navigator.of(context).pop(),
            child: Text(secondaryButtonText),
          ),
        FilledButton(
          onPressed: onPrimaryPressed,
          child: Text(primaryButtonText),
        ),
      ],
    ),
  );
}

/// Shows a confirmation dialog that adapts to the current platform.
Future<bool?> showAdaptiveConfirmDialog({
  required BuildContext context,
  required String title,
  String? message,
  required String confirmText,
  required String cancelText,
  bool isDestructive = false,
}) {
  if (!kIsWeb && Platform.isMacOS) {
    return showMacosAlertDialog<bool>(
      context: context,
      builder: (context) => MacosAlertDialog(
        appIcon: isDestructive
            ? const Icon(CupertinoIcons.exclamationmark_triangle, size: 64)
            : const SizedBox.shrink(),
        title: Text(title),
        message: message != null ? Text(message) : const SizedBox.shrink(),
        primaryButton: PushButton(
          controlSize: ControlSize.large,
          color: isDestructive ? CupertinoColors.destructiveRed : null,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
        secondaryButton: PushButton(
          controlSize: ControlSize.large,
          secondary: true,
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
      ),
    );
  }

  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(title),
      content: message != null ? Text(message) : null,
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(cancelText),
        ),
        FilledButton(
          style: isDestructive
              ? FilledButton.styleFrom(backgroundColor: Colors.red)
              : null,
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(confirmText),
        ),
      ],
    ),
  );
}
