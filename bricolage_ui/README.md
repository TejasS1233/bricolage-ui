# Bricolage UI

A modern Flutter UI component library with **enterprise-ready accessibility**, **visual effects**, and **40+ customizable components**.

## What Makes Bricolage UI Different?

### Visual Effects System

- **Glassmorphism** with backdrop blur
- **Neumorphism** with soft shadows
- **Gradient backgrounds** with customizable angles
- **Border glow** animations
- **Pulse, floating, and tilt hover** effects
- **Hard shadows** for neo-brutalism style
- Mix and match effects on any component

### Enterprise-Grade Accessibility

- **Screen reader support** out of the box (TalkBack & VoiceOver)
- **WCAG 2.1 AA compliant** with proper semantic labels
- **Keyboard navigation** and focus management
- **No additional configuration required** – accessibility is built in

### Two Modes for Every Use Case

Choose the right approach for your project:

| Feature            | CLI (Production Mode)  | Package (Prototyping Mode) |
| ------------------ | ---------------------- | -------------------------- |
| **Best For**       | Production apps        | Rapid prototyping          |
| **Code Ownership** | ✅ Full control        | ⚠️ Dependency              |
| **Customization**  | ✅ Edit freely         | 🔧 Override props          |
| **Bundle Size**    | ✅ Copy what you need  | ⚠️ Entire library          |
| **Updates**        | 🔧 Manual merge        | ✅ `pub upgrade`           |
| **Theme Control**  | ✅ Direct file editing | 🔧 Theme overrides         |

**💡 Recommendation**: Use **CLI for production apps** (like shadcn/ui), use **package for demos and MVPs**.

### Fluid Micro-Animations

- **ScaleTransition** on button presses for tactile feedback
- **FadeTransition** on dialogs for smooth appearance
- **Respects reduced motion** settings automatically
- **100-200ms animations** – fast and non-intrusive

## Installation

### Option 1: CLI (Recommended for Production)

```bash
# Install CLI globally
dart pub global activate bricolage_ui_cli

# Initialize in your project
bricolage_ui init

# Copy components as needed
bricolage_ui add button card dialog
# Or add all: bricolage_ui add-all
```

[Full CLI Documentation](bricolage_ui_cli/README.md)

### Option 2: Package (Prototyping)

```yaml
dependencies:
  bricolage_ui: ^1.5.0
```

## Usage

### Basic Components

```dart
import 'package:bricolage_ui/bricolage_ui.dart';

CustomButton(
  text: 'Click Me',
  variant: CustomButtonVariant.filled,
  onPressed: () {},
)
```

### Using Visual Effects

Wrap any component in `EffectContainer` to apply visual effects:

```dart
import 'package:bricolage_ui/bricolage_ui.dart';

// Glassmorphism effect
EffectContainer(
  enableGlassmorphism: true,
  glassBlur: 10.0,
  glassOpacity: 0.2,
  child: CustomCard(
    child: Text('Frosted glass card'),
  ),
)

// Neumorphism effect
EffectContainer(
  enableNeumorphism: true,
  neumorphismIntensity: 0.5,
  child: CustomButton(
    text: 'Soft 3D Button',
    onPressed: () {},
  ),
)

// Multiple effects combined
EffectContainer(
  enableGradients: true,
  gradientStart: Color(0xFF6366F1),
  gradientEnd: Color(0xFF8B5CF6),
  enableBorderGlow: true,
  glowColor: Color(0xFF6366F1),
  glowIntensity: 0.5,
  enablePulse: true,
  child: CustomCard(
    child: Text('Glowing gradient card'),
  ),
)

// Use theme defaults from UIEffects
EffectContainer(
  enableGlassmorphism: UIEffects.enableGlassmorphism,
  glassBlur: UIEffects.glassBlur,
  glassOpacity: UIEffects.glassOpacity,
  child: CustomCard(
    child: Text('Uses theme defaults'),
  ),
)
```

**Available effects:**

- `enableGlassmorphism` - Frosted glass with backdrop blur
- `enableNeumorphism` - Soft shadows (3D raised/pressed effect)
- `enableGradients` - Linear gradient backgrounds
- `enableBorderGlow` - Animated glowing borders
- `enableHardShadow` - Hard offset shadows (neo-brutalism)
- `enablePulse` - Pulsing scale animation
- `enableFloating` - Floating up/down animation
- `enableTiltHover` - 3D tilt effect on hover
- `enableHoverAnimations` - Scale on hover

**Tip:** Customize effect defaults in `theme.dart` (CLI mode) or export from the [web preview](https://bricolage-ui.vercel.app) to get your theme file with effect settings.

## Components

**Buttons & Inputs**

- CustomButton, CustomTextField, CustomTextarea, CustomCheckbox, CustomRadio, CustomSwitch, CustomSlider, CustomSelect, CustomDropdown

**Layout & Navigation**

- CustomCard, CustomAppBar, CustomBottomNavBar, CustomTabs, CustomBreadcrumb, CustomPagination

**Feedback**

- CustomAlert, CustomToast, CustomDialog, CustomSpinner, CustomProgress, CustomSkeleton

**Display**

- CustomBadge, CustomChip, CustomAvatar, CustomTooltip, CustomDivider, CustomEmpty

**Advanced**

- CustomTable, CustomAccordion, CustomBottomSheet, CustomPopover, CustomFormField, CustomToggleGroup

## Theming

Components respect your app's theme configuration:

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.light(
      primary: Color(0xFF6366F1),
      secondary: Color(0xFF8B5CF6),
    ),
  ),
  home: MyHomePage(),
)
```

### Custom Theme Colors

```dart
// Many components use Theme.of(context).colorScheme
CustomButton(
  text: 'Primary Button',
  backgroundColor: Theme.of(context).colorScheme.primary,
)

CustomTextField(
  label: 'Email',
  // Or override with custom colors
  borderColor: Color(0xFF6366F1),
)
```

### Override Theme File (CLI Mode)

When using CLI, directly edit the unified theme file for full control:

```dart
// lib/theme/theme.dart
class UIColors {
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF8B5CF6);
  // Full customization
}

class UITypography {
  // Typography customization
}

class UIRadius {
  // Border radius customization
}
// ... all theme classes in one file
```

All theme constants are in a single consolidated `theme.dart` file for convenience.

## Accessibility

Bricolage UI components are **enterprise-ready** with built-in accessibility:

- **Screen reader support** (TalkBack, VoiceOver)
- **WCAG 2.1 AA compliant** semantic labels
- **Keyboard navigation** and focus management
- **Respects system settings** (text scaling, reduced motion)
- **Automated testing** with semantic matchers

**Example**: Screen readers announce buttons, switches, and dialogs correctly without additional configuration.

[Full Accessibility Guide](ACCESSIBILITY.md)

## Micro-Animations

Subtle animations for better UX:

- **Buttons**: Scale to 95% on press (100ms)
- **Dialogs**: Fade + slide in (200ms)
- **Respects** `MediaQuery.disableAnimations` for accessibility

## Web Preview & Customization

Run the interactive web preview to customize components in real-time:

```bash
cd bricolage_ui_playground
flutter run -d chrome
```

Adjust colors, fonts, and component props live!

## License

MIT
