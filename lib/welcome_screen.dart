import 'package:first_app/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'component/slider.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: new BoxDecoration(
          color: Color.fromRGBO(6, 13, 217, 1),
          image: new DecorationImage(
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Color.fromRGBO(6, 13, 217, 0.5), BlendMode.dstATop),
            image: new AssetImage(
              'lib/asset/background.png',
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 80,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.headset_off,
                    color: Colors.white,
                    size: 30,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Audiozic",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 23,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Search for Wireless",
              style: TextStyle(color: Colors.grey[400], fontSize: 21),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Headphones",
              style: TextStyle(color: Colors.grey[400], fontSize: 21),
            ),
            SizedBox(height: 350),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MySlideAction(
                onSubmit: () {
                  Navigator.pushAndRemoveUntil<dynamic>(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => HomeScreen(),
                    ),
                    (route) =>
                        false, //if you want to disable back feature set to false
                  );
                },
                height: 50,
                reversed: true,
                elevation: 0,
                outerColor: Color.fromRGBO(255, 255, 255, 0),
                sliderButtonIconSize: 12,
                text: "Swipe to access",
                sliderButtonIcon: Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
