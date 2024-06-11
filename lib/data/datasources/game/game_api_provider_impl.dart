import 'dart:convert';
import 'dart:developer';

import 'package:gameps/core/api_clients/api_client.dart';
import 'package:gameps/core/constants/api_constant.dart';
import 'package:gameps/data/models/game_detail_model.dart';
import 'package:gameps/data/models/game_model.dart';

import 'game_api_provider.dart';

class GameApiProviderImpl implements GameApiProvider {
  final ApiClient client;

  GameApiProviderImpl({required this.client});

  @override
  Future<List<GameModel>> getGameList({
    required int page,
    required int pageSize,
    required int platforms,
    required String dates,
    required String ordering,
  }) async {
    try {
      Map<String, dynamic>? query = {
        'page': '$page',
        'page_size': '$pageSize',
        'platforms': '$platforms',
        'dates': dates,
        'ordering': ordering,
      };

      var response = await client.get(
        path: ApiConstant.games,
        query: query,
      );
      final dataJson = jsonDecode(response.body);

      return dataJson['results'].map<GameModel>((obj) => GameModel.fromJson(obj)).toList();
    } catch (e) {
      log(e.toString());
      throw Exception('failed to get game list');
    }
  }

  @override
  Future<GameDetailModel> getGameDetail(String id) async {
    try {
      var response = await client.get(path: '${ApiConstant.games}/$id');
      final dataJson = jsonDecode(response.body) as Map<String, dynamic>;

      return GameDetailModel.fromJson(dataJson);
    } catch (e) {
      log(e.toString());
      throw Exception('failed to get game detail');
    }
  }
}
