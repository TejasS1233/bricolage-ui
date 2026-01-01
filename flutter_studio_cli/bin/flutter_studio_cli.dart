import 'dart:io';
import 'package:args/args.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

const String version = '0.1.0';
const String githubRawUrl =
    'https://raw.githubusercontent.com/TejasS1233/flutter-studio/main/flutter_studio/lib/src';

void main(List<String> arguments) async {
  final parser = ArgParser()
    ..addFlag('help', abbr: 'h', negatable: false, help: 'Show usage help')
    ..addFlag('version', abbr: 'v', negatable: false, help: 'Show version');

  try {
    final results = parser.parse(arguments);

    if (results['help'] || arguments.isEmpty) {
      printHelp(parser);
      return;
    }

    if (results['version']) {
      print('Flutter Studio CLI v$version');
      return;
    }

    final command = arguments[0];

    switch (command) {
      case 'add':
        if (arguments.length < 2) {
          print('Error: Please specify components to add');
          print('Example: flutter_studio add button card');
          exit(1);
        }
        await addComponents(arguments.sublist(1));
        break;
      case 'list':
        listAvailableComponents();
        break;
      case 'init':
        await initProject();
        break;
      default:
        print('Unknown command: $command');
        printHelp(parser);
        exit(1);
    }
  } catch (e) {
    print('Error: $e');
    exit(1);
  }
}

void printHelp(ArgParser parser) {
  print(
      'Flutter Studio CLI - Add beautiful UI components to your Flutter project');
  print('');
  print('Usage: flutter_studio <command> [arguments]');
  print('');
  print('Commands:');
  print(
      '  init              Initialize Flutter Studio in your project (creates lib/components/)');
  print('  add <components>  Add components to your project');
  print('  list              List all available components');
  print('');
  print('Examples:');
  print('  flutter_studio init');
  print('  flutter_studio add button card');
  print('  flutter_studio add button card textfield');
  print('  flutter_studio list');
  print('');
  print('Options:');
  print(parser.usage);
}

Future<void> initProject() async {
  print('Initializing Flutter Studio...');

  // Create directories
  final componentsDir = Directory('lib/components');
  final themeDir = Directory('lib/theme');

  if (!await componentsDir.exists()) {
    await componentsDir.create(recursive: true);
    print('[OK] Created lib/components/');
  } else {
    print('[INFO] lib/components/ already exists');
  }

  if (!await themeDir.exists()) {
    await themeDir.create(recursive: true);
    print('[OK] Created lib/theme/');
  } else {
    print('[INFO] lib/theme/ already exists');
  }

  // Download theme files
  print('\nDownloading theme files...');
  final themeFiles = [
    'colors.dart',
    'typography.dart',
    'radius.dart',
    'spacing.dart',
    'shadows.dart'
  ];

  for (final file in themeFiles) {
    final url = '$githubRawUrl/theme/$file';
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final filePath = path.join('lib/theme', file);
        await File(filePath).writeAsString(response.body);
        print('[OK] Downloaded $file');
      }
    } catch (e) {
      print('[ERROR] Failed to download $file: $e');
    }
  }

  print('\nFlutter Studio initialized successfully!');
  print('Now you can add components: flutter_studio add button card');
}

Future<void> addComponents(List<String> components) async {
  print('Adding components...\n');

  final componentsDir = Directory('lib/components');
  if (!await componentsDir.exists()) {
    print('[WARNING] lib/components/ not found. Run: flutter_studio init');
    exit(1);
  }

  for (final component in components) {
    await downloadComponent(component);
  }

  print('\nComponents added successfully!');
  print(
      'Import them in your Dart files: import \'package:your_app/components/custom_button.dart\';');
}

Future<void> downloadComponent(String component) async {
  final fileName = 'custom_${component.toLowerCase()}.dart';
  final url = '$githubRawUrl/components/$fileName';

  try {
    print('Downloading $component...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final filePath = path.join('lib/components', fileName);
      await File(filePath).writeAsString(response.body);
      print('[OK] Added $component -> $fileName');
    } else if (response.statusCode == 404) {
      print('[ERROR] Component "$component" not found');
    } else {
      print(
          '[ERROR] Failed to download $component (Status: ${response.statusCode})');
    }
  } catch (e) {
    print('[ERROR] Error downloading $component: $e');
  }
}

void listAvailableComponents() {
  print('Available Flutter Studio Components:\n');

  final components = {
    'Buttons & Inputs': [
      'button',
      'textfield',
      'textarea',
      'checkbox',
      'radio',
      'switch',
      'slider',
      'select',
      'dropdown'
    ],
    'Layout': ['card', 'appbar', 'bottomnavbar', 'tabs', 'divider'],
    'Navigation': ['breadcrumb', 'pagination'],
    'Feedback': ['alert', 'toast', 'dialog', 'spinner', 'progress', 'skeleton'],
    'Display': ['badge', 'chip', 'avatar', 'tooltip', 'empty'],
    'Advanced': [
      'table',
      'accordion',
      'bottomsheet',
      'popover',
      'formfield',
      'togglegroup'
    ],
  };

  components.forEach((category, items) {
    print('$category:');
    for (final item in items) {
      print('  • $item');
    }
    print('');
  });

  print('Usage: flutter_studio add button card textfield');
}
