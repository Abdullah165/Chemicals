import 'package:chem/animation/fade_animation.dart';
import 'package:chem/pages/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SplashScreen(
            seconds: 1,
            backgroundColor: Color(0xffabf0e9),
            image: Image.asset('images/chemicalsBottle.png'),
            photoSize: screenHeight/500 * 100,
            title: Text.rich(
              TextSpan(children: <TextSpan>[
                TextSpan(
                  text: 'C',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.yellow[900],
                  ),
                ),
                TextSpan(
                  text: 'h',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red[700],
                  ),
                ),
                TextSpan(
                  text: 'e',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: 'm',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.indigo,
                  ),
                ),
                TextSpan(
                  text: 'i',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink,
                  ),
                ),
                TextSpan(
                  text: 'C',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.yellow[900],
                  ),
                ),
                TextSpan(
                  text: 'a',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.red[700],
                  ),
                ),
                TextSpan(
                  text: 'l',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.green,
                  ),
                ),
                TextSpan(
                  text: 's',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.purple[800],
                  ),
                ),
              ]),
            ),
            loaderColor: Colors.purple,
            navigateAfterSeconds: Home(),
    );
  }
}
