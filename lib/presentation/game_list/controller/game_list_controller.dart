import 'package:flutter/material.dart';
import 'package:gameps/data/models/game_model.dart';
import 'package:gameps/data/repositories/game_repository.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class GameListController extends GetxController {
  GameListController({required this.gameRepository});

  final GameRepository gameRepository;
  bool isLoading = true;
  bool isLoadingLoadMore = false;
  int onPage = 1;
  int itemPerLoad = 20;
  List<GameModel> games = [];
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController()..addListener(loadMore);

    super.onInit();
  }

  @override
  void onReady() {
    getData();

    super.onReady();
  }

  Future<void> getData() async {
    isLoading = true;
    update();

    DateTime currentDateTime = DateTime.now();
    String endDate = DateFormat('yyyy-MM-dd').format(currentDateTime);

    DateTime lastOneYearDate = DateTime(
        currentDateTime.year - 1, currentDateTime.month, currentDateTime.day);
    String startDate = DateFormat('yyyy-MM-dd').format(lastOneYearDate);

    var res = await gameRepository.getGameList(
      page: onPage,
      pageSize: itemPerLoad,
      startDate: startDate,
      endDate: endDate,
    );
    games.addAll(res);

    isLoading = false;
    update();
  }

  Future<void> loadMore() async {
    if (scrollController.position.extentAfter <= 0 && !isLoadingLoadMore) {
      onPage++;
      isLoadingLoadMore = true;
      update();

      await getData();

      isLoadingLoadMore = false;
      update();
    }
  }
}
