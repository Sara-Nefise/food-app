import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import '../../../../core/constants/color/app_colors.dart';

class CustomCupertinoSreach extends StatelessWidget {
  const CustomCupertinoSreach({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholderStyle: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: AppColors.blackPearl),
      decoration: context.cardDecoration,
      padding: context.searchPadding,
      suffix: const Icon(
        CupertinoIcons.search,
        color: AppColors.midGrey,
        size: 27,
      ),
      placeholder: 'Search',
      onChanged: (value) {},
    );
  }
}
