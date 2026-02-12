# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Purple Task is a cross-platform Flutter TO-DO application with category support, theme customization, and multi-language support. It uses Dart 3.5.3+ and targets Android, iOS, web, and Linux (including Snap package).

## Build Commands

```bash
flutter pub get                              # Install dependencies
flutter pub run build_runner build           # Generate code (required after model/provider changes)
flutter pub run build_runner watch           # Watch mode for code generation
flutter run                                  # Run development build
flutter analyze                              # Run static analysis
flutter test                                 # Run all tests
flutter test test/ui/widgets/                # Run specific test directory
```

## Architecture

The app follows clean architecture with feature-based organization and Riverpod state management.

**Layer Flow:**
```
Views (UI) → Controllers (Riverpod) → Repositories → DAOs → Drift Database
```

**Key Directories:**
- `lib/core/` - Shared functionality: database setup, themes, constants, reusable widgets
- `lib/features/` - Feature modules (todos, settings, migrator, app_version)
- `lib/l10n/` - Localization ARB files (en, de, fr, pl, da, fil)
- `packages/ant_icons/` - Custom icon font package

**State Management:**
- Riverpod with annotations (`@riverpod`) and code generation
- Controllers in `lib/features/*/controllers/`
- Providers generated to `*.g.dart` files

**Database:**
- Drift (SQLite ORM) with tables: `TaskItems`, `Categories`
- DAOs in `lib/features/todos/daos/`
- Database definition: `lib/core/database/app_database.dart`

## Code Generation

Files matching `*.g.dart` are auto-generated. After modifying:
- Riverpod providers (annotated with `@riverpod`)
- Drift tables/DAOs
- Hive models

Run: `flutter pub run build_runner build`

## Localization

Template file: `lib/l10n/app_en.arb`. Add translations to corresponding `app_xx.arb` files. Generated classes are accessed via `AppLocalizations.of(context)`.

## Key Entry Points

- `lib/main.dart` - App entry, initializes Riverpod and runs the app
- `lib/app.dart` - MaterialApp configuration, routing, theming
- `lib/core/database/app_database.dart` - Database schema definition
- `lib/features/todos/controllers/tasks_controller.dart` - Main todo business logic
