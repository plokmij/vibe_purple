import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// Theme configuration for macOS-native UI
class PurpleMacosTheme {
  static MacosThemeData lightTheme = MacosThemeData.light().copyWith(
    primaryColor: Colors.pink,
    pushButtonTheme: const PushButtonThemeData(
      color: Colors.pink,
      secondaryColor: Colors.pinkAccent,
    ),
  );

  static MacosThemeData darkTheme = MacosThemeData.dark().copyWith(
    primaryColor: Colors.pink,
    pushButtonTheme: const PushButtonThemeData(
      color: Colors.pink,
      secondaryColor: Colors.pinkAccent,
    ),
  );
}
