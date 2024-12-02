import 'package:flutter/material.dart';

class SplashImageWidget extends StatelessWidget {
  const SplashImageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/png/Welcome.png",
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }
}
