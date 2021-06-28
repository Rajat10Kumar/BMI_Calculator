import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({@required this.icon, @required this.onPress});
  final IconData? icon;
  final Function()? onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      shape: CircleBorder(),
      fillColor: Color(0xFFD19D00),
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
    );
  }
}
