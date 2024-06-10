import 'package:flutter/material.dart';
import 'package:gameps/data/models/game_model.dart';
import 'package:get/get.dart';

class GameListController extends GetxController {

  bool isLoading = false;
  bool isLoadingLoadMore = false;
  int onPage = 1;
  int pageSize = 5;
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

  void getData() {
    games.add(GameModel(
      id: 1,
      name: 'Game 1',
      released: '2021-11-16',
      backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
      metacritic: 73,
      rating: 4.12,
    ));
    games.add(GameModel(
      id: 2,
      name: 'Game 2',
      released: '2021-11-16',
      backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
      metacritic: 73,
      rating: 4.12,
    ));
    games.add(GameModel(
      id: 3,
      name: 'Game 3',
      released: '2021-11-16',
      backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
      metacritic: 73,
      rating: 4.12,
    ));
    games.add(GameModel(
      id: 4,
      name: 'Game 4',
      released: '2021-11-16',
      backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
      metacritic: 73,
      rating: 4.12,
    ));
    games.add(GameModel(
      id: 5,
      name: 'Game 5',
      released: '2021-11-16',
      backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
      metacritic: 73,
      rating: 4.12,
    ));
    update();
  }

  Future<void> loadMore() async {
    if (scrollController.position.extentAfter <= 0 && onPage < pageSize && !isLoadingLoadMore) {
      onPage++;
      isLoadingLoadMore = true;
      update();

      games.add(GameModel(
        id: 1,
        name: 'Game 1',
        released: '2021-11-16',
        backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
        metacritic: 73,
        rating: 4.12,
      ));
      games.add(GameModel(
        id: 2,
        name: 'Game 2',
        released: '2021-11-16',
        backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
        metacritic: 73,
        rating: 4.12,
      ));
      games.add(GameModel(
        id: 3,
        name: 'Game 3',
        released: '2021-11-16',
        backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
        metacritic: 73,
        rating: 4.12,
      ));
      games.add(GameModel(
        id: 4,
        name: 'Game 4',
        released: '2021-11-16',
        backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
        metacritic: 73,
        rating: 4.12,
      ));
      games.add(GameModel(
        id: 5,
        name: 'Game 5',
        released: '2021-11-16',
        backgroundImage: 'https://media.rawg.io/media/games/4f1/4f1b60a8c9bcee65a81bc3a9176d81af.jpg',
        metacritic: 73,
        rating: 4.12,
      ));

      await Future.delayed(const Duration(seconds: 5));

      isLoadingLoadMore = false;
      update();
    }
  }
}