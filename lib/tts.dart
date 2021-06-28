import 'package:bmi_calculator/components/BottomButton.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TTSExampleWidget extends StatefulWidget {
  final List<String>? text;
  TTSExampleWidget({this.text});
  @override
  _TTSExampleWidgetState createState() => _TTSExampleWidgetState(text);
}

class _TTSExampleWidgetState extends State {
  _TTSExampleWidgetState(this.text);

  final List<String>? text;
  FlutterTts flutterTts = FlutterTts();
  Future _speak() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(0.8);
    await flutterTts.speak(text!.join(""));
  }

  Future _stopback() async {
    await flutterTts.stop();
    Navigator.of(context).pop(context);
    Navigator.of(context).pop(context);
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
        title: Text("Health Tips"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: Lottie.asset(
              'images/doctor2.json',
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Expanded(
                  child: ReusableCard(
                    cardColour: activeCardColour,
                    cardChild: Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: text!.length,
                        itemBuilder: (content, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.all(5.0),
                            leading: Icon(Icons.arrow_right_sharp),
                            title: Text(
                              text![index],
                              style: BodyResultStyle,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTapped: () {
              _stopback();
            },
            buttonTitle: 'RE-CALCULATE',
          ),
        ],
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
