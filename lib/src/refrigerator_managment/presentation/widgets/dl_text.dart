import 'package:flutter/material.dart';

class DLText extends StatelessWidget {
  final String text;
  const DLText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.displayLarge);
  }
}
