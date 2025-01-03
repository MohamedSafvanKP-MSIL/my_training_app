import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_training_app/core/logs/app_logs.dart';
import 'package:my_training_app/presentation/view_models/search_filter_view_model.dart';

import '../../core/utils/route_manager.dart';
import '../../data/models/init_response.dart';
import '../../domain/usecase/init_usecase.dart';

class HomeViewModel with ChangeNotifier {
  final GetTrainings getTrainings;
  late InitResponse _response;

  List<TrainingItem> _highlights = [];
  List<TrainingItem> _trainings = [];
  bool isFilterApplied = false;

  bool _isLoading = false;
  String _errorMessage = "";

  List<TrainingItem> get trainings => _trainings;

  List<TrainingItem> get highlights => _highlights;

  bool get isLoading => _isLoading;

  String get errorMessage => _errorMessage;

  HomeViewModel({required this.getTrainings});

  Future<void> fetchTrainings(
      SearchFilterViewModel searchFilterViewModel) async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await getTrainings(NoParams());
      _highlights = _response.highlights;
      _trainings = _response.trainings;
      searchFilterViewModel.setTrainings(_response.trainings);

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = "$e";
      _isLoading = false;
      notifyListeners();
    }
  }

  setFilteredItems(List<TrainingItem> filteredItem, bool isFilter) {
    AppLogs.printLog('filteredItem: ${filteredItem.length}');
    _trainings = filteredItem;
    isFilterApplied = isFilter;
    notifyListeners();
  }

  moveToGroupDetails(TrainingItem data, BuildContext context) {
    RouteManager.pushName(context, RouteManager.details, arguments: data);
  }
}
