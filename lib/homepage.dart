import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:fluppybird/barrier.dart';
import 'package:fluppybird/bird.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double birdYaxis = 0;
  double height = 0;
  double time = 0;
  double initialheight = birdYaxis;
  bool gameHasStrated = false;
  double barrierXxis1 = 2;
  double barrierXxis2 = 3;
  double barrierXxis3 = 4;
  double sizebarrier1 = 170;
  double sizebarrier2 = 150;
  double sizebarrier3 = 130;
  Random random= Random();
  int score = 0;

  void fly() {
    setState(() {
      time = 0;
      initialheight = birdYaxis;
    });
  }

  bool iscolaps(double size, double barierXaxis, double birdYaxis) {
    if (barierXaxis < 0.34 &&
        barierXaxis > -0.34 &&
        ((494.22 - (birdYaxis + 1) * 494.22 / 2) < size ||
            (birdYaxis + 1) * 494.22 / 2 < (300 - size))) {
      print(barierXaxis);
      print(birdYaxis);
      return true;
    } else {
      return false;
    }
  }

  void startgame() {
    gameHasStrated = true;
    setState(() {
      birdYaxis = 0;
      time = 0;
      initialheight = birdYaxis;
      score = 0;
      barrierXxis1 = 2;
      barrierXxis2 = 3;
      barrierXxis3 = 4;
    });
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.05;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialheight - height;
        if (barrierXxis1 < -2) {
          barrierXxis1 = 2;
          sizebarrier1=(random.nextInt(100)+100).toDouble();
          score += 1;
        } else {
          barrierXxis1 -= 0.05;
        }
        if (barrierXxis2 < -2) {
          barrierXxis2 = barrierXxis1 + 1;
          sizebarrier2=(random.nextInt(100)+100).toDouble();
          score += 1;
        } else {
          barrierXxis2 -= 0.05;
        }
        if (barrierXxis3 < -2) {
          barrierXxis3 = barrierXxis2 + 1;
          sizebarrier3=(random.nextInt(100)+100).toDouble();
          score += 1;
        } else {
          barrierXxis3 -= 0.05;
          
        }
      });

      if (birdYaxis > 0.95 ||
          iscolaps(sizebarrier1, barrierXxis1, birdYaxis) ||
          iscolaps(sizebarrier2, barrierXxis2, birdYaxis) ||
          iscolaps(sizebarrier3, barrierXxis3, birdYaxis)) {
        timer.cancel();
        gameHasStrated = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //fall();
    return GestureDetector(
      onTap: () {
        if (gameHasStrated) {
          fly();
        } else {
          startgame();
          print(MediaQuery.of(context).size.height);
        }
      },
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(0, birdYaxis),
                    color: Colors.blue,
                    child: Bird(),
                  ),
                  
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis1, -1),
                    child: Barrier(300 - sizebarrier1),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis1, 1.1),
                    child: Barrier(sizebarrier1),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis2, -1),
                    child: Barrier(300 - sizebarrier2),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis2, 1.1),
                    child: Barrier(sizebarrier2),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis3, -1),
                    child: Barrier(300 - sizebarrier3),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 0),
                    alignment: Alignment(barrierXxis3, 1.1),
                    child: Barrier(sizebarrier3),
                  ),
                  Container(
                    alignment: Alignment(0, -0.3),
                    child: (!gameHasStrated)
                        ? Text(
                            'T A P  TO  P L A Y',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )
                        : Text(""),
                  ),
                ],
              ),
            ),
            Container(
              height: 20,
              color: Colors.green,
            ),
            Expanded(
                child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60.0, 60.0, 0.0, 0.0),
                    child: Column(
                      children: [
                        Text(
                          'Score',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 1.3),
                        ),
                        SizedBox(height: 10),
                        Text(
                          score.toString(),
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 1.3),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0.0, 60.0, 60.0, 0.0),
                    child: Column(
                      children: [
                        Text(
                          'Best Score',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 1.3),
                        ),
                        SizedBox(height: 10),
                        Text(
                          '100',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              letterSpacing: 1.3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
