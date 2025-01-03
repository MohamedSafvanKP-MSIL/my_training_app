import 'package:flutter/material.dart';

class SearchFilterViewModel extends ChangeNotifier {
  String _selectedFilter = 'Location';
  List<String> _selectedItems = [];

  final List<String> locations = ['Location 1', 'Location 2', 'Location 3'];
  final List<String> trainings = ['Training 1', 'Training 2', 'Training 3'];
  final List<String> trainers = ['Trainer 1', 'Trainer 2', 'Trainer 3'];

  String get selectedFilter => _selectedFilter;

  List<String> get selectedItems => _selectedItems;

  List<String> get availableOptions {
    switch (_selectedFilter) {
      case 'Location':
        return locations;
      case 'Training Name':
        return trainings;
      case 'Trainer Name':
        return trainers;
      default:
        return [];
    }
  }

  void updateSelectedFilter(String filter) {
    _selectedFilter = filter;
    notifyListeners();
  }

  void toggleSelection(String item) {
    if (_selectedItems.contains(item)) {
      _selectedItems.remove(item);
    } else {
      _selectedItems.add(item);
    }
    notifyListeners();
  }
}
