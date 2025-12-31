import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/theme_customizer.dart';

class CustomizationPanel extends StatelessWidget {
  const CustomizationPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        if (appState.selectedComponents.isEmpty) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tune, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'Global theme controls on left',
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  child: const TabBar(
                    indicatorColor: Color(0xFF667eea),
                    labelColor: Color(0xFF667eea),
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(icon: Icon(Icons.palette, size: 20), text: 'Theme'),
                      Tab(icon: Icon(Icons.tune, size: 20), text: 'Props'),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      const ThemeCustomizer(),
                      _buildPropertiesTab(context, appState),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPropertiesTab(BuildContext context, AppState appState) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Component Properties',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          '${appState.selectedComponents.length} component(s) selected',
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 16),
        ...appState.selectedComponents.map((component) {
          return Card(
            child: ListTile(
              leading: Icon(component.icon, color: const Color(0xFF667eea)),
              title: Text(component.displayName),
              subtitle: Text(component.name),
            ),
          );
        }).toList(),
      ],
    );
  }
}
