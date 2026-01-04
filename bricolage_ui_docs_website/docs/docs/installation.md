# Installation

Get started with Bricolage UI in minutes.

## Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)

## CLI Installation (Recommended)

The CLI tool is the recommended way to use Bricolage UI in production applications.

### 1. Install the CLI

```bash
dart pub global activate bricolage_ui_cli
```

### 2. Verify Installation

```bash
bricolage_ui --version
```

### 3. Initialize Your Project

Navigate to your Flutter project and run:

```bash
bricolage_ui init
```

This will:

- Create a `components/` directory
- Set up necessary configuration
- Prepare your project for component imports

### 4. Add Components

```bash
# Add specific components
bricolage_ui add button card

# Add multiple components at once
bricolage_ui add button card dialog alert avatar

# Or add all 40+ components
bricolage_ui add-all

# List all available components
bricolage_ui list
```

### 5. Use the Component

```dart
import 'package:your_app/components/custom_button.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {
    print('Button pressed!');
  },
)
```

## Package Installation (Alternative)

For rapid prototyping and demos, you can use the traditional package approach.

### 1. Add Dependency

```bash
flutter pub add bricolage_ui
```

Or manually add to `pubspec.yaml`:

```yaml
dependencies:
  bricolage_ui: ^1.2.0
```

### 2. Import and Use

```dart
import 'package:bricolage_ui/bricolage_ui.dart';

CustomButton(
  text: 'Click Me',
  onPressed: () {},
)
```

## IDE Setup

### VS Code

Install the Flutter and Dart extensions for the best development experience:

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X / Cmd+Shift+X)
3. Search for "Flutter" and install
4. Search for "Dart" and install

### Android Studio / IntelliJ

Flutter and Dart plugins come pre-installed with the Flutter SDK setup.

## Troubleshooting

### CLI not found

If `bricolage_ui` command is not found after installation:

```bash
# Add Dart global bin to your PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

# For Windows (PowerShell)
$env:Path += ";$env:LOCALAPPDATA\Pub\Cache\bin"
```

### Permission Issues (macOS/Linux)

```bash
sudo dart pub global activate bricolage_ui_cli
```

### Component Import Errors

Make sure you've run `bricolage_ui init` in your project directory before adding components.
