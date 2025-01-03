import 'package:flutter/material.dart';
import 'package:my_training_app/core/logs/app_logs.dart';

import '../../core/utils/constants.dart';
import '../../data/models/init_response.dart';
import 'home_view_model.dart';

class SearchFilterViewModel extends ChangeNotifier {
  // Current selected filter
  String selectedFilter = location;

  // Original and filtered training data
  List<TrainingItem> _originalTrainings = [];
  List<TrainingItem> _searchFilteredTrainings = [];

  // Selected filter values
  final Map<String, List<String>> _selectedItems = {
    location: [],
    trainingName: [],
    trainerName: [],
  };

  // Search term for filtering
  String searchTerm = '';

  List<TrainingItem> get notFilteredTrainings => _originalTrainings;

  List<TrainingItem> get searchFilteredTrainings => _searchFilteredTrainings;

  List<String> getFilteredList() {
    if (searchTerm.isEmpty) {
      return getAvailableOptions();
    } else {
      return getFilteredTrainings();
    }
  }

  setTrainings(List<TrainingItem> items) {
    _originalTrainings = items;
    _searchFilteredTrainings = items;
    notifyListeners();
  }

  List<String> getFilteredTrainings() {
    List<String> filtered = getAvailableOptions();

    if (searchTerm.isNotEmpty) {
      filtered = filtered
          .where(
              (item) => item.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    }
    return filtered;
  }

  // Get available options for the current filter
  List<String> getAvailableOptions() {
    switch (selectedFilter) {
      case location:
        return _getUniqueOptions((item) => item.location);
      case trainingName:
        return _getUniqueOptions((item) => item.trainingName);
      case trainerName:
        return _getUniqueOptions((item) => item.traineeName);
      default:
        return [];
    }
  }

  List<String> _getUniqueOptions(String Function(TrainingItem) keyExtractor) {
    return _originalTrainings.map(keyExtractor).toSet().toList();
  }

  void updateSelectedFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  void toggleSelectedItem(String item, HomeViewModel homeViewModel) {
    final selectedItems = _selectedItems[selectedFilter] ?? [];
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    _filterAndUpdate(homeViewModel);
    searchTerm = '';
    notifyListeners();
  }

  void updateSearchTerm(String term) {
    searchTerm = term;
    notifyListeners();
  }

  List<String> getSelectedFilter() {
    return _selectedItems[selectedFilter] ?? [];
  }

  void _filterAndUpdate(HomeViewModel homeViewModel) {
    List<TrainingItem> filtered = _originalTrainings;
    _selectedItems.forEach((filter, selectedValues) {
      if (selectedValues.isNotEmpty) {
        filtered = filtered.where((item) {
          switch (filter) {
            case location:
              return selectedValues.contains(item.location);
            case trainingName:
              return selectedValues.contains(item.trainingName);
            case trainerName:
              return selectedValues.contains(item.traineeName);
            default:
              return true;
          }
        }).toList();
      }
    });
    homeViewModel.setFilteredItems(
        filtered, _selectedItems.values.any((list) => list.isNotEmpty));
  }
}
