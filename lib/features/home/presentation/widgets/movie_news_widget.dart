import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class MovieNewsWidget extends StatelessWidget {
  final String? imageUrl;
  final String? newsText;

  const MovieNewsWidget({
    super.key,
    this.imageUrl,
    this.newsText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              imageUrl ?? "-",
              height: 155,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 75,
            width: 290,
            child: Text(
              newsText ?? "-",
              overflow: TextOverflow.fade,
              style: const TextStyle(
                  color: AppColors.textColor,
                  fontSize: 16,
                  height: 1.25,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }
}
