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
  ];
}