import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// A button that adapts to the current platform.
/// Uses PushButton on macOS and FilledButton on other platforms.
class AdaptiveButton extends StatelessWidget {
  const AdaptiveButton({
    required this.onPressed,
    required this.child,
    this.secondary = false,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool secondary;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isMacOS) {
      return PushButton(
        controlSize: ControlSize.large,
        secondary: secondary,
        onPressed: onPressed,
        child: child,
      );
    }

    if (secondary) {
      return OutlinedButton(
        onPressed: onPressed,
        child: child,
      );
    }

    return FilledButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
