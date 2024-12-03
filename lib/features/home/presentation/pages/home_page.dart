import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          SvgPicture.asset("assets/images/svg/notification.svg"),
        ],
        centerTitle: false,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi Sagdii",
              style: TextStyle(color: AppColors.white, fontSize: 18),
            ),
            Text(
              "Welcome back",
              style: TextStyle(color: AppColors.white, fontSize: 26),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            cursorColor: AppColors.yellow,
            style: const TextStyle(color: AppColors.white),
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.searchColor,
              hintText: "Search",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: AppColors.yellow),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          const Center(
            child: Text(
              "Home page",
              style: TextStyle(color: AppColors.white, fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
