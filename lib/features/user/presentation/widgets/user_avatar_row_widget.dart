import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class UserAvatarRowWidget extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  const UserAvatarRowWidget({super.key, this.imageUrl, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imageUrl ?? "-"),
        const SizedBox(width: 8),
        Text(
          text ?? "-",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.userTextColor,
          ),
        ),
      ],
    );
  }
}
