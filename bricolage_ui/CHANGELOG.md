## 1.3.0 - Bricolage UI Rebrand

### BREAKING CHANGES

- **Rebranded from Flutter Studio to Bricolage UI**
- Package name remains `bricolage_ui` on pub.dev
- Repository moved to [github.com/TejasS1233/bricolage-ui](https://github.com/TejasS1233/bricolage-ui)
- Documentation: [docs-bricolage-ui.vercel.app](https://docs-bricolage-ui.vercel.app)
- Live Preview: [bricolage-ui.vercel.app](https://bricolage-ui.vercel.app)

### Migration

No code changes required. The API remains fully compatible.

---

## 1.2.0

### BREAKING CHANGES

- **All components now use theme files**: Components now import and use `theme.dart` instead of `Theme.of(context)`. This ensures that exported theme customizations are actually applied to components.
- **Consolidated theme files**: All 6 theme files (colors, typography, radius, spacing, shadows, effects) are now combined into a single `theme.dart` file for convenience
- **Fixed theme export color bug**: Color values now correctly include `0xFF` alpha prefix (was missing, causing transparent colors)
- Theme export workflow is now fully functional: customize theme in web preview → export theme file → download components → components use your custom theme
- Updated all 33 components to use `UIColors`, `UITypography`, `UIRadius`, `UISpacing`, `UIShadows`, and `UIEffects`
- Removed all hardcoded values and deprecated APIs from components

### New Features

- Added `UIBorder` class with thin/medium/thick constants for consistent border widths
- Web preview now exports single consolidated `theme.dart` file (simplified from zip package)
- All 12 preset themes work correctly with consolidated export

### Bug Fixes

- Fixed color hex generation missing `0xFF` alpha channel prefix
- Replaced all deprecated `withOpacity()` calls with `withValues(alpha:)`
- Replaced all deprecated `Color.fromRGBO()` with `withValues()`
- Fixed deprecated `Matrix4.scale()` to `Matrix4.diagonal3Values()`
- Removed all hardcoded `Colors.black26`, `Colors.transparent`, `Colors.white` values

### Migration Guide

If you're upgrading from v1.1.0 or earlier:

1. Run `bricolage_ui init` to get the new consolidated theme.dart file
2. Re-download any components you're using (or use `bricolage_ui add-all`)
3. Update your imports from individual theme files to `import '../theme/theme.dart';`
4. Components will now respect your theme customizations automatically
5. Download new theme.dart from web preview with proper color values

## 1.1.0

- Added `effects.dart` theme file with visual effects utilities (glassmorphism, neumorphism, gradients, glow)
- Improved documentation accuracy (removed incomplete dark mode claims)
- Enhanced theme system documentation
- Added GlassContainer widget for glassmorphism effects
- Better theme integration examples

## 1.0.1

- Fixed repository URL
- Added example project
- Improved documentation

## 1.0.0

- Initial release
- 40+ customizable UI components
- Theme system with colors, typography, radius, spacing, and shadows
- Comprehensive documentation
