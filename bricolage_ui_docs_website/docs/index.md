---
layout: home

hero:
  name: Bricolage UI
  text: Production-ready Flutter components
  tagline: Copy components directly into your project. No dependencies, complete control, infinite customization.
  actions:
    - theme: brand
      text: Get Started
      link: /docs/introduction
    - theme: alt
      text: View Components
      link: /components/overview
    - theme: alt
      text: Try Playground
      link: https://bricolage-ui.vercel.app

features:
  - title: Complete Control
    details: Components live in your codebase. Modify anything freely without package constraints.

  - title: Zero Dependencies
    details: No runtime dependencies. Only copy what you need, nothing more.

  - title: Theme-Aware
    details: Components respect your app's theme colors, typography, and styling.

  - title: CLI-First Approach
    details: Use our CLI to copy components directly into your project with full customization.

  - title: Production Ready
    details: Battle-tested components with accessibility, responsiveness, and best practices built-in.

  - title: 40+ Components
    details: Buttons, cards, forms, navigation, feedback, and advanced components ready to use.
---

## Quick Start

::: code-group

```bash [CLI (Recommended)]
# Install CLI globally
dart pub global activate bricolage_ui_cli

# Initialize your project
bricolage_ui init

# Add components you need
bricolage_ui add button card dialog

# Or add all 40+ components at once
bricolage_ui add-all
```

```bash [Package Mode]
# Add package dependency
flutter pub add bricolage_ui

# Import and use
import 'package:bricolage_ui/bricolage_ui.dart';
```

:::

## Why Bricolage UI?

<div class="feature-comparison">

| Feature             | CLI (Production)           | Package (Prototype)      |
| ------------------- | -------------------------- | ------------------------ |
| **Code Ownership**  | Code lives in your project | External dependency      |
| **Customization**   | Modify anything freely     | Limited to exposed props |
| **Runtime Deps**    | Zero dependencies          | Package adds to bundle   |
| **Version Control** | Track component changes    | Package version only     |
| **Bundle Size**     | Only what you use          | Entire package           |

</div>

<style>
.feature-comparison {
  margin: 2rem 0;
}
</style>
