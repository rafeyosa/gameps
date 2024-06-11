import 'package:flutter/material.dart';
import 'package:gameps/data/models/game_detail_model.dart';
import 'package:gameps/data/repositories/game_repository.dart';
import 'package:get/get.dart';

class GameDetailController extends GetxController {
  GameDetailController({required this.gameRepository});

  final GameRepository gameRepository;
  final kExpandedHeight = 250.0;

  double get horizontalTitlePadding {
    const kBasePadding = 25.0;
    const kMultiplier = 0.5;

    if (scrollController.hasClients) {
      if (scrollController.offset < (kExpandedHeight / 2)) {
        double fullExpanded = kBasePadding;
        return fullExpanded;
      }
      if (scrollController.offset > (kExpandedHeight - kToolbarHeight)) {
        double noExpanded =
            (kExpandedHeight / 2 - kToolbarHeight) * kMultiplier + kBasePadding;
        return noExpanded;
      }
      double halfExpanded =
          (scrollController.offset - (kExpandedHeight / 2)) * kMultiplier +
              kBasePadding;
      return halfExpanded;
    }
    return kBasePadding;
  }

  double get titleLerp {
    if (scrollController.hasClients) {
      if (scrollController.offset < (kExpandedHeight / 2)) {
        return 0;
      }
      if (scrollController.offset > (kExpandedHeight - kToolbarHeight)) {
        return 1;
      }
      return 0.5;
    }
    return 0;
  }

  late ScrollController scrollController;
  GameDetailModel? game;
  bool isLoading = true;

  @override
  void onInit() {
    scrollController = ScrollController()
      ..addListener(() {
        update();
      });
    super.onInit();
  }

  @override
  void onReady() async {
    var id = Get.arguments as int?;
    if (id == null) {
      Get.back();
    }
    getData(id.toString());
    super.onReady();
  }

  Future<void> getData(String id) async {
    isLoading = true;
    update;

    game = await gameRepository.getGameDetail(id);

    isLoading = false;
    update();
  }
}
