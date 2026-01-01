# Flutter Studio CLI

A command-line tool for adding beautiful, customizable UI components to your Flutter projects. Inspired by shadcn/ui, but for Flutter.

## Installation

Install globally using pub:

```bash
dart pub global activate flutter_studio_cli
```

Or with Flutter:

```bash
flutter pub global activate flutter_studio_cli
```

## Usage

### Initialize Flutter Studio in your project

```bash
flutter_studio init
```

This creates `lib/components/` and `lib/theme/` directories and downloads all theme files.

### Add components to your project

```bash
flutter_studio add button card textfield
```

Components are copied directly into your project. You own the code and can customize it however you want.

### List available components

```bash
flutter_studio list
```

## Available Components

**Buttons & Inputs:** button, textfield, textarea, checkbox, radio, switch, slider, select, dropdown

**Layout:** card, appbar, bottomnavbar, tabs, divider

**Navigation:** breadcrumb, pagination

**Feedback:** alert, toast, dialog, spinner, progress, skeleton

**Display:** badge, chip, avatar, tooltip, empty

**Advanced:** table, accordion, bottomsheet, popover, formfield, togglegroup

## Why Flutter Studio CLI?

- 40+ Beautiful Components - Pre-built, customizable UI components
- Copy, Don't Import - Components live in your project, not in node_modules
- Full Control - Modify the code however you want
- Fast Setup - Initialize and add components in seconds
- Consistent Design - Built-in theme system with colors, typography, spacing

## Example Workflow

```bash
# Navigate to your Flutter project
cd my_flutter_app

# Initialize Flutter Studio
flutter_studio init

# Add some components
flutter_studio add button card badge

# Use them in your code
import 'package:my_flutter_app/components/custom_button.dart';
import 'package:my_flutter_app/components/custom_card.dart';
```

## Links

- [GitHub Repository](https://github.com/TejasS1233/flutter-studio)
- [Flutter Studio Package](https://pub.dev/packages/flutter_studio)
- [Components Preview](https://flutterstudio.vercel.app)

## License

MIT
