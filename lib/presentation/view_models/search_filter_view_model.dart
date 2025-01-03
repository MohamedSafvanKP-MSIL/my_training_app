import 'package:flutter/material.dart';
import 'package:my_training_app/core/logs/app_logs.dart';

import '../../data/models/init_response.dart';
import 'home_view_model.dart';

class SearchFilterViewModel extends ChangeNotifier {
  String selectedFilter = 'Location';
  List<String> selectedItems = [];
  String searchTerm = '';

  List<TrainingItem> getFilteredTrainings(homeViewModel) {
    List<TrainingItem> filtered = homeViewModel.trainings;

    if (selectedFilter == 'Location') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty ||
              selectedItems.contains(item.location.toLowerCase()))
          .toList();
    } else if (selectedFilter == 'Training Name') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty ||
              selectedItems.contains(item.trainingName.toLowerCase()))
          .toList();
    } else if (selectedFilter == 'Trainer Name') {
      filtered = filtered
          .where((item) =>
              selectedItems.isEmpty ||
              selectedItems.contains(item.traineeName.toLowerCase()))
          .toList();
    }

    // Apply search
    if (searchTerm.isNotEmpty) {
      filtered = filtered
          .where((item) => item.trainingName
              .toLowerCase()
              .contains(searchTerm.toLowerCase()))
          .toList();
    }

    return filtered;
  }

  List<String> getAvailableOptions(HomeViewModel homeViewModel) {
    switch (selectedFilter) {
      case 'Location':
        return homeViewModel.trainings
            .map((item) => item.location)
            .toSet()
            .toList();
      case 'Training Name':
        return homeViewModel.trainings
            .map((item) => item.trainingName)
            .toSet()
            .toList();
      case 'Trainer Name':
        return homeViewModel.trainings
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

  void toggleSelectedItem(String item) {
    if (selectedItems.contains(item)) {
      selectedItems.remove(item);
    } else {
      selectedItems.add(item);
    }
    notifyListeners();
  }

  void updateSearchTerm(String term) {
    searchTerm = term;
    notifyListeners();
  }
}
