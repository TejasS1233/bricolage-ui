# Bricolage UI CLI

**Production-grade component installation for Flutter.** Add beautiful, customizable UI components directly to your project—own the code, zero runtime dependencies, infinite customization.

## Why CLI Over Package?

Traditional packages lock you into their implementation. The Bricolage UI CLI gives you complete ownership of your UI code.

| Feature             | CLI (Recommended)         | Package                |
| ------------------- | ------------------------- | ---------------------- |
| **Code Ownership**  | ✅ Lives in your codebase | ❌ External dependency |
| **Customization**   | ✅ Modify freely          | ⚠️ Limited to props    |
| **Bundle Size**     | ✅ Only what you add      | ⚠️ Full package        |
| **Version Control** | ✅ Track changes          | ❌ Version only        |
| **Type Safety**     | ✅ Full access            | ⚠️ API surface only    |

## Installation

Install globally using pub:

```bash
dart pub global activate bricolage_ui_cli
```

Or with Flutter:

```bash
flutter pub global activate bricolage_ui_cli
```

## Usage

### Initialize Bricolage UI in your project

```bash
bricolage_ui init
```

This creates `lib/components/` and `lib/theme/` directories and downloads all theme files (colors, typography, spacing, radius, shadows).

### Add components to your project

```bash
bricolage_ui add button card textfield  # Add specific components
bricolage_ui add-all                    # Or add all 40+ components
```

Components are copied directly into your project under `lib/components/`. You own the code and can customize it however you want.

### List available components

```bash
bricolage_ui list
```

## Available Components (40+)

**Buttons & Inputs:** button, textfield, textarea, checkbox, radio, switch, slider, select, dropdown

**Layout:** card, appbar, bottomnavbar, tabs, divider

**Navigation:** breadcrumb, pagination

**Feedback:** alert, toast, dialog, spinner, progress, skeleton

**Display:** badge, chip, avatar, tooltip, empty

**Advanced:** table, accordion, bottomsheet, popover, formfield, togglegroup

## Production Benefits

- **Own Your Code**: Components live in your project. Customize them without constraints.
- **Zero Runtime Dependencies**: No external packages in your dependency tree.
- **Theme Integration**: Components respect your app's theme configuration.
- **Version Control**: Track every component change in your Git history.
- **Bundle Optimization**: Only the components you use are in your build.
- **Type Safety**: Full access to implementation details, not just public APIs.

## Example Workflow

```bash
# Navigate to your Flutter project
cd my_flutter_app

# Initialize Bricolage UI
bricolage_ui init

# Add components you need
bricolage_ui add button card badge dialog

# Use them in your code
import 'package:my_flutter_app/components/custom_button.dart';
import 'package:my_flutter_app/components/custom_card.dart';

// Customize freely - it's your code now!
```

## Rapid Prototyping Alternative

To use the package directly (not recommended for production):

```bash
flutter pub add bricolage_ui
```

[View Package Documentation →](https://pub.dev/packages/bricolage_ui)

## Links

- **GitHub Repository**: [github.com/TejasS1233/bricolage-ui](https://github.com/TejasS1233/bricolage-ui)
- **Bricolage UI Package**: [pub.dev/packages/bricolage_ui](https://pub.dev/packages/bricolage_ui)
- **Live Component Preview**: [bricolage-ui.vercel.app](https://bricolage-ui.vercel.app)

## License

MIT
