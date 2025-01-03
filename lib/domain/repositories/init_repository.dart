

import '../../data/models/init_response.dart';

abstract class InitRepository {
  Future<InitResponse> initRequest();
}