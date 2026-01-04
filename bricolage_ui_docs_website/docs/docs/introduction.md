# Introduction

Welcome to **Bricolage UI** — a modern component library that puts you in control.

## What is Bricolage UI?

Bricolage UI provides production-ready Flutter components that you **own**. Unlike traditional packages, our CLI-first approach copies components directly into your project, giving you complete control over every line of code.

## Philosophy

We believe developers should own their UI code. Traditional component libraries lock you into their API decisions and force you to work around limitations. Bricolage UI is different:

- **Copy, Don't Import** — Components live in your codebase
- **Modify Freely** — Change anything without fighting abstractions
- **Zero Lock-in** — No runtime dependencies or package constraints
- **Theme Native** — Components adapt to your app's theme automatically

## Two Modes, Two Use Cases

### CLI Mode (Production) Recommended

```bash
bricolage_ui add button card dialog  # Add specific components
bricolage_ui add-all                 # Or add all 40+ components at once
```

**Best for:**

- Production applications
- When you need full customization
- Building a design system
- Long-term maintainability

### Package Mode (Prototyping)

```dart
import 'package:bricolage_ui/bricolage_ui.dart';
```

**Best for:**

- Quick prototypes and demos
- Testing UI concepts
- When convenience > control

## What You Get

- **40+ Components** — Buttons, cards, forms, navigation, feedback, and more
- **Accessible** — WCAG compliant with keyboard navigation
- **Responsive** — Works beautifully on mobile, tablet, and desktop
- **Theme-Aware** — Respects your app's theme configuration
- **Well Documented** — Clear examples and API references
- **Type Safe** — Full Dart type safety with IDE support

## Next Steps

<div class="next-steps">

**[Installation →](/docs/installation)**  
Get Bricolage UI set up in your project

**[CLI vs Package →](/docs/cli-vs-package)**  
Understand which mode is right for you

**[Browse Components →](/components/overview)**  
Explore all available components

</div>

<style>
.next-steps {
  display: grid;
  gap: 1rem;
  margin: 2rem 0;
}

.next-steps a {
  display: block;
  padding: 1rem;
  border: 1px solid var(--vp-c-divider);
  border-radius: 8px;
  text-decoration: none;
  transition: all 0.2s;
}

.next-steps a:hover {
  border-color: var(--vp-c-brand-1);
  background: var(--vp-c-bg-soft);
}

.next-steps strong {
  color: var(--vp-c-brand-1);
  font-size: 1.1rem;
}
</style>
