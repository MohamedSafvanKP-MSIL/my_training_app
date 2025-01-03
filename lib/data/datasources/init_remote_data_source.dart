
import 'dart:convert';

import '../../core/network/network_client.dart';
import '../../core/utils/api_constants.dart';
import '../models/init_response.dart';

class InitDataSource {
   Future<InitResponse> initRequest() async {
    var networkClient = NetworkClient(baseUrl: ApiConstants.baseUrlInit);

    try {
      final response = await networkClient.get(url: ApiConstants.initURL);

      if (response.statusCode == 200) {
        final InitResponse initResponse =
        InitResponse.fromJson(jsonDecode(response.body));
        return initResponse;
      } else {
        throw Exception('Failed to load languages');
      }
    } catch (e) {
      throw Exception('Failed to load languages: $e');
    }
  }
}
