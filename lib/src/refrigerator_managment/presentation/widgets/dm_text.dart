import 'package:flutter/material.dart';

class DMText extends StatelessWidget {
  final String text;
  const DMText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.displayMedium);
  }
}
