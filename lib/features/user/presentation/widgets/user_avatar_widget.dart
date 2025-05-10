import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/user/presentation/widgets/user_avatar_row_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: const NetworkImage(
              "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2484"),
          backgroundColor: AppColors.yellow.withOpacity(0.90),
        ),
        const SizedBox(width: 24),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Andrew",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textColor,
              ),
            ),
            UserAvatarRowWidget(
              imageUrl: "assets/images/svg/call.svg",
              text: "996-123-45-67-89",
            ),
            SizedBox(height: 4),
            UserAvatarRowWidget(
              imageUrl: "assets/images/svg/sms.svg",
              text: "andrew@gmail.com",
            ),
          ],
        ),
        const Spacer(),
        SvgPicture.asset("assets/images/svg/edit-2.svg")
      ],
    );
  }
}
