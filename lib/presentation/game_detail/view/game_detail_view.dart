import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:gameps/core/extensions/string_extension.dart';
import 'package:gameps/core/themes/app_colors.dart';
import 'package:gameps/data/models/developer_model.dart';
import 'package:gameps/presentation/game_list/view/widgets/rating_icon.dart';
import 'package:get/get.dart';

import '../controller/game_detail_controller.dart';
import 'widgets/genre_list_item.dart';

class GameDetailView extends GetView<GameDetailController> {
  const GameDetailView({super.key});

  static const routeName = '/games/detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<GameDetailController>(builder: (controller) {
        if (controller.isLoading) {
          return const Center(
            child: CircularProgressIndicator(
              color: AppColors.primary,
            ),
          );
        }
        return NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (context, isScrolled) {
            return [
              SliverAppBar(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(20),
                  ),
                ),
                leading: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Color.lerp(
                      Colors.white,
                      Colors.black,
                      controller.titleLerp,
                    ),
                  ),
                  onPressed: () => Get.back(),
                ),
                backgroundColor: AppColors.surface,
                shadowColor: Colors.black87,
                elevation: 20.0,
                pinned: true,
                expandedHeight: controller.kExpandedHeight,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.network(
                    (controller.game?.backgroundImage).orEmpty,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.insert_photo,
                          color: Colors.white24,
                          size: 100,
                        ),
                      );
                    },
                  ),
                  title: Text(
                    (controller.game?.name).orEmpty,
                    overflow:
                        controller.titleLerp > 0 ? TextOverflow.ellipsis : null,
                    style: TextStyle(
                      color: Color.lerp(
                        Colors.white,
                        Colors.black,
                        controller.titleLerp,
                      ),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  titlePadding: EdgeInsetsDirectional.only(
                    start: controller.horizontalTitlePadding,
                    bottom: 16,
                    end: 15,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Release date',
                                style: TextStyle(
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                (controller.game?.released).orEmpty,
                                style: const TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (controller.game?.metacritic != null) ...[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Metascore',
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${controller.game?.metacritic}',
                                  style: const TextStyle(
                                    color: AppColors.textBlack,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Developer',
                                style: TextStyle(
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                controller.game?.developers != null
                                    ? getConcatenatedNames(
                                        controller.game!.developers!)
                                    : '-',
                                style: const TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Publisher',
                                style: TextStyle(
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                controller.game?.publishers != null
                                    ? getConcatenatedNames(
                                        controller.game!.publishers!)
                                    : '-',
                                style: const TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        RatingIcon(
                          icon: Icons.star,
                          size: 24,
                          iconColor: Colors.yellow.shade800,
                          rating: (controller.game?.rating) ?? 0,
                          maxRating: 5,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${controller.game?.rating ?? ''}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Description',
                      style: TextStyle(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    HtmlWidget(
                      controller.game?.description ?? '-',
                      textStyle: const TextStyle(
                        fontSize: 16,
                        letterSpacing: 1.5,
                        wordSpacing: 1,
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 32,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.game?.genres?.length ?? 0,
                        itemBuilder: (context, index) {
                          return GenreListItem(
                              name: (controller.game?.genres![index].name)
                                  .orEmpty);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: 4),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  String getConcatenatedNames(List<DeveloperModel> list) {
    List<String> names = [];
    for (var element in list) {
      if (!element.name.isNullOrEmpty) {
        names.add(element.name!);
      }
    }
    var newName = names.join(', ');
    if (newName.isEmpty) {
      return '-';
    }
    return newName;
  }
}
