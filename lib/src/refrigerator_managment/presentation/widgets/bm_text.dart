import 'package:flutter/material.dart';
import 'package:foodapp/core/constants/color/app_colors.dart';

class BMText extends StatelessWidget {
  final String text;
  final Color color;
  const BMText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: color,
              overflow: TextOverflow.clip,
            ));
  }
}
