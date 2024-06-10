import 'package:gameps/presentation/game_detail/binding/game_detail_binding.dart';
import 'package:gameps/presentation/game_detail/view/game_detail_view.dart';
import 'package:gameps/presentation/game_list/binding/game_list_binding.dart';
import 'package:gameps/presentation/game_list/view/game_list_view.dart';
import 'package:get/get.dart';

class AppPages {
  AppPages._();

  static const firstPage = GameListView.routeName;
  static final routes = [
    GetPage(
      name: GameListView.routeName,
      page: () => const GameListView(),
      binding: GameListBinding(),
    ),
    GetPage(
      name: GameDetailView.routeName,
      page: () => const GameDetailView(),
      binding: GameDetailBinding(),
    ),
  ];
}