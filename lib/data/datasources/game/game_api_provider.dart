import 'package:gameps/data/models/game_detail_model.dart';
import 'package:gameps/data/models/game_model.dart';

abstract class GameApiProvider {
  Future<List<GameModel>> getGameList({
    required int page,
    required int pageSize,
    required int platforms,
    required String dates,
    required String ordering,
  });

  Future<GameDetailModel> getGameDetail(String id);
}
