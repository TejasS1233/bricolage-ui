# Bricolage UI Playground

Interactive web application for previewing, customizing, and exporting Flutter UI components with real-time theme customization and visual effects.

## What's New in v1.5.0

- Visual effects system (glassmorphism, neumorphism, gradients, border glow, animations)
- New theme presets: Bubblegum, Vintage, Amethyst, Spring
- Enhanced effects tab with real-time preview
- Effect parameter customization (blur, opacity, glow, animation speed)

## Live Demo

Visit [bricolage-ui.vercel.app](https://bricolage-ui.vercel.app) to try it out.

## Running Locally

```bash
cd bricolage_ui_playground
flutter pub get
flutter run -d chrome
```

## Features

### Component Library

- 40+ pre-built Flutter UI components
- Real-time preview in mobile phone frame
- Component property customization panel
- Interactive component selection

### Preset UI Layouts

- Dashboard layout with stats, progress, and alerts
- Profile layout with avatar, bio, and settings
- Social feed layout with posts and interactions
- Form layout with various input types
- Settings layout with toggles and preferences

### Theme System

- Global theme customization with 40+ color properties
- 12 theme presets: Default, Neo-Brutalism, Cyberpunk, Bento/iOS, Bubblegum, Vintage, Amethyst, Spring, Monochrome, Retro Windows
- Visual effects: Glassmorphism, Neumorphism, Gradients, Border Glow, Pulse, Floating, Tilt Hover, Hard Shadows
- Typography control with Google Fonts integration
- Adjustable scales for radius, spacing, shadows, and font sizes
- Real-time theme preview across all components

### Export Functionality

- Download single consolidated `theme.dart` file
- Includes all theme customizations (colors, typography, radius, spacing, shadows, effects)
- Ready-to-integrate into Flutter projects
- No need for multiple theme files

## Technology Stack

- Flutter Web
- Provider for state management
- Google Fonts for typography
- Flutter ColorPicker for color customization
- Archive package for ZIP generation

## Project Structure

```
lib/
├── models/
│   ├── app_state.dart           # Global state management
│   ├── component_config.dart    # Component definitions
│   ├── components_data.dart     # Component metadata
│   └── global_theme.dart        # Theme system
├── screens/
│   └── preview_screen.dart      # Main application screen
├── widgets/
│   ├── component_selector.dart  # Component picker
│   ├── customization_panel.dart # Property editor
│   ├── mobile_phone_frame.dart  # Preview frame with layouts
│   └── theme_customizer.dart    # Theme editor
└── services/
    ├── code_generator.dart      # Code generation
    ├── component_code_generator.dart # Theme file generation
    ├── download_helper.dart     # Browser download helper
    └── zip_builder.dart         # ZIP file builder
```

## Documentation

Full component documentation available at [docs-bricolage-ui.vercel.app](https://docs-bricolage-ui.vercel.app)

## Related Projects

- [bricolage_ui](../bricolage_ui) - Core component library
- [bricolage_ui_cli](../bricolage_ui_cli) - CLI tool for component generation
- [bricolage_ui_docs_website](../bricolage_ui_docs_website) - VitePress documentation site
