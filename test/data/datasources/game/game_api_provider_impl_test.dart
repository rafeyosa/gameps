import 'package:flutter_test/flutter_test.dart';
import 'package:gameps/core/api_clients/http_api_client.dart';
import 'package:gameps/core/constants/api_constant.dart';
import 'package:gameps/data/datasources/game/game_api_provider_impl.dart';
import 'package:gameps/data/models/game_detail_model.dart';
import 'package:gameps/data/models/game_model.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

import 'game_api_provider_impl_test.mocks.dart';

class HttpApiClientTest extends Mock implements HttpApiClient {}

@GenerateMocks([HttpApiClientTest])
void main() {
  late MockHttpApiClientTest mockClient;
  late GameApiProviderImpl gameApiProvider;

  setUpAll(() {
    mockClient = MockHttpApiClientTest();
    gameApiProvider = GameApiProviderImpl(client: mockClient);
  });

  group('game api provider impl test', () {
    test('test getGameList', () async {
      var path = ApiConstant.games;
      var mockPage = 1;
      var mockPageSize = 2;
      var mockPlatforms = 3;
      var mockDates = 'date';
      var mockOrdering = 'order';
      Map<String, dynamic>? query = {
        'page': '$mockPage',
        'page_size': '$mockPageSize',
        'platforms': '$mockPlatforms',
        'dates': mockDates,
        'ordering': mockOrdering,
      };
      var mockJsonString = """
{
    "results": [
        {
            "name": "Mock Name"
        }
    ]
}
  """;
      var mockList = [
        const GameModel(
          name: 'Mock Name',
        ),
      ];

      when(mockClient.get(path: path, query: query)).thenAnswer((_) async {
        return http.Response(mockJsonString, 200);
      });

      final result = await gameApiProvider.getGameList(
        page: mockPage,
        pageSize: mockPageSize,
        platforms: mockPlatforms,
        dates: mockDates,
        ordering: mockOrdering,
      );

      expect(result, equals(mockList));
      verify(mockClient.get(path: path, query: query));
    });

    test('test getGameList throw exception', () async {
      var path = ApiConstant.games;
      var mockPage = 1;
      var mockPageSize = 2;
      var mockPlatforms = 3;
      var mockDates = 'date';
      var mockOrdering = 'order';
      Map<String, dynamic>? query = {
        'page': '$mockPage',
        'page_size': '$mockPageSize',
        'platforms': '$mockPlatforms',
        'dates': mockDates,
        'ordering': mockOrdering,
      };
      when(mockClient.get(path: path, query: query)).thenAnswer((_) async {
        return http.Response('', 404);
      });

      final result = gameApiProvider.getGameList(
        page: mockPage,
        pageSize: mockPageSize,
        platforms: mockPlatforms,
        dates: mockDates,
        ordering: mockOrdering,
      );

      expect(result, throwsException);
      verify(mockClient.get(path: path, query: query));
    });

    test('test getGameDetail', () async {
      var mockId = '1';
      var path = '${ApiConstant.games}/$mockId';
      var mockJsonString = """
{
    "id": 1,
    "name": "Mock Name"
}
  """;
      var mockList = const GameDetailModel(
        id: 1,
        name: 'Mock Name',
      );

      when(mockClient.get(path: path)).thenAnswer((_) async {
        return http.Response(mockJsonString, 200);
      });

      final result = await gameApiProvider.getGameDetail(mockId);

      expect(result, equals(mockList));
      verify(mockClient.get(path: path));
    });

    test('test getGameDetail throw exception', () async {
      var mockId = '1';
      var path = '${ApiConstant.games}/$mockId';

      when(mockClient.get(path: path)).thenAnswer((_) async {
        return http.Response('', 404);
      });

      final result = gameApiProvider.getGameDetail(mockId);

      expect(result, throwsException);
      verify(mockClient.get(path: path));
    });
  });
}
