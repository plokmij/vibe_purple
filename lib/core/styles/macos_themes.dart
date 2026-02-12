import 'package:flutter/material.dart';
import 'package:macos_ui/macos_ui.dart';

/// Theme configuration for macOS-native UI
class PurpleMacosTheme {
  // Semantic colors for light mode
  static const Color _lightCanvasColor = Color(0xFFF5F5F5);
  static const Color _lightDividerColor = Color(0xFFE0E0E0);
  static const Color _lightHoverColor = Color(0xFFE8E8E8);
  static const Color _lightSectionHeaderColor = Color(0xFF8E8E93);
  static const Color _lightCardBackground = Colors.white;

  // Semantic colors for dark mode
  static const Color _darkCanvasColor = Color(0xFF1E1E1E);
  static const Color _darkDividerColor = Color(0xFF3D3D3D);
  static const Color _darkHoverColor = Color(0xFF3A3A3C);
  static const Color _darkSectionHeaderColor = Color(0xFF8E8E93);
  static const Color _darkCardBackground = Color(0xFF2C2C2E);

  static MacosThemeData lightTheme = MacosThemeData.light().copyWith(
    primaryColor: Colors.pink,
    canvasColor: _lightCanvasColor,
    dividerColor: _lightDividerColor,
    pushButtonTheme: const PushButtonThemeData(
      color: Colors.pink,
      secondaryColor: Colors.pinkAccent,
    ),
  );

  static MacosThemeData darkTheme = MacosThemeData.dark().copyWith(
    primaryColor: Colors.pink,
    canvasColor: _darkCanvasColor,
    dividerColor: _darkDividerColor,
    pushButtonTheme: const PushButtonThemeData(
      color: Colors.pink,
      secondaryColor: Colors.pinkAccent,
    ),
  );

  /// Get the content area background color based on brightness
  static Color getContentBackground(Brightness brightness) {
    return brightness == Brightness.dark ? _darkCanvasColor : _lightCanvasColor;
  }

  /// Get the section header text color based on brightness
  static Color getSectionHeaderColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? _darkSectionHeaderColor
        : _lightSectionHeaderColor;
  }

  /// Get the task item hover background color based on brightness
  static Color getTaskItemHoverColor(Brightness brightness) {
    return brightness == Brightness.dark ? _darkHoverColor : _lightHoverColor;
  }

  /// Get the section divider color based on brightness
  static Color getSectionDividerColor(Brightness brightness) {
    return brightness == Brightness.dark
        ? _darkDividerColor
        : _lightDividerColor;
  }

  /// Get the card/container background color based on brightness
  static Color getCardBackground(Brightness brightness) {
    return brightness == Brightness.dark
        ? _darkCardBackground
        : _lightCardBackground;
  }
}
