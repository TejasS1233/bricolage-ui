import 'dart:io';
import 'package:args/args.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

const String version = '0.2.0';
const String githubRawUrl =
    'https://raw.githubusercontent.com/TejasS1233/bricolage-ui/main/bricolage_ui/lib/src';

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
      print('Bricolage UI CLI v$version');
      return;
    }

    final command = arguments[0];

    switch (command) {
      case 'add':
        if (arguments.length < 2) {
          print('Error: Please specify components to add');
          print('Example: bricolage_ui add button card');
          exit(1);
        }
        await addComponents(arguments.sublist(1));
        break;
      case 'add-all':
        await addAllComponents();
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
      'Bricolage UI CLI - Add beautiful UI components to your Flutter project');
  print('');
  print('Usage: bricolage_ui <command> [arguments]');
  print('');
  print('Commands:');
  print(
      '  init              Initialize Bricolage UI in your project (creates lib/components/)');
  print('  add <components>  Add components to your project');
  print('  add-all           Add all 40+ components to your project');
  print('  list              List all available components');
  print('');
  print('Examples:');
  print('  bricolage_ui init');
  print('  bricolage_ui add button card');
  print('  bricolage_ui add button card textfield');
  print('  bricolage_ui add-all');
  print('  bricolage_ui list');
  print('');
  print('Options:');
  print(parser.usage);
}

Future<void> initProject() async {
  print('Initializing Bricolage UI...');

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

  // Download theme file
  print('\nDownloading theme file...');
  final url = '$githubRawUrl/theme/theme.dart';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final filePath = path.join('lib/theme', 'theme.dart');
      await File(filePath).writeAsString(response.body);
      print('[OK] Downloaded theme.dart');
    } else {
      print(
          '[ERROR] Failed to download theme.dart: HTTP ${response.statusCode}');
    }
  } catch (e) {
    print('[ERROR] Failed to download theme.dart: $e');
  }

  print('\nBricolage UI initialized successfully!');
  print('Now you can add components: bricolage_ui add button card');
}

Future<void> addComponents(List<String> components) async {
  final componentsDir = Directory('lib/components');
  if (!await componentsDir.exists()) {
    print('[WARNING] lib/components/ not found. Run: bricolage_ui init');
    exit(1);
  }

  for (final component in components) {
    await downloadComponent(component);
  }

  print('');
}

Future<bool> downloadComponent(String component) async {
  final fileName = 'custom_${component.toLowerCase()}.dart';
  final url = '$githubRawUrl/components/$fileName';

  try {
    print('Adding $component...');
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final filePath = path.join('lib/components', fileName);
      await File(filePath).writeAsString(response.body);
      print('✓ $component');
      return true;
    } else if (response.statusCode == 404) {
      print('✗ $component (not found)');
      return false;
    } else {
      print('✗ $component (error)');
      return false;
    }
  } catch (e) {
    print('✗ $component (error)');
    return false;
  }
}

Future<bool> downloadComponentQuiet(String component) async {
  final fileName = 'custom_${component.toLowerCase()}.dart';
  final url = '$githubRawUrl/components/$fileName';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final filePath = path.join('lib/components', fileName);
      await File(filePath).writeAsString(response.body);
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}

void listAvailableComponents() {
  print('Available Bricolage UI Components:\n');

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

  print('Usage: bricolage_ui add button card textfield');
  print('Or add all: bricolage_ui add-all');
}

Future<void> addAllComponents() async {
  print('Adding all components...');

  final componentsDir = Directory('lib/components');
  if (!await componentsDir.exists()) {
    print('[WARNING] lib/components/ not found. Run: bricolage_ui init');
    exit(1);
  }

  final allComponents = [
    // Buttons & Inputs
    'button',
    'text_field',
    'textarea',
    'checkbox',
    'radio',
    'switch',
    'slider',
    'select',
    'dropdown',
    // Layout
    'card',
    'app_bar',
    'bottom_nav_bar',
    'tabs',
    'divider',
    // Navigation
    'breadcrumb',
    'pagination',
    // Feedback
    'alert',
    'toast',
    'dialog',
    'spinner',
    'progress',
    'skeleton',
    // Display
    'badge',
    'chip',
    'avatar',
    'tooltip',
    'empty',
    // Advanced
    'table',
    'accordion',
    'bottom_sheet',
    'popover',
    'form_field',
    'toggle_group',
  ];

  int successCount = 0;
  int failCount = 0;

  for (final component in allComponents) {
    final success = await downloadComponentQuiet(component);
    if (success) {
      successCount++;
    } else {
      failCount++;
    }
  }

  print('');
  if (failCount == 0) {
    print('✓ Successfully installed $successCount components');
  } else {
    print('✓ Installed $successCount components, $failCount failed');
  }
}
