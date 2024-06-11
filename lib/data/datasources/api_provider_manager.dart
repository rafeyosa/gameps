import 'package:gameps/core/api_clients/http_api_client.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'game/game_api_provider_impl.dart';

class ApiProviderManager {
  static void initialize() {
    var httpClient = HttpApiClient(client: http.Client());
    Get.lazyPut(
      () => GameApiProviderImpl(client: httpClient),
      fenix: true,
    );
  }
}
