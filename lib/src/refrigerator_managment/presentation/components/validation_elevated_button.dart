import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';
import 'package:foodapp/core/constants/extantion/app_extantion.dart';
import 'package:foodapp/src/refrigerator_managment/presentation/widgets/bm_text.dart';

class ValidationButton extends StatelessWidget {
  const ValidationButton({
    Key? key,
    required this.text,
    this.callback,
  }) : super(key: key);
  final String text;
  final Future<void> Function()? callback;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: context.height * 0.07,
      child: ElevatedButton(
        onPressed: callback,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.blackPearl,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(13.0),
            )),
        child: BMText(
          color: AppColors.milkWhite,
          text: text,
        ),
      ),
    );
  }
}
