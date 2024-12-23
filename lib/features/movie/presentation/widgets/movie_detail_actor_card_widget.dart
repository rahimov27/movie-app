import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class MovieDetailActorCardWidget extends StatelessWidget {
  final String? directorName;
  final String? directorImage;
  const MovieDetailActorCardWidget(
      {super.key, this.directorImage, this.directorName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.searchColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.yellow.withOpacity(0.80),
                  backgroundImage: NetworkImage(directorImage ?? ""),
                ),
                const SizedBox(width: 12),
                Text(
                  directorName ?? "-",
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.movieDetailActorsColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16)
      ],
    );
  }
}
