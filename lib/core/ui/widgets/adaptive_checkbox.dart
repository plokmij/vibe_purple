import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// A checkbox that adapts to the current platform.
/// Uses MacosCheckbox on macOS and Checkbox on other platforms.
class AdaptiveCheckbox extends StatelessWidget {
  const AdaptiveCheckbox({
    required this.value,
    required this.onChanged,
    this.activeColor,
    super.key,
  });

  final bool value;
  final ValueChanged<bool?>? onChanged;
  final Color? activeColor;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isMacOS) {
      return MacosCheckbox(
        value: value,
        onChanged: onChanged,
      );
    }

    return Checkbox(
      value: value,
      onChanged: onChanged,
      activeColor: activeColor,
    );
  }
}
