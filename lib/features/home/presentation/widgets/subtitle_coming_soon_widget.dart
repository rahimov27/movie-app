import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class SubtitleComingSoonWidget extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  const SubtitleComingSoonWidget({super.key, this.imageUrl, this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(imageUrl ?? "assets/images/svg/video.svg"),
        const SizedBox(width: 8),
        Text(
          text ?? "-",
          textAlign: TextAlign.left,
          overflow: TextOverflow.clip,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textColor,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
