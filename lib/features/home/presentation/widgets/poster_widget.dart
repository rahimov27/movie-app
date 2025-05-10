import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class PosterWidget extends StatelessWidget {
  final String imageUrl;
  final String? title;
  final String? year;
  final String? type;

  const PosterWidget(
      {super.key, required this.imageUrl, this.title, this.type, this.year});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 540,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                  width: 310,
                  height: 440,
                  fit: BoxFit.cover,
                  imageUrl != "N/A"
                      ? imageUrl
                      : "https://via.placeholder.com/310x440"),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? "-",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 24,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Type:$type - year ($year)",
                  style: const TextStyle(
                      fontSize: 16, color: AppColors.carouselCardSubTitle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
