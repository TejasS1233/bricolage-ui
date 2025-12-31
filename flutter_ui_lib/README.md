# Flutter Studio

A modern Flutter UI component library with 40+ customizable components.

## Installation

```yaml
dependencies:
  flutter_studio: ^1.0.0
```

## Usage

```dart
import 'package:flutter_studio/flutter_studio.dart';

CustomButton(
  text: 'Click Me',
  variant: CustomButtonVariant.filled,
  onPressed: () {},
)
```

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

Customize colors, typography, spacing, radius, and shadows by overriding theme files:

```dart
CustomButton(
  text: 'Click Me',
  variant: CustomButtonVariant.filled,
  onPressed: () {},
)
```

### CustomCard

```dart
CustomCard(
  variant: CustomCardVariant.elevated,
  child: Text('Card Content'),
)
```

### CustomTextField

```dart
// lib/theme/colors.dart
import 'package:flutter_studio/flutter_studio.dart';

class UIColors {
  static const Color primary = Color(0xFF6366F1);
  static const Color secondary = Color(0xFF8B5CF6);
  // ... customize all colors
}
```

All theme files: `colors.dart`, `typography.dart`, `radius.dart`, `spacing.dart`, `shadows.dart`

## License

MIT
