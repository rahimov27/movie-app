import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/features/user/presentation/widgets/user_avatar_widget.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            UserAvatarWidget(),
            SizedBox(height: 40),
            UserLinkRowWidget(
              imageUrl: "assets/images/svg/ticket-2.svg",
              title: "My Ticket",
            ),
            UserLinkRowWidget(
              imageUrl: "assets/images/svg/shopping-cart.svg",
              title: "Payment history",
            ),
            UserLinkRowWidget(
              imageUrl: "assets/images/svg/translate.svg",
              title: "Change language",
            ),
            UserLinkRowWidget(
              imageUrl: "assets/images/svg/lock.svg",
              title: "Change password",
            ),
            UserLinkRowWidget(
              imageUrl: "assets/images/svg/Face-ID.svg",
              title: "Face ID / Touch ID",
              hasDivider: true,
              hasSwitch: true,
            ),
          ],
        ),
      ),
    );
  }
}

class UserLinkRowWidget extends StatefulWidget {
  final String? title;
  final String? imageUrl;
  final bool hasDivider;
  final bool hasSwitch;

  const UserLinkRowWidget(
      {super.key,
      this.title,
      this.imageUrl,
      this.hasDivider = false,
      this.hasSwitch = false});

  @override
  State<UserLinkRowWidget> createState() => _UserLinkRowWidgetState();
}

class _UserLinkRowWidgetState extends State<UserLinkRowWidget> {
  bool iosSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            SvgPicture.asset(
                widget.imageUrl ?? "assets/images/svg/ticket-2.svg"),
            const SizedBox(width: 16),
            Text(
              widget.title ?? "-",
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.userTextColor),
            ),
            const Spacer(),
            widget.hasSwitch == false
                ? SvgPicture.asset("assets/images/svg/arrow-right-user.svg")
                : const SizedBox(),
            widget.hasSwitch == true
                ? CupertinoSwitch(
                    thumbColor: AppColors.yellow,
                    trackColor: AppColors.switchColor,
                    activeColor: AppColors.userTextColor,
                    value: iosSwitch,
                    onChanged: (bool value) {
                      setState(() {
                        iosSwitch = value;
                        print(value);
                      });
                    },
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 24),
        widget.hasDivider == false
            ? const Divider(
                color: AppColors.dividerColor,
              )
            : const SizedBox(),
      ],
    );
  }
}
