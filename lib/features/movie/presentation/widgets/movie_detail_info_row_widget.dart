import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class MovieDetailInfoRowWidget extends StatelessWidget {
  final String? firstText;
  final String? secondText;

  const MovieDetailInfoRowWidget({super.key, this.firstText, this.secondText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            firstText ?? "-",
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.greyDetail,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 15),
        Text(
          secondText ?? "-",
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
