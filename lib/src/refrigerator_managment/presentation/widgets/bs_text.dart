import 'package:flutter/material.dart';

class BSText extends StatelessWidget {
  final String text;
  const BSText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
