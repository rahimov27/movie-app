import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class PosterWidget extends StatelessWidget {
  final String? imageUrl;

  const PosterWidget({super.key, this.imageUrl});

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
                imageUrl ?? "",
              ),
            ),
          ),
          const SizedBox(height: 16),
          Column(
            children: [
              const Text(
                "Avengers - Infinity War",
                style: TextStyle(
                    fontSize: 24,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "2h29m • Action, adventure, sci-fi",
                style: TextStyle(
                    fontSize: 16, color: AppColors.carouselCardSubTitle),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/images/svg/star.svg"),
                  const Text(
                    "4.8",
                    style: TextStyle(fontSize: 16, color: AppColors.textColor),
                  ),
                  const SizedBox(width: 2),
                  const Text(
                    "(1.222)",
                    style: TextStyle(
                        fontSize: 12, color: AppColors.carouselCardSubTitle),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
