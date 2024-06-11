import 'package:get/get.dart';

import '../controller/game_list_controller.dart';

class GameListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameListController>(
      () => GameListController(gameRepository: Get.find()),
    );
  }
}
