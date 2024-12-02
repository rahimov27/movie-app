import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MLogoWidget extends StatelessWidget {
  const MLogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset("assets/images/svg/logo.svg"),
    );
  }
}
