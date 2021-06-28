import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTapped, required this.buttonTitle});
  final String buttonTitle;
  final Function()? onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        color: bottomButtonColor,
        height: bottomButtonHeight,
        margin: EdgeInsets.only(top: 10.0),
        child: Center(
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: ButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
