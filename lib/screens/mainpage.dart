import 'package:bmi_calculator/SlideTransistion.dart';
import 'package:bmi_calculator/screens/resultpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_reusable.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/RoundButton.dart';
import 'package:bmi_calculator/calculatebmi.dart';
import 'infopage.dart';
import 'package:feature_discovery/feature_discovery.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum Gender {
  female,
  male,
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Gender? selectedGender;
  int height = 180;
  int age = 20;
  int weight = 60;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      FeatureDiscovery.discoverFeatures(context, <String>[
        'feature1',
      ]);
    });
    _speak();
    super.initState();
  }

  FlutterTts flutterTts = FlutterTts();
  Future _speak() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts
        .speak("Don't Know about BMI ? Click Here, get all details about it");
  }

  Future _stopback() async {
    await flutterTts.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        centerTitle: true,
        actions: [
          DescribedFeatureOverlay(
            featureId: 'feature1',
            targetColor: Colors.white,
            textColor: Colors.white,
            backgroundColor: Colors.amber,
            contentLocation: ContentLocation.below,
            title: Text(
              'Click Here',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
            pulseDuration: Duration(seconds: 1),
            enablePulsingAnimation: true,
            barrierDismissible: false,
            overflowMode: OverflowMode.wrapBackground,
            openDuration: Duration(seconds: 3),
            description: Text(
              "Don't Know about BMI ? Here, get all details about it",
              style: TextStyle(fontSize: 18.0),
            ),
            tapTarget: Icon(
              FontAwesomeIcons.infoCircle,
              color: Color(0xFFFFA500),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InfoPage()),
                );
              },
              icon: Icon(
                FontAwesomeIcons.infoCircle,
              ),
            ),
            onOpen: () async {
              print('The overlay is about to be displayed.');
              return true;
            },
            onComplete: () async {
              _stopback();
              print('Target tapped.');
              return true;
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    cardColour: selectedGender == Gender.male
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconReusable(
                      icon: FontAwesomeIcons.mars,
                      textContent: 'Male',
                      iconColor: Color(0xFF00FFFF),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    cardColour: selectedGender == Gender.female
                        ? activeCardColour
                        : inactiveCardColour,
                    cardChild: IconReusable(
                      icon: FontAwesomeIcons.venus,
                      textContent: 'Female',
                      iconColor: Color(0xFFFF007F),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              cardColour: activeCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: textStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: BoldText,
                      ),
                      Text(
                        'cm',
                        style: textStyle,
                      ),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 240.0,
                    activeColor: Color(0xFFD19D00),
                    inactiveColor: Color(0xFFFFE28A),
                    onChanged: (double newHeight) {
                      setState(() {
                        height = newHeight.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textStyle,
                        ),
                        Text(
                          age.toString(),
                          style: BoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardColour: activeCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: textStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: BoldText,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTapped: () {
              CalculateBMI cal = CalculateBMI(height: height, weight: weight);
              Navigator.push(
                context,
                ScaleRoute(
                  page: ResultPage(
                    bmiValue: cal.calBmi(),
                    titleResult: cal.getResult(),
                    resultBody: cal.getResultBody(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
