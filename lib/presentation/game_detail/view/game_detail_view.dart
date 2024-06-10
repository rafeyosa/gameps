import 'package:flutter/material.dart';
import 'package:gameps/core/extensions/string_extension.dart';
import 'package:gameps/core/themes/app_colors.dart';
import 'package:gameps/presentation/game_list/view/widgets/rating_icon.dart';
import 'package:get/get.dart';

import '../controller/game_detail_controller.dart';

class GameDetailView extends GetView<GameDetailController> {
  const GameDetailView({super.key});

  static const routeName = '/games/detail';

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GameDetailController>(builder: (controller) {
      return Scaffold(
        body: NestedScrollView(
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
                  onPressed: () => Navigator.of(context).pop(),
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
                      children: [
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Developer',
                                style: TextStyle(
                                  color: AppColors.textGray,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                              Text(
                                '-',
                                style: TextStyle(
                                  color: AppColors.textBlack,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (controller.game?.metacritic != null) ...[
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Publisher',
                                  style: TextStyle(
                                    color: AppColors.textGray,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '-',
                                  style: TextStyle(
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
                          '${controller.game?.rating}',
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
                    Text(
                      'Vivamus vel tincidunt eros, vitae lobortis lorem. Sed tortor mi, accumsan id ex at, sodales varius felis. Vivamus laoreet nibh vitae augue sollicitudin venenatis. Maecenas malesuada pretium congue. Nulla ultricies imperdiet mauris rutrum tincidunt. Sed consectetur tellus sed urna dignissim, vel tincidunt risus pellentesque. Fusce ornare a ligula ac egestas. Donec vitae ultrices nibh. Morbi non lacinia sapien. In vitae lorem iaculis, lacinia nisl molestie, dictum sapien.',
                      maxLines: controller.isShowMore ? null : 7,
                      overflow:
                          controller.isShowMore ? null : TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: controller.onShowMore,
                      child: Text(
                        controller.isShowMore
                            ? 'Lihat lebih sedikit'
                            : 'Lihat lebih banyak',
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.secondary,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
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
                          return Container(
                            padding: const EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black45),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              (controller.game?.genres![index].name).orEmpty,
                              style: const TextStyle(
                                color: AppColors.textBlack,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                          );
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
        ),
      );
    });
  }
}
