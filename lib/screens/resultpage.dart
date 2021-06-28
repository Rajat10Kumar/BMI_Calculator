import 'package:bmi_calculator/SlideTransistion.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/tts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ResultPage extends StatefulWidget {
  ResultPage(
      {required this.bmiValue,
      required this.resultBody,
      required this.titleResult});

  final String titleResult;
  final String bmiValue;
  final List<String> resultBody;

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  FlutterTts flutterTts = FlutterTts();
  Future _speak() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.speak(widget.titleResult);
  }

  @override
  void initState() {
    super.initState();
    _speak();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                'Your Result',
                style: TitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Lottie.asset(
              'images/doctor.json',
            ),
          ),
          Expanded(
            flex: 3,
            child: ReusableCard(
              cardColour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    widget.titleResult.toUpperCase(),
                    style: widget.titleResult == 'Normal'
                        ? normalWeightSubtitleTextStyle
                        : (widget.titleResult == 'Overweight'
                            ? overWeightSubtitleTextStyle
                            : underWeightSubtitleTextStyle),
                  ),
                  IconAlert(
                    colorIcon: widget.titleResult == 'Normal'
                        ? Color(0xFF32CD32)
                        : (widget.titleResult == 'Overweight'
                            ? Color(0xFFFF2E2E)
                            : Color(0xFFFFA500)),
                    icon: widget.titleResult == 'Normal'
                        ? FontAwesomeIcons.check
                        : (widget.titleResult == 'Overweight'
                            ? FontAwesomeIcons.bell
                            : FontAwesomeIcons.info),
                  ),
                  Text(
                    widget.bmiValue,
                    style: BMIIndexStyle,
                  ),
                  Text(
                    'BMI Index',
                    style: BodyResultStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'GET HEALTH TIPS',
            onTapped: () {
              Navigator.push(
                context,
                ScaleRoute(
                  page: TTSExampleWidget(text: widget.resultBody),
                ),
              );
            },
          ),
          // BottomButton(
          //   buttonTitle: 'RE-CALCULATE',
          //   onTapped: () {
          //     Navigator.pop(context);
          //   },
          // ),
        ],
      ),
    );
  }
}

class IconAlert extends StatelessWidget {
  IconAlert({this.icon, this.colorIcon});
  final IconData? icon;
  final Color? colorIcon;
  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: colorIcon,
    );
  }
}
