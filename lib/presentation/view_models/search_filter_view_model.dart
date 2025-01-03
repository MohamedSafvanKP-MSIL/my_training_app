import 'package:flutter/material.dart';
import 'package:my_training_app/core/logs/app_logs.dart';

import '../../data/models/init_response.dart';
import 'home_view_model.dart';

class SearchFilterViewModel extends ChangeNotifier {
  String selectedFilter = 'Location';
  List<TrainingItem> _notFilteredTrainings = [];
  List<TrainingItem> _searchFilteredTrainings = [];

  List<String> selectedPlaceItems = [];
  List<String> selectedTrainingNameItems = [];
  List<String> selectedTrainerNameItems = [];

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
    AppLogs.printLog('toggleSelectedItem: $selectedFilter');
    switch (selectedFilter) {
      case 'Location':
        if (selectedPlaceItems.contains(item)) {
          selectedPlaceItems.remove(item);
        } else {
          selectedPlaceItems.add(item);
        }
        break;
      case 'Training Name':
        if (selectedTrainingNameItems.contains(item)) {
          selectedTrainingNameItems.remove(item);
        } else {
          selectedTrainingNameItems.add(item);
        }
        break;
      case 'Trainer Name':
        if (selectedTrainerNameItems.contains(item)) {
          selectedTrainerNameItems.remove(item);
        } else {
          selectedTrainerNameItems.add(item);
        }
        AppLogs.printLog('selectedTrainerNameItems: $selectedTrainerNameItems');
        break;
    }
    _filterAndUpdate(homeViewModel);

    notifyListeners();
  }

  void updateSearchTerm(String term) {
    searchTerm = term;
    notifyListeners();
  }

  List<String> getSelectedFilter() {
    switch (selectedFilter) {
      case 'Location':
        return selectedPlaceItems;
      case 'Training Name':
        return selectedTrainingNameItems;
      case 'Trainer Name':
        return selectedTrainerNameItems;
      default:
        return [];
    }
  }

  void _filterAndUpdate(HomeViewModel homeViewModel) {
    List<TrainingItem> filtered = _notFilteredTrainings;
    if (selectedPlaceItems.isNotEmpty) {
      filtered = filtered
          .where((item) =>
              selectedPlaceItems.isEmpty ||
              selectedPlaceItems.contains(item.location))
          .toList();
    }
    if (selectedTrainingNameItems.isNotEmpty) {
      filtered = filtered
          .where((item) =>
              selectedTrainingNameItems.isEmpty ||
              selectedTrainingNameItems.contains(item.trainingName))
          .toList();
    }
    if (selectedTrainerNameItems.isNotEmpty) {
      filtered = filtered
          .where((item) =>
              selectedTrainerNameItems.isEmpty ||
              selectedTrainerNameItems.contains(item.traineeName))
          .toList();
    }
    homeViewModel.setFilteredItems(
        filtered,
        (selectedTrainerNameItems.isNotEmpty ||
            selectedTrainingNameItems.isNotEmpty ||
            selectedPlaceItems.isNotEmpty));
  }
}
