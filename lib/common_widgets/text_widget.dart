import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.context,
    required this.text
  });

  final BuildContext context;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,style:Theme.of(context).textTheme.titleLarge,);
  }
}