import 'package:flutter/material.dart';
import 'package:my_training_app/core/logs/app_logs.dart';

import '../../data/models/init_response.dart';
import 'home_view_model.dart';

class SearchFilterViewModel extends ChangeNotifier {
  String selectedFilter = 'Location';
  List<TrainingItem> _notFilteredTrainings = [];
  List<TrainingItem> _searchFilteredTrainings = [];
  List<String> selectedItems = [];

  List<String> selectedPlaceItems = [];
  List<String> selectedTrainerItems = [];
  List<String> selectedTraineeItems = [];

  String searchTerm = '';

  List<TrainingItem> get notFilteredTrainings => _notFilteredTrainings;

  List<TrainingItem> get searchFilteredTrainings => _searchFilteredTrainings;

  List<String> getFilteredList() {
    if (searchTerm.isEmpty) {
      return getAvailableOptions();
    } else {
      return getFilteredTrainings();
    }
  }

  setNotFilteredTrainings(List<TrainingItem> items) {
    _notFilteredTrainings = items;
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

  List<String> getAvailableOptions() {
    switch (selectedFilter) {
      case 'Location':
        return _notFilteredTrainings
            .map((item) => item.location)
            .toSet()
            .toList();
      case 'Training Name':
        return _notFilteredTrainings
            .map((item) => item.trainingName)
            .toSet()
            .toList();
      case 'Trainer Name':
        return _notFilteredTrainings
            .map((item) => item.traineeName)
            .toSet()
            .toList();
      default:
        return [];
    }
  }

  void updateSelectedFilter(String filter) {
    selectedFilter = filter;
    notifyListeners();
  }

  void toggleSelectedItem(String item, HomeViewModel homeViewModel) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }

    _filterAndUpdate(homeViewModel);

    notifyListeners();
  }

  void updateSearchTerm(String term) {
    searchTerm = term;
    notifyListeners();
  }

  void _filterAndUpdate(HomeViewModel homeViewModel) {
    List<TrainingItem> filtered = _notFilteredTrainings;
    if (selectedFilter == 'Location') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty || selectedItems.contains(item.location))
          .toList();
    } else if (selectedFilter == 'Training Name') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty ||
              selectedItems.contains(item.trainingName))
          .toList();
    } else if (selectedFilter == 'Trainer Name') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty ||
              selectedItems.contains(item.traineeName.toLowerCase()))
          .toList();
    }
    homeViewModel.setFilteredItems(filtered);
  }
}
