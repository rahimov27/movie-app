import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hi Sagdii",
          style: TextStyle(color: AppColors.white, fontSize: 18),
        ),
        Text(
          "Welcome back",
          style: TextStyle(color: AppColors.white, fontSize: 26),
        ),
      ],
    );
  }
}
