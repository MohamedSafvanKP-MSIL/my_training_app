import 'package:flutter/foundation.dart';

class AppLogs {
  static printLog(String msg) {
    if (kDebugMode) {
      print('TrainingAPP |--> $msg');
    }
  }
}
