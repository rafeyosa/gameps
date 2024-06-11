import '../datasources/game/game_api_provider.dart';
import '../models/game_detail_model.dart';
import '../models/game_model.dart';

class GameRepository {
  final GameApiProvider gameProvider;

  GameRepository({
    required this.gameProvider,
  });

  Future<List<GameModel>> getGameList({
    required int page,
    required int pageSize,
    required String startDate,
    required String endDate,
  }) async {
    try {
      var dates = '$startDate,$endDate';

      return await gameProvider.getGameList(
        page: page,
        pageSize: pageSize,
        platforms: 187,
        dates: dates,
        ordering: '-released',
      );
    } catch (e) {
      return [];
    }
  }

  Future<GameDetailModel?> getGameDetail(String id) async {
    try {
      return await gameProvider.getGameDetail(id);
    } catch (e) {
      return null;
    }
  }
}
