import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/component_selector.dart';
import '../widgets/mobile_phone_frame.dart';
import '../widgets/customization_panel.dart';
import '../services/zip_builder.dart';
import '../services/download_helper.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({super.key});

  Future<void> _handleDownload(BuildContext context, AppState appState) async {
    if (appState.selectedComponents.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Select components to export')),
      );
      return;
    }

    try {
      final zipData = await ZipBuilder.buildThemeZip(
        appState.selectedComponents,
        appState.globalTheme,
      );

      DownloadHelper.downloadZip(zipData, 'flutter_ui_theme.zip');

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Theme exported successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Export failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FA),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.grey.shade200, width: 1),
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: Row(
                children: [
                  // Logo/Branding
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF667eea), Color(0xFF764ba2)],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.widgets_rounded,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Flutter UI Library',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1a1a1a),
                      letterSpacing: -0.3,
                    ),
                  ),
                  const Spacer(),
                  // Component count
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: appState.selectedComponents.isNotEmpty
                              ? const Color(0xFF667eea).withOpacity(0.1)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF667eea).withOpacity(0.2)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(
                          '${appState.selectedComponents.length} selected',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF667eea)
                                : Colors.grey.shade600,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  // Download button
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      return ElevatedButton.icon(
                        onPressed: () => _handleDownload(context, appState),
                        icon: const Icon(Icons.download_rounded, size: 18),
                        label: const Text('Download ZIP'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1a1a1a),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Consumer<AppState>(
        builder: (context, appState, _) {
          return Row(
            children: [
              SizedBox(
                width: 280,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const ComponentSelector(),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    // Device Frame Selector
                    Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.phone_android,
                            size: 18,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Device:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 12),
                          DropdownButton<DeviceFrame>(
                            value: appState.selectedFrame,
                            underline: const SizedBox(),
                            items: const [
                              DropdownMenuItem(
                                value: DeviceFrame.iphone14,
                                child: Text(
                                  'iPhone 14',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.pixel7,
                                child: Text(
                                  'Pixel 7',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.ipad,
                                child: Text(
                                  'iPad',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                              DropdownMenuItem(
                                value: DeviceFrame.tablet,
                                child: Text(
                                  'Tablet',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ],
                            onChanged: (frame) {
                              if (frame != null) appState.setDeviceFrame(frame);
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Consumer<AppState>(
                        builder: (context, state, _) {
                          // Rebuild when theme or components change
                          return Center(
                            child: MobilePhoneFrame(
                              deviceFrame: state.selectedFrame,
                              components: state.selectedComponents
                                  .map(
                                    (c) =>
                                        c.buildWidget(theme: state.globalTheme),
                                  )
                                  .toList(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const CustomizationPanel(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
