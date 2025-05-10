import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class SeeAllButtonWidget extends StatelessWidget {
  final String? leftText;
  final String? buttonText;
  const SeeAllButtonWidget({super.key, this.buttonText, this.leftText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftText ?? "-",
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        GestureDetector(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                buttonText ?? "-",
                style: const TextStyle(
                    color: AppColors.yellow,
                    fontSize: 14,
                    fontWeight: FontWeight.normal),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 2.5, left: 4),
                child: SvgPicture.asset("assets/images/svg/arrow-right.svg"),
              )
            ],
          ),
        ),
      ],
    );
  }
}
