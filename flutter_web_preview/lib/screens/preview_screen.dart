import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:html' as html;
import '../models/app_state.dart';
import '../widgets/component_selector.dart';
import '../widgets/mobile_phone_frame.dart';
import '../widgets/customization_panel.dart';
import '../services/zip_builder.dart';
import '../services/download_helper.dart';

// Breakpoint constants
const double kDesktopBreakpoint = 1200;
const double kTabletBreakpoint = 768;

class PreviewScreen extends StatefulWidget {
  const PreviewScreen({super.key});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= kDesktopBreakpoint;
        final isTablet = constraints.maxWidth >= kTabletBreakpoint &&
            constraints.maxWidth < kDesktopBreakpoint;
        final isMobile = constraints.maxWidth < kTabletBreakpoint;

        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: const Color(0xFFF5F7FA),
          appBar: _buildAppBar(context, isDesktop, isTablet, isMobile),
          drawer: (isTablet || isMobile) ? _buildLeftDrawer() : null,
          endDrawer: isMobile ? _buildRightDrawer() : null,
          body: Consumer<AppState>(
            builder: (context, appState, _) {
              if (isDesktop) {
                return _buildDesktopLayout(appState);
              } else if (isTablet) {
                return _buildTabletLayout(appState);
              } else {
                return _buildMobileLayout(appState);
              }
            },
          ),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    bool isDesktop,
    bool isTablet,
    bool isMobile,
  ) {
    return PreferredSize(
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
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 12 : 24,
              vertical: 12,
            ),
            child: Row(
              children: [
                // Menu button for tablet/mobile
                if (isTablet || isMobile)
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                    tooltip: 'Components',
                    iconSize: 24,
                    color: Colors.grey.shade700,
                  ),
                // Logo/Branding
                if (!isMobile) ...[
                  Image.asset(
                    'assets/logo-32x32.png',
                    width: 32,
                    height: 32,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFF0460c6), Color(0xFF0573e6)],
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.widgets_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                ],
                if (!isMobile)
                  const Text(
                    'Flutter Studio',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1a1a1a),
                      letterSpacing: -0.3,
                    ),
                  ),
                const Spacer(),
                // Preset Selector (hidden on mobile, shown in drawer)
                if (isDesktop) _buildPresetSelector(),
                if (isDesktop) const SizedBox(width: 8),
                // GitHub link
                IconButton(
                  onPressed: () {
                    html.window.open(
                      'https://github.com/TejasS1233/flutter-studio',
                      '_blank',
                    );
                  },
                  icon: const Icon(Icons.code),
                  tooltip: 'GitHub',
                  iconSize: 20,
                  color: Colors.grey.shade700,
                ),
                if (!isMobile) ...[
                  const SizedBox(width: 8),
                  // Clear button
                  Consumer<AppState>(
                    builder: (context, appState, _) {
                      if (appState.selectedComponents.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return TextButton.icon(
                        onPressed: () => appState.deselectAll(),
                        icon: const Icon(Icons.clear, size: 16),
                        label: const Text('Clear'),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.grey.shade700,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 8),
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
                              ? const Color(0xFF0460c6).withOpacity(0.1)
                              : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF0460c6).withOpacity(0.2)
                                : Colors.grey.shade200,
                          ),
                        ),
                        child: Text(
                          '${appState.selectedComponents.length} selected',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: appState.selectedComponents.isNotEmpty
                                ? const Color(0xFF0460c6)
                                : Colors.grey.shade600,
                          ),
                        ),
                      );
                    },
                  ),
                ],
                SizedBox(width: isMobile ? 4 : 12),
                // Download button
                Consumer<AppState>(
                  builder: (context, appState, _) {
                    if (isMobile) {
                      return IconButton(
                        onPressed: () => _handleDownload(context, appState),
                        icon: const Icon(Icons.download_rounded),
                        tooltip: 'Download ZIP',
                        iconSize: 24,
                        color: const Color(0xFF1a1a1a),
                      );
                    }
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
                // Customize button for mobile
                if (isMobile)
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openEndDrawer();
                    },
                    icon: const Icon(Icons.palette_outlined),
                    tooltip: 'Customize Theme',
                    iconSize: 24,
                    color: Colors.grey.shade700,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPresetSelector() {
    return Consumer<AppState>(
      builder: (context, appState, _) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 6,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFF0460c6).withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color(0xFF0460c6).withOpacity(0.2),
            ),
          ),
          child: DropdownButton<PresetType>(
            value: appState.currentPreset,
            underline: const SizedBox(),
            icon: const Icon(Icons.arrow_drop_down, size: 20),
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFF0460c6),
            ),
            items: const [
              DropdownMenuItem(
                value: PresetType.dashboard,
                child: Row(
                  children: [
                    Icon(Icons.dashboard, size: 16, color: Color(0xFF0460c6)),
                    SizedBox(width: 8),
                    Text('Dashboard'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: PresetType.profile,
                child: Row(
                  children: [
                    Icon(Icons.person, size: 16, color: Color(0xFF0460c6)),
                    SizedBox(width: 8),
                    Text('Profile'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: PresetType.feed,
                child: Row(
                  children: [
                    Icon(Icons.view_list, size: 16, color: Color(0xFF0460c6)),
                    SizedBox(width: 8),
                    Text('Feed'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: PresetType.form,
                child: Row(
                  children: [
                    Icon(Icons.article, size: 16, color: Color(0xFF0460c6)),
                    SizedBox(width: 8),
                    Text('Form'),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: PresetType.settings,
                child: Row(
                  children: [
                    Icon(Icons.settings, size: 16, color: Color(0xFF0460c6)),
                    SizedBox(width: 8),
                    Text('Settings'),
                  ],
                ),
              ),
            ],
            onChanged: (PresetType? value) {
              if (value != null) {
                appState.loadPreset(value);
              }
            },
          ),
        );
      },
    );
  }

  Widget _buildLeftDrawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Components',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
            // Preset selector in drawer for tablet/mobile
            Padding(
              padding: const EdgeInsets.all(16),
              child: _buildPresetSelector(),
            ),
            const Expanded(child: ComponentSelector()),
          ],
        ),
      ),
    );
  }

  Widget _buildRightDrawer() {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85,
      child: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey.shade200),
                ),
              ),
              child: Row(
                children: [
                  const Text(
                    'Customize Theme',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close),
                    iconSize: 20,
                  ),
                ],
              ),
            ),
            const Expanded(child: CustomizationPanel()),
          ],
        ),
      ),
    );
  }

  Widget _buildDeviceFrameSelector(AppState appState, {bool compact = false}) {
    return Container(
      margin: EdgeInsets.all(compact ? 8 : 16),
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 8 : 16,
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
          const Icon(Icons.phone_android, size: 18, color: Colors.grey),
          SizedBox(width: compact ? 8 : 12),
          if (!compact)
            const Text(
              'Device:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          if (!compact) const SizedBox(width: 12),
          DropdownButton<DeviceFrame>(
            value: appState.selectedFrame,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(
                value: DeviceFrame.iphone14,
                child: Text('iPhone 14', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: DeviceFrame.pixel7,
                child: Text('Pixel 7', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: DeviceFrame.ipad,
                child: Text('iPad', style: TextStyle(fontSize: 14)),
              ),
              DropdownMenuItem(
                value: DeviceFrame.tablet,
                child: Text('Tablet', style: TextStyle(fontSize: 14)),
              ),
            ],
            onChanged: (frame) {
              if (frame != null) appState.setDeviceFrame(frame);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout(AppState appState) {
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
              _buildDeviceFrameSelector(appState),
              Expanded(
                child: Center(
                  child: MobilePhoneFrame(
                    deviceFrame: appState.selectedFrame,
                    components: appState.selectedComponents
                        .map((c) => c.buildWidget(theme: appState.globalTheme))
                        .toList(),
                  ),
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
  }

  Widget _buildTabletLayout(AppState appState) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              _buildDeviceFrameSelector(appState),
              Expanded(
                child: Center(
                  child: MobilePhoneFrame(
                    deviceFrame: appState.selectedFrame,
                    components: appState.selectedComponents
                        .map((c) => c.buildWidget(theme: appState.globalTheme))
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 320,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: const CustomizationPanel(),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(AppState appState) {
    return Column(
      children: [
        _buildDeviceFrameSelector(appState, compact: true),
        Expanded(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: MobilePhoneFrame(
                deviceFrame: appState.selectedFrame,
                fillAvailableSpace: true,
                components: appState.selectedComponents
                    .map((c) => c.buildWidget(theme: appState.globalTheme))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
