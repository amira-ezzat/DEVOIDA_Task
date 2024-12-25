import 'package:flutter/material.dart';

import '../utils/colors.dart';

import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? iconPath;

  const CustomAppBar({super.key, required this.title, this.iconPath});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColor.kBlack,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Text(
            title,
            style: const TextStyle(
              color: AppColor.kBlack,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          if (iconPath != null) // Add this condition
            Image.asset(iconPath!),
        ],
      ),
    );
  }
}


class CustomApp extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backgroundColor;
  final IconData ? icon;

  const CustomApp({super.key, this.title, this.backgroundColor,this.icon});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: AppColor.kBlack,
              size: 28,
            ),
          Text(

            title ?? '',
            style: const TextStyle(
              color: AppColor.kBlack,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 48),
        ],
      ),
    );
  }
}

