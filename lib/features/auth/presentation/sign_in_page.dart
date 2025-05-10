import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/features/auth/presentation/widgets/m_logo_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/social_button_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/splash_image_widget.dart';
import 'package:movie_app/features/auth/presentation/widgets/yellow_button_widget.dart';
import 'package:movie_app/shared/router/router.gr.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const SplashImageWidget(),
          Container(color: AppColors.splashBlackColor.withOpacity(0.60)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const MLogoWidget(),
                const SizedBox(height: 100),
                const WelcomeTextWidget(text: "Welcome Back"),
                const SizedBox(height: 24),
                const SocialButtonWidget(
                    text: "Continue with Facebook",
                    image: "assets/images/png/Facebook-logo.png"),
                const SizedBox(height: 12),
                const SocialButtonWidget(
                    text: "Continue with Google",
                    image: "assets/images/png/Google-logo.png"),
                const SizedBox(height: 12),
                const SocialButtonWidget(
                    text: "Continue with Apple",
                    image: "assets/images/png/Apple-logo.png"),
                const SizedBox(height: 12),
                const SizedBox(height: 24),
                const Divider(),
                const SizedBox(height: 24),
                YellowButtonWidget(
                  text: 'Log in with password',
                  onTap: () => context.router.replace(const HomeRoute()),
                ),
                const SizedBox(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account? ",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.yellow,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: 40)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class WelcomeTextWidget extends StatelessWidget {
  final String? text;
  const WelcomeTextWidget({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text ?? "Welcome Back",
        style: const TextStyle(
            color: AppColors.textColor,
            fontSize: 32,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
