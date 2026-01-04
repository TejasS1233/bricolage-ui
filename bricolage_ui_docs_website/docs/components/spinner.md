# Spinner

Loading indicators with various styles.

## Installation

::: code-group

```bash [CLI]
bricolage_ui add spinner
```

```bash [Package]
flutter pub add bricolage_ui
```

:::

## Usage

```dart
CustomSpinner()

// With label
CustomSpinner(
  label: 'Loading...',
)

// Different sizes
CustomSpinner(
  size: SpinnerSize.small,
)

CustomSpinner(
  size: SpinnerSize.large,
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
      <td><code>size</code></td>
      <td><code>SpinnerSize</code></td>
      <td><code>medium</code></td>
      <td>Spinner size</td>
    </tr>
    <tr>
      <td><code>label</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Loading label</td>
    </tr>
  </tbody>
</table>
