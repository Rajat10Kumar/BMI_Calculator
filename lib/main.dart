import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'screens/mainpage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:feature_discovery/feature_discovery.dart';

void main() {
  runApp(
    FeatureDiscovery(
      recordStepsInSharedPreferences: false,
      child: MaterialApp(
        home: BMICalculator(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFFFFAE42),
          primaryColor: Color(0xFFE58300),
        ),
      ),
    ),
  );
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  FlutterTts flutterTts = FlutterTts();
  Future _speak() async {
    await flutterTts.setLanguage("en-IN");
    await flutterTts.setVolume(1);
    await flutterTts.setPitch(1);
    await flutterTts.setSpeechRate(1);
    await flutterTts.speak("Hello,I am Serenity,Your consultant");
  }

  @override
  void initState() {
    super.initState();
    _speak();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splashIconSize: 300,
        duration: 4500,
        backgroundColor: Color(0xFFFFA500),
        splash: Lottie.asset('images/serenity.json'),
        nextScreen: MainPage(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
