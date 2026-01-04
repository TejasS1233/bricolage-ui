import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:flutter/foundation.dart';
import '../models/component_config.dart';
import '../models/global_theme.dart';
import 'component_code_generator.dart';

class ZipBuilder {
  static Future<Uint8List> buildThemeZip(
    List<ComponentConfig> components,
    GlobalTheme theme,
  ) async {
    final archive = Archive();

    // 1. Theme configuration files (consolidated theme.dart)
    final themeFiles = ComponentCodeGenerator.generateThemeFiles(
      theme,
      consolidated: true,
    );
    for (final entry in themeFiles.entries) {
      archive.addFile(_createFile('lib/theme/${entry.key}', entry.value));
    }

    final exampleCode = _generateExampleFile(components, theme);
    archive.addFile(_createFile('example/main.dart', exampleCode));

    // 3. README
    final readme = _generateReadme(components);
    archive.addFile(_createFile('README.md', readme));

    // 4. pubspec.yaml
    final pubspec = _generatePubspec();
    archive.addFile(_createFile('pubspec.yaml', pubspec));

    return Uint8List.fromList(ZipEncoder().encode(archive)!);
  }

  static ArchiveFile _createFile(String name, String content) {
    final bytes = utf8.encode(content);
    return ArchiveFile(name, bytes.length, bytes);
  }

  static String _generateExampleFile(
    List<ComponentConfig> components,
    GlobalTheme theme,
  ) {
    final buffer = StringBuffer();
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import 'package:bricolage_ui/bricolage_ui.dart';");
    buffer.writeln("// Import your customized theme file");
    buffer.writeln("import '../lib/theme/theme.dart';");
    buffer.writeln();
    buffer.writeln('void main() => runApp(const MyApp());');
    buffer.writeln();
    buffer.writeln('class MyApp extends StatelessWidget {');
    buffer.writeln('  const MyApp({super.key});');
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  Widget build(BuildContext context) {');
    buffer.writeln('    return MaterialApp(');
    buffer.writeln('      home: Scaffold(');
    buffer.writeln('        backgroundColor: UIColors.background,');
    buffer.writeln('        body: Center(');
    buffer.writeln('          child: Column(');
    buffer.writeln('            mainAxisAlignment: MainAxisAlignment.center,');
    buffer.writeln('            children: [');
    buffer.writeln('              Text(');
    buffer.writeln("                'Your customized theme is ready!',");
    buffer.writeln(
      '                style: UITypography.heading2.copyWith(color: UIColors.foreground),',
    );
    buffer.writeln('              ),');
    buffer.writeln('              const SizedBox(height: UISpacing.md),');
    buffer.writeln('              Text(');
    buffer.writeln(
      "                'All theme values are customized based on your selections.',",
    );
    buffer.writeln(
      '                style: UITypography.body.copyWith(color: UIColors.mutedForeground),',
    );
    buffer.writeln('              ),');
    buffer.writeln('              const SizedBox(height: UISpacing.lg),');
    buffer.writeln('              Container(');
    buffer.writeln(
      '                padding: const EdgeInsets.all(UISpacing.md),',
    );
    buffer.writeln('                decoration: BoxDecoration(');
    buffer.writeln('                  color: UIColors.primary,');
    buffer.writeln(
      '                  borderRadius: BorderRadius.circular(UIRadius.md),',
    );
    buffer.writeln('                ),');
    buffer.writeln('                child: Text(');
    buffer.writeln("                  'Start building!',");
    buffer.writeln(
      '                  style: UITypography.body.copyWith(color: UIColors.primaryForeground),',
    );
    buffer.writeln('                ),');
    buffer.writeln('              ),');
    buffer.writeln('            ],');
    buffer.writeln('          ),');
    buffer.writeln('        ),');
    buffer.writeln('      ),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln('}');

    return buffer.toString();
  }

  static String _generateReadme(List<ComponentConfig> components) {
    return '''# Flutter UI Theme Export

Your customized Flutter UI theme.

## What's Included

This package contains your customized theme files:

- **colors.dart** - All color definitions matching your design
- **typography.dart** - Font families, sizes, weights, and text styles
- **radius.dart** - Border radius values for consistent rounded corners
- **spacing.dart** - Spacing scale for consistent padding and margins
- **shadows.dart** - Shadow definitions with customized intensity

## Installation

1. Add Bricolage UI to your `pubspec.yaml`:

\`\`\`yaml
dependencies:
  bricolage_ui:
    git:
      url: https://github.com/TejasS1233/bricolage-ui.git
\`\`\`

2. Run: `flutter pub get`

## Usage

Copy the `lib/theme/` directory to your Flutter project's `lib/` directory.

Then import the theme files you need:

\`\`\`dart
import 'theme/colors.dart';
import 'theme/typography.dart';
import 'theme/radius.dart';
import 'theme/spacing.dart';
import 'theme/shadows.dart';
\`\`\`

Use them in your components:

\`\`\`dart
Container(
  padding: EdgeInsets.all(UISpacing.lg),
  decoration: BoxDecoration(
    color: UIColors.primary,
    borderRadius: BorderRadius.circular(UIRadius.lg),
    boxShadow: UIShadows.md,
  ),
  child: Text(
    'Hello World',
    style: UITypography.heading1.copyWith(
      color: UIColors.primaryForeground,
    ),
  ),
)
\`\`\`

## Customization

All values in the theme files can be modified to match your design requirements. 
Simply edit the generated files and the changes will apply across all components 
that use these theme constants.

## Components in Preview

${components.isNotEmpty ? components.map((c) => '- ${c.displayName}').join('\n') : 'No components selected'}

See `example/main.dart` for usage examples.
''';
  }

  static String _generatePubspec() {
    return '''name: flutter_ui_theme
description: Exported Flutter UI theme configuration
version: 1.0.0

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  bricolage_ui:
    git:
      url: https://github.com/TejasS1233/bricolage-ui.git
''';
  }
}
