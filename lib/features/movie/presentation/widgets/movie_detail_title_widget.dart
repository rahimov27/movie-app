import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class MovieDetailTitleWidget extends StatelessWidget {
  final String? text;
  const MovieDetailTitleWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? "Storyline",
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: AppColors.textColor,
      ),
    );
  }
}
