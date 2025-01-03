
import 'package:flutter/material.dart';

import '../../data/models/init_response.dart';
import '../../domain/usecase/init_usecase.dart';

class HomeViewModel with ChangeNotifier {
  final GetTrainings getTrainings;
  late InitResponse _response;

  List<TrainingItem> _highlights = [];
  List<TrainingItem> _trainings = [];


  bool _isLoading = false;
  String _errorMessage = "";

  List<TrainingItem> get trainings => _trainings;
  List<TrainingItem> get highlights => _highlights;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  HomeViewModel({required this.getTrainings});

  Future<void> fetchTrainings() async {
    _isLoading = true;
    notifyListeners();
    try {
      _response = await getTrainings(NoParams());
      _highlights = _response.highlights;
      _trainings = _response.trainings;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _errorMessage = "Failed to load trainings";
      _isLoading = false;
      notifyListeners();
    }
  }
}
