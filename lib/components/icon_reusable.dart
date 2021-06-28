import 'package:flutter/material.dart';
import '../constants.dart';

class IconReusable extends StatelessWidget {
  IconReusable({required this.textContent, this.icon, this.iconColor});

  final IconData? icon;
  final String textContent;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          textContent,
          style: textStyle,
        ),
      ],
    );
  }
}
