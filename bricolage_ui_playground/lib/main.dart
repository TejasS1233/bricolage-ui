import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/app_state.dart';
import 'models/components_data.dart';
import 'screens/preview_screen.dart';
import 'screens/showcase_screen.dart';

import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(createAllComponents()),
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          return MaterialApp(
            title: 'Bricolage UI',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: const Color(0xFF0460c6),
              ),
              useMaterial3: true,
              fontFamily: appState.globalTheme.fontFamily,
              textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
                bodyMedium: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
                bodySmall: TextStyle(
                  fontFamily: appState.globalTheme.fontFamily,
                ),
              ),
            ),
            initialRoute: '/',
            initialRoute: '/',
            onGenerateRoute: (settings) {
              if (settings.name == '/') {
                return MaterialPageRoute(builder: (_) => const PreviewScreen());
              }
              if (settings.name == '/showcase') {
                return MaterialPageRoute(builder: (_) => const ShowcaseScreen());
              }
              
              // Handle component routes e.g. /button, /card
              final componentName = settings.name?.replaceAll('/', '');
              if (componentName != null) {
                // Return a specific preview for this component
                return MaterialPageRoute(
                  builder: (_) => PreviewScreen(initialComponent: componentName),
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
