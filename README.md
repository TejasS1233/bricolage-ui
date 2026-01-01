# Flutter Studio

A complete Flutter UI component ecosystem with 40+ beautiful, customizable components. Available as both a traditional package and a modern CLI tool inspired by shadcn/ui.

## Projects

### [`flutter_studio/`](flutter_studio/)

Flutter component library published to pub.dev. Contains 40+ customizable UI components with a flexible theme system.

**Installation:**

```bash
flutter pub add flutter_studio
```

**Usage:**

```dart
import 'package:flutter_studio/flutter_studio.dart';
```

### [`flutter_studio_cli/`](flutter_studio_cli/)

**NEW!** CLI tool for adding components directly to your project - shadcn/ui style. Copy components into your codebase instead of importing from a package.

**Installation:**

```bash
dart pub global activate flutter_studio_cli
```

**Usage:**

```bash
flutter_studio init                    # Setup project
flutter_studio add button card dialog  # Add components
flutter_studio list                    # View all components
```

**Why use the CLI?**

- Own the code - components live in your project
- Full control - customize however you want
- No package dependency - just copy what you need

### [`flutter_web_preview/`](flutter_web_preview/)

Interactive web application for customizing and previewing components in real-time.

**Features:**

- Customize theme (colors, typography, spacing, radius, shadows, fonts)
- Preview components on mobile/desktop frames
- Export customized theme files as ZIP

**Live Demo:** [https://flutterstudio.vercel.app](https://flutterstudio.vercel.app)

> **Note:** The live demo is a static Flutter web build optimized for component preview functionality. The UI is currently non-responsive and best viewed on desktop. A fully responsive web experience is under development.(will put docs about installation and complete guide on it as well :)

## Quick Start

### Use the Package

```bash
flutter pub add flutter_studio
```

### Use the CLI Tool

```bash
# Install globally
dart pub global activate flutter_studio_cli

# In your Flutter project
flutter_studio init
flutter_studio add button card
```

### Run the Website Locally

```bash
cd flutter_web_preview
flutter run -d chrome
```

## Links

- **Package:** [pub.dev/packages/flutter_studio](https://pub.dev/packages/flutter_studio)
- **CLI Tool:** [pub.dev/packages/flutter_studio_cli](https://pub.dev/packages/flutter_studio_cli)
- **Live Demo:** [flutterstudio.vercel.app](https://flutterstudio.vercel.app)
