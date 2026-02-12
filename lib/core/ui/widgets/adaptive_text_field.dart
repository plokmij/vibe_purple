import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:macos_ui/macos_ui.dart';

/// A text field that adapts to the current platform.
/// Uses MacosTextField on macOS and CupertinoTextField on other platforms.
class AdaptiveTextField extends StatelessWidget {
  const AdaptiveTextField({
    this.controller,
    this.focusNode,
    this.placeholder,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.style,
    this.decoration,
    this.suffix,
    super.key,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? placeholder;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final TextStyle? style;
  final BoxDecoration? decoration;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb && Platform.isMacOS) {
      return MacosTextField(
        controller: controller,
        focusNode: focusNode,
        placeholder: placeholder,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        style: style,
      );
    }

    return CupertinoTextField(
      controller: controller,
      focusNode: focusNode,
      placeholder: placeholder,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      autofocus: autofocus,
      style: style,
      decoration: decoration,
      suffix: suffix,
    );
  }
}
