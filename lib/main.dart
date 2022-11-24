import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData( scaffoldBackgroundColor: Colors.black) ,
      home: Anime(),
    );
  }
}

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0XFFFFFFFF & Random().nextInt(0XFFFFFFFF));
}

class Anime extends StatefulWidget {
  const Anime({super.key});

  @override
  State<Anime> createState() => _AnimeState();
}

class _AnimeState extends State<Anime> {
  late Color color;
  late double margin;
  late double borderRadius;

  @override
  void initState() {
    color = randomColor();
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    super.initState();
  }

  void Change() {
    setState(() {
    color = randomColor();
    margin = randomMargin();
    borderRadius = randomBorderRadius();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
       padding: EdgeInsets.only(top: 190.0, ),
        child: Center(
          child: Column(children: [
            SizedBox(
              width: 180,
              height: 180,
              child: AnimatedContainer(
                curve: Curves.easeInOutBack,
                duration: Duration(milliseconds: 400),
                margin: EdgeInsets.all(margin),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(borderRadius)
                ),
              ),
            ),
            ElevatedButton(
              
              onPressed: () =>Change() , 
              child: Text('change',
              style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            color: Colors.white),

              ))
          ]),
        ),
      ),
    );
  }
}
