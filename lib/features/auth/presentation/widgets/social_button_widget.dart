import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class SocialButtonWidget extends StatelessWidget {
  final String? text;
  final String? image;
  const SocialButtonWidget({super.key, this.text, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.buttonBlackColor),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image ?? "assets/images/png/Google-logo.png",
              scale: 3,
            ),
            const SizedBox(width: 12),
            Text(
              text ?? "text",
              style: const TextStyle(color: AppColors.textColor),
            ),
          ],
        ),
      ),
    );
  }
}
