import 'package:flutter/material.dart';
import 'package:gameps/core/themes/app_colors.dart';
import 'package:gameps/presentation/game_detail/view/game_detail_view.dart';
import 'package:gameps/presentation/game_list/controller/game_list_controller.dart';
import 'package:get/get.dart';

import 'widgets/game_list_item.dart';

class GameListView extends GetView<GameListController> {
  const GameListView({super.key});

  static const routeName = '/games';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: AppColors.surface,
        shadowColor: Colors.black87,
        elevation: 5.0,
        title: const Text(
          'PS5 Games',
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
      ),
      body: GetBuilder<GameListController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 40),
            child: Column(
              children: [
                ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: controller.games.length,
                  itemBuilder: (context, index) {
                    return GameListItem(
                      onTap: () {
                        Get.toNamed(
                          GameDetailView.routeName,
                          arguments: controller.games.elementAt(index).id,
                        );
                      },
                      game: controller.games.elementAt(index),
                    );
                  },
                ),
                Visibility(
                  visible: controller.isLoadingLoadMore,
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
