import 'package:flutter_test/flutter_test.dart';
import 'package:gameps/core/api_clients/http_api_client.dart';
import 'package:gameps/core/constants/api_constant.dart';
import 'package:gameps/core/constants/app_constant.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'http_api_client_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  late MockClient mockClient;
  late HttpApiClient httpApiClient;

  setUp(() {
    mockClient = MockClient();
    httpApiClient = HttpApiClient(client: mockClient);
  });

  group('http api client test', () {
    test('test get', () async {
      var mockUrl = AppConstant.apiURL;
      var mockPath = ApiConstant.games;
      Map<String, dynamic>? queryParams = {
        'key': AppConstant.apiKey,
      };

      Uri uri = Uri.https(mockUrl, mockPath, queryParams);

      when(mockClient.get(uri)).thenAnswer((_) async {
        return http.Response('', 200);
      });

      var result = httpApiClient.get(path: mockPath, query: {});

      expect(result, isA<dynamic>());
      verify(mockClient.get(uri));
    });
  });
}
