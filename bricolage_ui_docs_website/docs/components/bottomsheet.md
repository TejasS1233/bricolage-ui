# Bottom Sheet

Slide-up modal panels from the bottom.

## Installation

::: code-group

```bash [CLI]
bricolage_ui add bottomsheet
```

```bash [Package]
flutter pub add bricolage_ui
```

:::

## Usage

```dart
CustomBottomSheet.show(
  context,
  title: 'Share',
  child: Column(
    children: [
      ListTile(
        leading: Icon(Icons.link),
        title: Text('Copy link'),
        onTap: () {},
      ),
      ListTile(
        leading: Icon(Icons.email),
        title: Text('Email'),
        onTap: () {},
      ),
    ],
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
      <td><code>title</code></td>
      <td><code>String?</code></td>
      <td><code>null</code></td>
      <td>Sheet title</td>
    </tr>
    <tr>
      <td><code>child</code></td>
      <td><code>Widget</code></td>
      <td>required</td>
      <td>Sheet content</td>
    </tr>
  </tbody>
</table>
