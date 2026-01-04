# Radio

Single selection from multiple options.

## Installation

::: code-group

```bash [CLI]
bricolage_ui add radio
```

```bash [Package]
flutter pub add bricolage_ui
```

:::

## Usage

```dart
CustomRadio<String>(
  label: 'Option 1',
  value: 'option1',
  groupValue: selectedOption,
  onChanged: (value) {
    setState(() {
      selectedOption = value;
    });
  },
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
      <td><code>value</code></td>
      <td><code>T</code></td>
      <td>required</td>
      <td>Value of this radio button</td>
    </tr>
    <tr>
      <td><code>groupValue</code></td>
      <td><code>T?</code></td>
      <td><code>null</code></td>
      <td>Currently selected value</td>
    </tr>
  </tbody>
</table>
