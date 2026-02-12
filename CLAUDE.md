# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Purple Task is a cross-platform Flutter TO-DO application with category support, theme customization, and multi-language support. It uses Dart 3.5.3+ and targets Android, iOS, macOS, web, and Linux (including Snap package).

## Build Commands

```bash
flutter pub get                              # Install dependencies
flutter pub run build_runner build           # Generate code (required after model/provider changes)
flutter pub run build_runner watch           # Watch mode for code generation
flutter run                                  # Run development build
flutter analyze                              # Run static analysis
flutter test                                 # Run all tests
flutter test test/ui/widgets/                # Run specific test directory
flutter test test/ui/widgets/icon_button_test.dart  # Run single test file
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

**Platform-Specific UI:**
- macOS uses `macos_ui` package with separate app wrapper (`lib/macos_app.dart`) and native-looking widgets in `*_macos_*.dart` files
- Other platforms use standard Material widgets via `lib/app.dart`
- Platform detection in `main.dart` routes to appropriate app wrapper

## Code Generation

Files matching `*.g.dart` are auto-generated. After modifying:
- Riverpod providers (annotated with `@riverpod`)
- Drift tables/DAOs (annotated with `@DriftAccessor`)
- Hive models (in `lib/core/hive_legacy/`)

Run: `flutter pub run build_runner build`

## Localization

Template file: `lib/l10n/app_en.arb`. Add translations to corresponding `app_xx.arb` files. Localization is configured in `l10n.yaml`. Generated classes are accessed via `AppLocalizations.of(context)`.

## Key Entry Points

- `lib/main.dart` - App entry, initializes Hive and Riverpod, routes to macOS or Material app
- `lib/app.dart` - MaterialApp configuration for non-macOS platforms
- `lib/macos_app.dart` - MacosApp configuration using macos_ui package
- `lib/core/database/app_database.dart` - Database schema definition
- `lib/features/todos/controllers/tasks_controller.dart` - Main todo business logic

## Repository Pattern

Repositories use abstract base classes for testability:
- `BaseTaskRepository` / `DriftTaskRepository` - Task CRUD operations
- `BaseCategoryRepository` / `DriftCategoryRepository` - Category CRUD operations

Repositories are provided via Riverpod in `lib/features/*/repositories/providers/`
