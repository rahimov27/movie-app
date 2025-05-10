import 'package:flutter/material.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class ServiceWidget extends StatelessWidget {
  final String? text;
  final String? imageUrl;
  const ServiceWidget({super.key, this.text, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(imageUrl ??
                "https://www.charityworkerdiscounts.com/media/Cinema%20pages/cinema.jpg"),
          ),
          SizedBox(height: 20),
          Text(
            text ?? "Retal",
            style: TextStyle(
                color: AppColors.textColor,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
