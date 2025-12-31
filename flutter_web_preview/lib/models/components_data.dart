import 'package:flutter/material.dart';
import '../models/component_config.dart';
import 'package:flutter_studio/flutter_studio.dart';

List<ComponentConfig> createAllComponents() {
  return [
    // Original 5
    ComponentConfig(
      id: 'button',
      name: 'Button',
      displayName: 'Button',
      icon: Icons.smart_button,
      properties: {
        'text': 'Click Me',
        'variant': 'filled',
        'size': 'medium',
        // Don't set colors here - let theme handle it
      },
    ),
    ComponentConfig(
      id: 'card',
      name: 'Card',
      displayName: 'Card',
      icon: Icons.credit_card,
      properties: {'variant': 'elevated', 'width': 250.0, 'height': 150.0},
    ),
    ComponentConfig(
      id: 'textfield',
      name: 'TextField',
      displayName: 'Text Field',
      icon: Icons.text_fields,
      properties: {'label': 'Email', 'placeholder': 'Enter email'},
    ),
    ComponentConfig(
      id: 'appbar',
      name: 'AppBar',
      displayName: 'App Bar',
      icon: Icons.web_asset,
      properties: {'title': 'My App'},
    ),
    ComponentConfig(
      id: 'bottomnav',
      name: 'BottomNavBar',
      displayName: 'Bottom Navigation',
      icon: Icons.space_dashboard,
      properties: {},
    ),

    // Phase 1 - Forms & Feedback
    ComponentConfig(
      id: 'badge',
      name: 'Badge',
      displayName: 'Badge',
      icon: Icons.label,
      properties: {'text': 'New', 'variant': 'default_'},
    ),
    ComponentConfig(
      id: 'checkbox',
      name: 'Checkbox',
      displayName: 'Checkbox',
      icon: Icons.check_box,
      properties: {'value': true, 'label': 'Accept terms'},
    ),
    ComponentConfig(
      id: 'radio',
      name: 'Radio',
      displayName: 'Radio',
      icon: Icons.radio_button_checked,
      properties: {'label': 'Option 1'},
    ),
    ComponentConfig(
      id: 'switch',
      name: 'Switch',
      displayName: 'Switch',
      icon: Icons.toggle_on,
      properties: {'value': true, 'label': 'Enable notifications'},
    ),
    ComponentConfig(
      id: 'slider',
      name: 'Slider',
      displayName: 'Slider',
      icon: Icons.tune,
      properties: {'value': 0.5, 'min': 0.0, 'max': 1.0, 'label': 'Volume'},
    ),
    ComponentConfig(
      id: 'avatar',
      name: 'Avatar',
      displayName: 'Avatar',
      icon: Icons.account_circle,
      properties: {'initials': 'JD', 'size': 'md'},
    ),
    ComponentConfig(
      id: 'alert',
      name: 'Alert',
      displayName: 'Alert',
      icon: Icons.info,
      properties: {
        'title': 'Important Notice',
        'description': 'This is an alert message',
        'variant': 'default_',
      },
    ),

    // Phase 2/3 - UI Elements
    ComponentConfig(
      id: 'divider',
      name: 'Divider',
      displayName: 'Divider',
      icon: Icons.horizontal_rule,
      properties: {},
    ),
    ComponentConfig(
      id: 'chip',
      name: 'Chip',
      displayName: 'Chip',
      icon: Icons.sell,
      properties: {'label': 'Flutter'},
    ),
    ComponentConfig(
      id: 'progress',
      name: 'Progress',
      displayName: 'Progress',
      icon: Icons.sync,
      properties: {'value': 0.7, 'variant': 'linear'},
    ),
    ComponentConfig(
      id: 'skeleton',
      name: 'Skeleton',
      displayName: 'Skeleton',
      icon: Icons.rectangle,
      properties: {'width': 200.0, 'height': 20.0},
    ),

    // New components
    ComponentConfig(
      id: 'textarea',
      name: 'Textarea',
      displayName: 'Textarea',
      icon: Icons.notes,
      properties: {
        'label': 'Description',
        'placeholder': 'Enter description...',
        'maxLines': 4,
      },
    ),
    ComponentConfig(
      id: 'formfield',
      name: 'FormField',
      displayName: 'Form Field',
      icon: Icons.input,
      properties: {'label': 'Email', 'required': true},
    ),
    ComponentConfig(
      id: 'togglegroup',
      name: 'ToggleGroup',
      displayName: 'Toggle Group',
      icon: Icons.view_week,
      properties: {
        'items': ['Left', 'Center', 'Right'],
      },
    ),
    ComponentConfig(
      id: 'breadcrumb',
      name: 'Breadcrumb',
      displayName: 'Breadcrumb',
      icon: Icons.chevron_right,
      properties: {},
    ),
    ComponentConfig(
      id: 'pagination',
      name: 'Pagination',
      displayName: 'Pagination',
      icon: Icons.format_list_numbered,
      properties: {'currentPage': 1, 'totalPages': 10},
    ),
    ComponentConfig(
      id: 'empty',
      name: 'Empty',
      displayName: 'Empty State',
      icon: Icons.inbox,
      properties: {
        'title': 'No items found',
        'description': 'Try adjusting your filters',
      },
    ),
    ComponentConfig(
      id: 'spinner',
      name: 'Spinner',
      displayName: 'Spinner',
      icon: Icons.sync,
      properties: {'type': 'circular', 'size': 40.0},
    ),
    ComponentConfig(
      id: 'dropdown',
      name: 'Dropdown',
      displayName: 'Dropdown',
      icon: Icons.arrow_drop_down,
      properties: {},
    ),
    ComponentConfig(
      id: 'popover',
      name: 'Popover',
      displayName: 'Popover',
      icon: Icons.chat_bubble_outline,
      properties: {'position': 'top'},
    ),
    ComponentConfig(
      id: 'table',
      name: 'Table',
      displayName: 'Table',
      icon: Icons.table_chart,
      properties: {},
    ),
  ];
}
