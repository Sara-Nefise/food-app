import 'package:flutter/material.dart';

class DSText extends StatelessWidget {
  final String text;
  const DSText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.displaySmall);
  }
}
