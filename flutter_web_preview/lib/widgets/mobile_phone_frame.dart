import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class MobilePhoneFrame extends StatelessWidget {
  final List<Widget> components;
  final DeviceFrame deviceFrame;

  const MobilePhoneFrame({
    super.key,
    required this.components,
    this.deviceFrame = DeviceFrame.iphone14,
  });

  Map<String, double> get _dimensions {
    switch (deviceFrame) {
      case DeviceFrame.iphone14:
        return {'width': 375, 'height': 667, 'radius': 48};
      case DeviceFrame.pixel7:
        return {'width': 360, 'height': 640, 'radius': 42};
      case DeviceFrame.ipad:
        return {'width': 540, 'height': 720, 'radius': 36};
      case DeviceFrame.tablet:
        return {'width': 600, 'height': 800, 'radius': 24};
    }
  }

  @override
  Widget build(BuildContext context) {
    final dims = _dimensions;
    return Container(
      width: dims['width'],
      height: dims['height'],
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(dims['radius']!),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 30,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36),
              child: Column(
                children: [
                  _buildStatusBar(),
                  Expanded(child: _buildContent()),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 160,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 14,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 128,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            right: -1,
            top: 96,
            child: Container(
              width: 4,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            left: -1,
            top: 80,
            child: Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
          ),
          Positioned(
            left: -1,
            top: 128,
            child: Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(2),
                  bottomRight: Radius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      height: 24,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9:41',
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          Row(
            children: [
              Icon(Icons.signal_cellular_4_bar, size: 14, color: Colors.black),
              SizedBox(width: 4),
              Icon(Icons.wifi, size: 14, color: Colors.black),
              SizedBox(width: 4),
              Icon(Icons.battery_full, size: 14, color: Colors.black),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (components.isEmpty) {
      return Container(
        color: Colors.grey[100],
        child: const Center(
          child: Text(
            'Select components to preview',
            style: TextStyle(color: Colors.grey),
          ),
        ),
      );
    }

    Widget? appBar;
    Widget? bottomNav;
    final List<Widget> centerComponents = [];

    for (final component in components) {
      if (component.runtimeType.toString().contains('AppBar')) {
        appBar = component;
      } else if (component.runtimeType.toString().contains('BottomNav')) {
        bottomNav = component;
      } else {
        centerComponents.add(component);
      }
    }

    // Apply GlobalTheme to components
    return Consumer<AppState>(
      builder: (context, appState, _) {
        final theme = appState.globalTheme;

        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.primary,
              onPrimary: theme.primaryForeground,
              secondary: theme.secondary,
              onSecondary: theme.secondaryForeground,
              surface: theme.card,
              onSurface: theme.cardForeground,
              background: theme.background,
              onBackground: theme.foreground,
              error: theme.destructive,
              onError: theme.destructiveForeground,
              outline: theme.border,
              surfaceContainerHighest: theme.muted,
              onSurfaceVariant: theme.mutedForeground,
            ),
            textTheme: Theme.of(context).textTheme.apply(
              fontFamily: theme.fontFamily,
              fontSizeFactor: theme.fontSizeScale,
            ),
          ),
          child: Scaffold(
            appBar: appBar != null
                ? PreferredSize(
                    preferredSize: const Size.fromHeight(56),
                    child: appBar,
                  )
                : null,
            body: centerComponents.isEmpty
                ? const Center(
                    child: Text(
                      'Select components from the left panel',
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                      child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        alignment: WrapAlignment.center,
                        children: centerComponents,
                      ),
                    ),
                  ),
            bottomNavigationBar: bottomNav,
          ),
        );
      },
    );
  }
}
