import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:purple_task/app.dart';
import 'package:purple_task/core/hive_legacy/hive_init.dart';
import 'package:purple_task/macos_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveInit().initHive();

  // TODO(m): Set app window size

  final isMacOS = !kIsWeb && Platform.isMacOS;

  runApp(
    ProviderScope(
      child: isMacOS ? const MacosAppWrapper() : const App(),
    ),
  );
}
