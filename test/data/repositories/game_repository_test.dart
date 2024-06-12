import 'package:flutter_test/flutter_test.dart';
import 'package:gameps/data/datasources/game/game_api_provider.dart';
import 'package:gameps/data/models/game_detail_model.dart';
import 'package:gameps/data/models/game_model.dart';
import 'package:gameps/data/repositories/game_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'game_repository_test.mocks.dart';

class GameApiProviderTest extends Mock implements GameApiProvider {}

@GenerateMocks([GameApiProviderTest])
@GenerateNiceMocks([MockSpec<GameModel>(), MockSpec<GameDetailModel>()])
void main() {
  late MockGameApiProviderTest mockProvider;
  late GameRepository repo;

  setUpAll(() {
    mockProvider = MockGameApiProviderTest();
    repo = GameRepository(gameProvider: mockProvider);
  });

  group('game repository test', () {
    test('test getGameList', () async {
      var mockList = [MockGameModel()];
      var mockPage = 1;
      var mockPageSize = 2;
      var mockStartDate = 'date1';
      var mockEndDate = 'date2';

      when(repo.getGameList(
        page: mockPage,
        pageSize: mockPageSize,
        startDate: mockStartDate,
        endDate: mockEndDate,
      )).thenAnswer((_) async {
        return mockList;
      });

      final result = await repo.getGameList(
        page: mockPage,
        pageSize: mockPageSize,
        startDate: mockStartDate,
        endDate: mockEndDate,
      );

      expect(result, isA<List<GameModel>>());
      expect(result, mockList);
    });

    test('test getGameDetail', () async {
      var mockDetail = MockGameDetailModel();
      var mockId = '1';

      when(repo.getGameDetail(mockId)).thenAnswer((_) async {
        return mockDetail;
      });

      final result = await repo.getGameDetail(mockId);

      expect(result, isA<GameDetailModel>());
      expect(result, mockDetail);
    });
  });
}
