import 'dart:ui';

class SupportedLocales {
  static const da = Locale('da');
  static const de = Locale('de');
  static const en = Locale('en');
  static const fil = Locale('fil');
  static const fr = Locale('fr');
  static const pl = Locale('pl');

  static String localeToString(Locale locale) {
    return switch (locale) {
      da => 'Dansk',
      de => 'Deutsch',
      en => 'English',
      fr => 'Français',
      fil => 'Filipino',
      pl => 'Polski',
      _ => '',
    };
  }
}
