# CLI vs Package

Understanding the two modes of Bricolage UI and when to use each.

## Quick Comparison

| Aspect              | CLI Mode                   | Package Mode          |
| ------------------- | -------------------------- | --------------------- |
| **Installation**    | `dart pub global activate` | `flutter pub add`     |
| **Usage**           | Copy components to project | Import from package   |
| **Code Location**   | Your `lib/` directory      | `node_modules/`       |
| **Customization**   | Full control               | Limited to props      |
| **Dependencies**    | Zero runtime deps          | Package dependency    |
| **Updates**         | Manual (you control)       | `flutter pub upgrade` |
| **Version Control** | Track all changes          | Only package version  |
| **Bundle Size**     | Only what you use          | Entire package        |
| **Best For**        | Production apps            | Prototypes & demos    |

## CLI Mode (Recommended for Production)

### How It Works

The CLI copies component source code directly into your project:

```bash
bricolage_ui add button
```

Creates:

```
your_project/
└── lib/
    └── components/
        └── custom_button.dart  ← Component code in YOUR project
```

### Advantages

**1. Complete Ownership**

```dart
// You can modify anything:
class CustomButton extends StatelessWidget {
  // Change the API
  final String text;
  final VoidCallback? onPressed;
  final Color? customColor; // ← Add your own properties

  // Change the implementation
  @override
  Widget build(BuildContext context) {
    // Modify the widget tree however you want
    return YourCustomImplementation();
  }
}
```

**2. Zero Lock-in**

- No package dependency in `pubspec.yaml`
- No version conflicts
- No breaking changes from upstream updates
- Remove the CLI after copying components

**3. Perfect for Design Systems**

- Customize components to match your brand
- Create variants specific to your app
- Track changes in version control
- Share with team via Git

**4. Better Performance**

- Tree-shaking removes unused code
- No package overhead
- Smaller bundle size

### When to Use CLI

**Use CLI when:**

- Building production applications
- Need extensive customization
- Creating a design system
- Want full control over code
- Building long-term projects
- Working in a team with version control

## Package Mode (For Rapid Prototyping)

### How It Works

Traditional Flutter package approach:

```bash
flutter pub add bricolage_ui
```

```dart
import 'package:bricolage_ui/bricolage_ui.dart';

CustomButton(text: 'Click', onPressed: () {})
```

### Advantages

**1. Quick Setup**

- One command to install
- No file management
- Immediate usage

**2. Easy Updates**

```bash
flutter pub upgrade bricolage_ui
```

**3. Familiar Workflow**

- Standard package management
- Works like any Flutter package

### Limitations

**Cannot Modify Core Logic**

```dart
// Can't change this:
CustomButton(
  text: 'Click',
  onPressed: () {},
  // Can only use exposed properties
)

// CLI mode: Edit the file directly
// lib/components/custom_button.dart
```

**Package Overhead**

- Entire package in bundle (even unused components)
- Runtime dependency
- Potential version conflicts

### When to Use Package

**Use Package when:**

- Building quick prototypes
- Testing UI concepts
- Creating demos or mockups
- Convenience > control
- Short-term projects
- Don't need customization

## Migration Path

### From Package → CLI

Easy migration when you're ready for production:

```bash
# Remove package
flutter pub remove bricolage_ui

# Install CLI
dart pub global activate bricolage_ui_cli

# Copy components you were using
bricolage_ui add button card dialog
# Or: bricolage_ui add-all

# Update imports
# From: import 'package:bricolage_ui/bricolage_ui.dart';
# To:   import 'package:your_app/components/custom_button.dart';
```

### From CLI → Package

Not recommended, but possible:

```bash
# Remove copied components
rm -rf lib/components/

# Add package
flutter pub add bricolage_ui
```

## Recommendation

**Start with CLI if:**

- You're building for production
- You value control and customization
- You're comfortable with file management

**Start with Package if:**

- You need something running in 5 minutes
- You're building a throwaway prototype
- You want to test Bricolage UI first

## Real-World Example

### Startup Building MVP

**Week 1-2:** Use Package Mode

```dart
// Quick prototyping
import 'package:bricolage_ui/bricolage_ui.dart';
```

**Week 3+:** Migrate to CLI

```bash
# Ready for production
bricolage_ui add button card dialog alert
# Now customize for your brand
```

### Enterprise App

**Day 1:** Use CLI from the start

```bash
bricolage_ui init
bricolage_ui add button card form
```

Customize immediately, track in Git, share with team.
