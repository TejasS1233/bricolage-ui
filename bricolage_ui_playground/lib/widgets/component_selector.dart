import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bricolage_ui/bricolage_ui.dart';
import '../models/app_state.dart';

class ComponentSelector extends StatelessWidget {
  const ComponentSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey[200]!),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Components',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Flexible(
                    child: TextButton.icon(
                      onPressed: () => appState.selectAll(),
                      icon: const Icon(Icons.check_box, size: 16),
                      label: const Text('All', style: TextStyle(fontSize: 13)),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Flexible(
                    child: TextButton.icon(
                      onPressed: () => appState.deselectAll(),
                      icon: const Icon(Icons.check_box_outline_blank, size: 16),
                      label: const Text(
                        'Clear',
                        style: TextStyle(fontSize: 13),
                      ),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 8,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const CustomDivider(),
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: appState.components.length,
                  itemBuilder: (context, index) {
                    final component = appState.components[index];
                    return CheckboxListTile(
                      value: component.isSelected,
                      onChanged: (value) {
                        final wasPresetMode = appState.currentPreset != null;
                        appState.toggleComponent(component.id);
                        if (wasPresetMode) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text(
                                'Switched to manual component mode',
                              ),
                              duration: const Duration(seconds: 2),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.blue.shade600,
                            ),
                          );
                        }
                      },
                      title: Text(
                        component.displayName,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Text(
                        component.name,
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                      secondary: Icon(
                        component.icon,
                        color: Colors.indigo,
                        size: 20,
                      ),
                      controlAffinity: ListTileControlAffinity.leading,
                      dense: true,
                      selected: component.isSelected,
                    );
                  },
                ),
              ),
              const CustomDivider(),
              Text(
                '${appState.selectedComponents.length} component(s) selected',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
