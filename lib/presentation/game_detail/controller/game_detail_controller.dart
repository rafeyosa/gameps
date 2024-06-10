import 'package:flutter/material.dart';
import 'package:gameps/data/models/game_model.dart';
import 'package:get/get.dart';

class GameDetailController extends GetxController {
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
  GameModel? game;
  bool isShowMore = false;

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
    game = Get.arguments as GameModel?;
    update();
    super.onReady();
  }

  void onShowMore() {
    isShowMore = !isShowMore;
    update();
  }
}
