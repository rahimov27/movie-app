import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/shared/theme/app_colors.dart';

class SearchTextFieldWidget extends StatelessWidget {
  final VoidCallback? onTap;
  final TextEditingController? controller;
  const SearchTextFieldWidget({super.key, this.controller, this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      selectionControls: CupertinoTextSelectionControls(),
      onEditingComplete: onTap,
      controller: controller,
      cursorColor: AppColors.yellow,
      style: const TextStyle(color: AppColors.white),
      decoration: InputDecoration(
        
        prefixIconConstraints: const BoxConstraints(
          maxWidth: 44,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: SvgPicture.asset(
            "assets/images/svg/search.svg",
          ),
        ),
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
    );
  }
}
