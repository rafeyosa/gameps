import 'package:gameps/data/datasources/game/game_api_provider_impl.dart';
import 'package:get/get.dart';

import 'game_repository.dart';

class RepositoryManager {
  static void initialize() {
    Get.lazyPut(
      () => GameRepository(gameProvider: Get.find<GameApiProviderImpl>()),
      fenix: true,
    );
  }
}
