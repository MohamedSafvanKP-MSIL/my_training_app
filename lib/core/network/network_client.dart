import 'package:http/http.dart' as http;

import '../logs/app_logs.dart';

class NetworkClient {
  final http.Client _client = http.Client();
  final String baseUrl;

  NetworkClient({required this.baseUrl});

  Future<http.Response> get({required String url}) async {
    String requestUrl = baseUrl + url;
    Uri requestUri = Uri.parse(requestUrl);

    AppLogs.printLog("=============== REQUEST START =======================");
    AppLogs.printLog("METHOD : GET");
    AppLogs.printLog("URL : $requestUrl");
    AppLogs.printLog("================ REQUEST END ======================");

    var response =
        await _client.get(requestUri);

    AppLogs.printLog("=============== RESPONSE START =======================");
    AppLogs.printLog("METHOD : GET");
    AppLogs.printLog("BODY : ${response.body}");
    AppLogs.printLog("================ RESPONSE END ======================");
    return response;
  }

}
