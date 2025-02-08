import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign textAlign;

  const CommonTextWidget({
    super.key,
    required this.text,
    this.style,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: style ?? const TextStyle(fontSize: 16.0, color: Colors.black),
    ).tr();
  }
}
