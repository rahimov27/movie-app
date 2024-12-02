import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class YellowButtonWidget extends StatelessWidget {
  final String? text;
  const YellowButtonWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.yellow),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        child: Text(
          text ?? 'Log in with password',
          style: const TextStyle(
            color: AppColors.splashBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
