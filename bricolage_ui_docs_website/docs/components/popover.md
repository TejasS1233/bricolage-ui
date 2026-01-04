# Popover

Floating content containers positioned near trigger element.

## Installation

::: code-group

```bash [CLI]
bricolage_ui add popover
```

```bash [Package]
flutter pub add bricolage_ui
```

:::

## Usage

```dart
CustomPopover(
  content: Text('Popover content'),
  child: CustomButton(
    text: 'Show Popover',
    onPressed: () {},
  ),
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
      <td><code>content</code></td>
      <td><code>Widget</code></td>
      <td>required</td>
      <td>Popover content</td>
    </tr>
    <tr>
      <td><code>child</code></td>
      <td><code>Widget</code></td>
      <td>required</td>
      <td>Trigger widget</td>
    </tr>
  </tbody>
</table>
