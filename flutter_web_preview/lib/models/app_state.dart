import 'package:flutter/material.dart';
import '../models/component_config.dart';
import '../models/global_theme.dart';

enum DeviceFrame { iphone14, pixel7, ipad, tablet }

class AppState extends ChangeNotifier {
  List<ComponentConfig> _components = [];
  String? _selectedComponentId;
  DeviceFrame _selectedFrame = DeviceFrame.iphone14;
  GlobalTheme _globalTheme = GlobalTheme();

  AppState(this._components);

  List<ComponentConfig> get components => _components;
  
  List<ComponentConfig> get selectedComponents => 
      _components.where((c) => c.isSelected).toList();
  
  String? get selectedComponentId => _selectedComponentId;
  
  ComponentConfig? get selectedComponent => 
      _selectedComponentId != null
          ? _components.firstWhere((c) => c.id == _selectedComponentId!)
          : null;
  
  DeviceFrame get selectedFrame => _selectedFrame;
  GlobalTheme get globalTheme => _globalTheme;
  
  void setDeviceFrame(DeviceFrame frame) {
    _selectedFrame = frame;
    notifyListeners();
  }
  
  void updateGlobalTheme(GlobalTheme theme) {
    _globalTheme = theme;
    notifyListeners();
  }

  void toggleComponent(String id) {
    final component = _components.firstWhere((c) => c.id == id);
    component.isSelected = !component.isSelected;
    notifyListeners();
  }

  void selectComponentForCustomization(String id) {
    _selectedComponentId = id;
    notifyListeners();
  }

  void updateProperty(String componentId, String key, dynamic value) {
    final component = _components.firstWhere((c) => c.id == componentId);
    component.properties[key] = value;
    notifyListeners();
  }

  void selectAll() {
    for (var component in _components) {
      component.isSelected = true;
    }
    notifyListeners();
  }

  void deselectAll() {
    for (var component in _components) {
      component.isSelected = false;
    }
    notifyListeners();
  }
  
  void reorderComponents(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final selected = selectedComponents;
    final item = selected.removeAt(oldIndex);
    selected.insert(newIndex, item);
    notifyListeners();
  }
}
