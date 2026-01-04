# Contributing to Flutter Studio

Thank you for your interest in contributing to Flutter Studio! This document provides guidelines and instructions for contributing.

## Table of Contents

- [Ways to Contribute](#ways-to-contribute)
- [Development Setup](#development-setup)
- [Adding New Components](#adding-new-components)
- [Coding Standards](#coding-standards)
- [Pull Request Process](#pull-request-process)
- [Reporting Issues](#reporting-issues)
- [Code of Conduct](#code-of-conduct)

## Ways to Contribute

There are many ways to contribute to Flutter Studio:

- **Add new components** - Create new UI components following our design system
- **Improve existing components** - Enhance functionality, accessibility, or performance
- **Fix bugs** - Help us identify and fix issues
- **Improve documentation** - Write guides, improve API docs, or fix typos
- **Add theme presets** - Create new theme configurations for popular apps
- **Test and report issues** - Help us identify bugs and edge cases
- **Share feedback** - Suggest new features or improvements

## Development Setup

### Prerequisites

- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Git

### Setting Up the Project

1. Fork the repository on GitHub
2. Clone your fork locally:

   ```bash
   git clone https://github.com/YOUR_USERNAME/flutter-studio.git
   cd flutter-studio
   ```

3. Add the upstream repository:

   ```bash
   git remote add upstream https://github.com/TejasS1233/flutter-studio.git
   ```

4. Install dependencies for each package:

   ```bash
   # Core package
   cd flutter_studio
   flutter pub get

   # CLI tool
   cd ../flutter_studio_cli
   dart pub get

   # Web preview
   cd ../flutter_web_preview
   flutter pub get

   # Documentation site
   cd ../flutter_studio_docs
   npm install
   ```

5. Create a new branch for your work:
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Adding New Components

### Component Structure

All components should be added to `flutter_studio/lib/src/components/`.

### Component Template

```dart
import 'package:flutter/material.dart';
import '../theme/theme.dart';

enum CustomComponentSize { small, medium, large }

/// A brief description of what this component does
class CustomComponent extends StatelessWidget {
  final String text;
  final CustomComponentSize size;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final VoidCallback? onPressed;

  const CustomComponent({
    Key? key,
    required this.text,
    this.size = CustomComponentSize.medium,
    this.backgroundColor,
    this.foregroundColor,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final defaultBgColor = backgroundColor ?? UIColors.primary;
    final defaultFgColor = foregroundColor ?? UIColors.white;

    return Container(
      // Component implementation
    );
  }
}
```

### Component Requirements

1. **Accessibility**: All components must include:

   - Proper semantics labels
   - Keyboard navigation support
   - Screen reader compatibility
   - Sufficient color contrast

2. **Theming**: Components should:

   - Accept theme colors as parameters
   - Use UIColors and UITypography constants
   - Support both light and dark modes

3. **Documentation**: Each component needs:

   - Doc comments describing the component
   - Parameter documentation
   - Usage examples in the docs site

4. **Testing**: Add widget tests in the `test/` directory

### Adding Component to CLI

After creating a component, add it to the CLI's component list:

1. Update `flutter_studio_cli/lib/src/templates/component_templates.dart`
2. Add component metadata to `flutter_studio_cli/lib/src/models/component_info.dart`
3. Add usage documentation to `flutter_studio_docs/docs/components/`

## Coding Standards

### Dart Style

- Follow the [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `dart format` to format your code
- Run `dart analyze` to check for issues
- Maintain test coverage above 80%

### Component Naming

- Use `Custom` prefix for all components (e.g., `CustomButton`, `CustomCard`)
- Use clear, descriptive names
- Follow Flutter naming conventions

### File Organization

```
flutter_studio/
├── lib/
│   ├── src/
│   │   ├── components/      # UI components
│   │   │   ├── custom_button.dart
│   │   │   └── custom_card.dart
│   │   └── theme/           # Theme constants
│   │       └── theme.dart
│   └── flutter_studio.dart  # Public exports
└── test/                    # Widget tests
```

### Commit Messages

Use clear, descriptive commit messages:

```
feat: add CustomTooltip component
fix: resolve button padding issue on small screens
docs: update installation instructions
refactor: simplify theme color system
test: add widget tests for CustomCard
```

Commit message format:

- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `refactor:` - Code refactoring
- `test:` - Adding or updating tests
- `chore:` - Maintenance tasks

## Pull Request Process

1. **Before submitting:**

   - Run `dart format` on all changed files
   - Run `dart analyze` and fix any issues
   - Add or update tests as needed
   - Update documentation if adding new features
   - Test your changes thoroughly

2. **Submitting the PR:**

   - Create a pull request from your fork to the main repository
   - Provide a clear title and description
   - Reference any related issues (e.g., "Fixes #123")
   - Include screenshots for UI changes
   - Add a summary of changes in the description

3. **PR Template:**

   ```markdown
   ## Description

   Brief description of the changes

   ## Type of Change

   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update

   ## Testing

   Describe how you tested these changes

   ## Screenshots (if applicable)

   Add screenshots for visual changes

   ## Checklist

   - [ ] Code follows project style guidelines
   - [ ] Self-review completed
   - [ ] Comments added for complex code
   - [ ] Documentation updated
   - [ ] Tests added/updated
   - [ ] All tests pass
   ```

4. **Review process:**
   - Wait for maintainer review
   - Address any requested changes
   - Keep your branch up to date with main
   - Once approved, a maintainer will merge your PR

## Reporting Issues

### Bug Reports

When reporting bugs, include:

- **Description**: Clear description of the bug
- **Steps to reproduce**: Exact steps to reproduce the issue
- **Expected behavior**: What you expected to happen
- **Actual behavior**: What actually happened
- **Environment**: Flutter/Dart version, OS, device info
- **Screenshots**: If applicable
- **Code sample**: Minimal code that reproduces the issue

### Feature Requests

For feature requests, include:

- **Problem description**: What problem does this solve?
- **Proposed solution**: How would you implement this?
- **Alternatives**: Other solutions you've considered
- **Additional context**: Any other relevant information

## Code of Conduct

### Our Standards

- Be respectful and inclusive
- Welcome newcomers and help them learn
- Focus on constructive feedback
- Accept responsibility for mistakes
- Prioritize the community's best interests

### Unacceptable Behavior

- Harassment or discriminatory language
- Trolling or insulting comments
- Personal or political attacks
- Publishing others' private information
- Unprofessional conduct

### Enforcement

Violations may result in:

1. Warning
2. Temporary ban
3. Permanent ban

Report violations to the project maintainers.

## Questions?

- Open a [discussion](https://github.com/TejasS1233/flutter-studio/discussions) for questions
- Check existing [issues](https://github.com/TejasS1233/flutter-studio/issues) and [pull requests](https://github.com/TejasS1233/flutter-studio/pulls)
- Review the [documentation](https://docs-flutterstudio.vercel.app)

---

Thank you for contributing to Flutter Studio! Your efforts help make Flutter development better for everyone.
