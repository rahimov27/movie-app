import 'package:flutter/material.dart';
import 'package:movie_app/features/home/presentation/widgets/subtitle_coming_soon_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class PopularMovieCardWidget extends StatelessWidget {
  final String? movieTitle;
  final String? movieType;
  final String? movieDate;
  final String? movieImage;

  const PopularMovieCardWidget(
      {super.key,
      this.movieDate,
      this.movieTitle,
      this.movieType,
      this.movieImage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        width: 173,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                height: 244,
                fit: BoxFit.cover,
                width: 173,
                movieImage ??
                    "https://www.bik.kg/wp-content/uploads/2024/05/placeholder-2.png",
              ),
            ),
            const SizedBox(height: 16),
            Text(
              movieTitle ?? "-",
              textAlign: TextAlign.left,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                height: 1.2,
                fontSize: 16,
                color: AppColors.yellow,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            SubtitleComingSoonWidget(
              text: "${movieType?.substring(0, 22)}...",
              imageUrl: "assets/images/svg/video.svg",
            ),
            const SizedBox(height: 4),
            SubtitleComingSoonWidget(
              text: movieDate,
              imageUrl: "assets/images/svg/calendar.svg",
            ),
          ],
        ),
      ),
    );
  }
}
