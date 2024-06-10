import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gameps/core/extensions/bool_extension.dart';
import 'package:gameps/core/extensions/string_extension.dart';
import 'package:gameps/core/themes/app_colors.dart';
import 'package:gameps/data/models/game_model.dart';

import 'rating_icon.dart';

class GameListItem extends StatelessWidget {
  const GameListItem({
    super.key,
    required this.onTap,
    required this.game,
  });

  final Function() onTap;
  final GameModel game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 8, 24, 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 144,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 1.0,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  game.backgroundImage.orEmpty,
                  fit: BoxFit.cover,
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
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      game.name.orEmpty,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textBlack,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      game.tba.orFalse ? 'TBA' : 'Released: ${game.released.orEmpty}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: AppColors.textGray,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (game.metacritic != null) ...[
                      Text(
                        'Metascore: ${game.metacritic}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.textGray,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          RatingIcon(
                            icon: Icons.star,
                            size: 24,
                            iconColor: Colors.yellow.shade800,
                            rating: game.rating ?? 0,
                            maxRating: 5,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              '${game.rating}',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
