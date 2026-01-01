# Accessibility Guide

## Overview

Flutter Studio components are **enterprise-ready** with **built-in accessibility support** that goes beyond standard Material widgets. Every component is designed with screen readers, keyboard navigation, and WCAG 2.1 compliance in mind.

## Why Accessibility Matters for Enterprise

- **Legal Compliance**: Meet ADA, Section 508, and WCAG 2.1 AA standards
- **Market Reach**: 15% of the global population has some form of disability
- **Better UX**: Accessible design benefits all users, not just those with disabilities
- **Corporate Social Responsibility**: Demonstrate commitment to inclusivity

## Built-in Accessibility Features

### 1. **Screen Reader Support (TalkBack & VoiceOver)**

Every component includes semantic labels and hints:

```dart
// CustomButton automatically provides semantic labels
CustomButton(
  text: 'Submit Form',
  onPressed: () {},
  // Screen reader announces: "Submit Form, button"
)

// Icon buttons include tooltips for context
CustomButton(
  text: 'Delete',
  icon: Icons.delete,
  variant: CustomButtonVariant.icon,
  // Screen reader announces: "Delete, button" via tooltip
)
```

### 2. **Semantic Grouping**

Components use `MergeSemantics` to group related elements:

```dart
// CustomSwitch groups label and toggle for cohesive reading
CustomSwitch(
  value: isDarkMode,
  onChanged: (val) {},
  label: 'Dark Mode',
  // Screen reader announces: "Dark Mode, switch, on/off"
)
```

### 3. **Disabled State Announcements**

Disabled components are clearly communicated:

```dart
CustomButton(
  text: 'Submit',
  onPressed: null, // Disabled
  // Screen reader announces: "Submit, button, disabled"
)
```

### 4. **Dialog Accessibility**

CustomDialog provides proper navigation and scope:

```dart
CustomDialog.show(
  context,
  title: 'Confirm Delete',
  description: 'This action cannot be undone',
  confirmText: 'Delete',
  cancelText: 'Cancel',
);
// Screen reader announces:
// - Dialog scope: "Dialog: Confirm Delete"
// - Header: "Confirm Delete"
// - Description: "This action cannot be undone"
// - Buttons: "Delete, button" and "Cancel, button"
```

### 5. **Card Accessibility**

Cards with tap actions are properly labeled:

```dart
CustomCard(
  onTap: () => openDetails(),
  semanticLabel: 'User profile card, tap to view details',
  child: ProfileWidget(),
  // Screen reader announces: "User profile card, tap to view details, button"
)
```

## Micro-Animations for Better Feedback

Flutter Studio components include **subtle animations** that enhance the user experience:

### Button Press Feedback

- **ScaleTransition**: Buttons scale to 95% on press for tactile feedback
- **Duration**: 100ms for instant response
- **Accessibility**: Respects `MediaQuery.of(context).disableAnimations`

```dart
CustomButton(
  text: 'Press Me',
  onPressed: () {},
  // Automatically scales down on press, then back up
)
```

### Dialog Animations

- **FadeTransition**: Smooth fade-in over 200ms
- **SlideTransition**: Subtle upward movement for modern feel
- **Non-disruptive**: Animations are quick and don't delay interaction

## Testing Accessibility

### Android (TalkBack)

1. Enable TalkBack: `Settings > Accessibility > TalkBack`
2. Navigate with swipe gestures
3. Verify all buttons, switches, and inputs are announced correctly

### iOS (VoiceOver)

1. Enable VoiceOver: `Settings > Accessibility > VoiceOver`
2. Use swipe gestures to navigate
3. Verify semantic labels and hints are clear

### Automated Testing

```dart
testWidgets('CustomButton has correct semantics', (tester) async {
  await tester.pumpWidget(
    MaterialApp(
      home: CustomButton(
        text: 'Submit',
        onPressed: () {},
      ),
    ),
  );

  // Find by semantic label
  expect(
    find.bySemanticsLabel('Submit'),
    findsOneWidget,
  );

  // Verify button semantics
  final button = tester.widget<Semantics>(find.byType(Semantics));
  expect(button.properties.button, isTrue);
});
```

## WCAG 2.1 Compliance Checklist

### Level A

- [x] 1.1.1 Non-text Content: All icons have text alternatives
- [x] 2.1.1 Keyboard: All interactive elements support keyboard navigation
- [x] 2.4.4 Link Purpose: Button labels clearly describe their action
- [x] 4.1.2 Name, Role, Value: All components have proper semantic roles

### Level AA

- [x] 1.4.3 Contrast (Minimum): Theme colors meet 4.5:1 contrast ratio
- [x] 1.4.11 Non-text Contrast: Interactive elements have sufficient contrast
- [x] 2.4.7 Focus Visible: Focus indicators are clearly visible
- [x] 4.1.3 Status Messages: Toasts and alerts use appropriate ARIA roles

### Level AAA (Recommended)

- [x] 1.4.6 Contrast (Enhanced): Primary colors exceed 7:1 contrast
- [x] 2.5.5 Target Size: Touch targets are minimum 44x44 dp
- [x] 3.2.5 Change on Request: No automatic changes without user action

## Best Practices

### 1. Always Provide Semantic Labels

```dart
// Good
CustomCard(
  semanticLabel: 'Product card: Laptop, $999',
  onTap: () {},
  child: ProductWidget(),
)

// Bad
CustomCard(
  onTap: () {}, // No context for screen readers
  child: ProductWidget(),
)
```

### 2. Use Meaningful Button Text

```dart
// Good
CustomButton(
  text: 'Add to Cart',
  onPressed: addToCart,
)

// Bad
CustomButton(
  text: 'Click Here', // Vague and unhelpful
  onPressed: addToCart,
)
```

### 3. Respect System Settings

```dart
// Flutter Studio components automatically respect:
// - MediaQuery.textScaleFactor (font scaling)
// - MediaQuery.disableAnimations (reduced motion)
// - Theme.of(context) (dark mode, contrast)
```

### 4. Test with Real Users

- Include users with disabilities in your testing process
- Use automated tools (axe, WAVE) as a starting point
- Manual testing with screen readers is essential

## Resources

- [Flutter Accessibility Guide](https://docs.flutter.dev/development/accessibility-and-localization/accessibility)
- [WCAG 2.1 Guidelines](https://www.w3.org/WAI/WCAG21/quickref/)
- [Material Design Accessibility](https://material.io/design/usability/accessibility.html)
- [Section 508 Standards](https://www.section508.gov/)

## Enterprise Support

For enterprises requiring VPAT documentation or accessibility audits, contact us for customized support and training.

---
