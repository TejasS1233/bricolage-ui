# Skeleton

Loading placeholders that mimic content structure.

## Installation

::: code-group

```bash [CLI]
bricolage_ui add skeleton
```

```bash [Package]
flutter pub add bricolage_ui
```

:::

## Usage

```dart
// Text skeleton
CustomSkeleton.text(lines: 3)

// Card skeleton
CustomSkeleton.card()

// Avatar skeleton
CustomSkeleton.avatar(size: 64)

// Custom skeleton
CustomSkeleton(
  width: 200,
  height: 100,
)
```

## API Reference

### Properties

<table class="props-table">
  <thead>
    <tr>
      <th>Property</th>
      <th>Type</th>
      <th>Default</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><code>width</code></td>
      <td><code>double?</code></td>
      <td><code>null</code></td>
      <td>Skeleton width</td>
    </tr>
    <tr>
      <td><code>height</code></td>
      <td><code>double?</code></td>
      <td><code>null</code></td>
      <td>Skeleton height</td>
    </tr>
  </tbody>
</table>
