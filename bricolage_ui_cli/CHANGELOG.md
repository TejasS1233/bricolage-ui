## 0.4.0 - Bricolage UI Rebrand

### BREAKING CHANGES

- **Rebranded from Flutter Studio CLI to Bricolage UI CLI**
- Package renamed from `flutter_studio_cli` to `bricolage_ui_cli` on pub.dev
- Executable renamed from `flutter_studio` to `bricolage_ui`
- Repository moved to [github.com/TejasS1233/bricolage-ui](https://github.com/TejasS1233/bricolage-ui)

### Migration

Update your installation:
```bash
# Remove old CLI
dart pub global deactivate flutter_studio_cli

# Install new CLI
dart pub global activate bricolage_ui_cli
```

Commands are now:
- `bricolage_ui init`
- `bricolage_ui add <components>`
- `bricolage_ui add-all`
- `bricolage_ui list`

---

## 0.3.0

- **Consolidated theme file**: Now downloads single `theme.dart` file instead of 6 separate theme files
- Simplified theme management and imports

## 0.2.0

- Added `add-all` command to install all 40+ components at once
- Added `effects.dart` to theme files (visual effects utilities)
- Improved download progress feedback with success/fail counts
- Better error handling with return status tracking

## 0.1.0

- Initial release of Bricolage UI CLI (formerly Flutter Studio CLI)
- `init` command to set up project structure and download theme files
- `add` command to download components from GitHub
- `list` command to show all available components
- Support for 40+ UI components across 6 categories
- Inspired by shadcn/ui's copy-paste approach
