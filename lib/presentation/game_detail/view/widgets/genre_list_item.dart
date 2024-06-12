import 'package:flutter/material.dart';
import 'package:gameps/core/themes/app_colors.dart';

class GenreListItem extends StatelessWidget {
  const GenreListItem({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black45),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        name,
        style: const TextStyle(
          color: AppColors.textBlack,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
