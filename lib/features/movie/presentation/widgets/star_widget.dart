import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StarWidget extends StatelessWidget {
  const StarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          "assets/images/svg/star-unfilled.svg",
          width: 32,
          height: 32,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 12,
        )
      ],
    );
  }
}
