import '../models/component_config.dart';

class CodeGenerator {
  static String generateDartCode(ComponentConfig config) {
    final buffer = StringBuffer();
    buffer.writeln('${config.name}(');
    
    config.properties.forEach((key, value) {
      buffer.writeln('  $key: ${_formatValue(key, value)},');
    });
    
    if (config.id == 'button') {
      buffer.writeln('  onPressed: () {},');
    } else if (config.id == 'bottomnav') {
      buffer.writeln('  onTap: (index) {},');
    }
    
    buffer.writeln(')');
    return buffer.toString();
  }

  static String _formatValue(String key, dynamic value) {
    if (value is String) {
      if (key.contains('variant') || key.contains('size')) {
        final className = key.contains('Button') ? 'Button' :
                         key.contains('Card') ? 'Card' :
                         key.contains('TextField') ? 'TextField' :
                         key.contains('AppBar') ? 'AppBar' :
                         'BottomNavBar';
        final enumName = key.contains('variant') ? 'Variant' : 'Size';
        return '$className$enumName.$value';
      }
      return "'$value'";
    }
    if (value is bool) return value.toString();
    if (value is double || value is int) return value.toString();
    if (value.runtimeType.toString().contains('Color')) {
      final color = value as dynamic;
      final hex = color.value.toRadixString(16).padLeft(8, '0');
      return 'Color(0x$hex)';
    }
    return value.toString();
  }

  static String generateExampleFile(List<ComponentConfig> components) {
    final buffer = StringBuffer();
    buffer.writeln("import 'package:flutter/material.dart';");
    buffer.writeln("import 'package:flutter_ui_lib/flutter_ui_lib.dart';");
    buffer.writeln();
    buffer.writeln('void main() {');
    buffer.writeln('  runApp(const MyApp());');
    buffer.writeln('}');
    buffer.writeln();
    buffer.writeln('class MyApp extends StatelessWidget {');
    buffer.writeln('  const MyApp({super.key});');
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  Widget build(BuildContext context) {');
    buffer.writeln('    return MaterialApp(');
    buffer.writeln('      home: Scaffold(');
    
    final hasAppBar = components.any((c) => c.id == 'appbar');
    if (hasAppBar) {
      final appBar = components.firstWhere((c) => c.id == 'appbar');
      buffer.writeln('        appBar: ${generateDartCode(appBar)},');
    }
    
    buffer.writeln('        body: Center(');
    buffer.writeln('          child: Column(');
    buffer.writeln('            mainAxisAlignment: MainAxisAlignment.center,');
    buffer.writeln('            children: [');
    
    for (var component in components) {
      if (component.id != 'appbar' && component.id != 'bottomnav') {
        buffer.writeln('              ${generateDartCode(component)},');
        buffer.writeln('              const SizedBox(height: 20),');
      }
    }
    
    buffer.writeln('            ],');
    buffer.writeln('          ),');
    buffer.writeln('        ),');
    
    final hasBottomNav = components.any((c) => c.id == 'bottomnav');
    if (hasBottomNav) {
      final bottomNav = components.firstWhere((c) => c.id == 'bottomnav');
      buffer.writeln('        bottomNavigationBar: ${generateDartCode(bottomNav)},');
    }
    
    buffer.writeln('      ),');
    buffer.writeln('    );');
    buffer.writeln('  }');
    buffer.writeln('}');
    
    return buffer.toString();
  }
}
