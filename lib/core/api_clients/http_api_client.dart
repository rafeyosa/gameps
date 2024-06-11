import 'package:gameps/core/constants/app_constant.dart';
import 'package:http/http.dart' as http;

import 'api_client.dart';

class HttpApiClient implements ApiClient {
  final http.Client client;
  final String apiUrl = AppConstant.apiURL;
  final String apiKey = AppConstant.apiKey;

  HttpApiClient({required this.client});

  @override
  Future get({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    Map<String, dynamic>? queryParams = {
      'key': apiKey,
    };
    if (query != null) {
      queryParams.addAll(query);
    }
    Uri uri = Uri.https(apiUrl, path, queryParams);
    return await client.get(uri);
  }
}
