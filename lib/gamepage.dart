import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hellofirebase/about.dart';
import 'package:hellofirebase/astronaut.dart';
import 'package:hellofirebase/ufo1bottom.dart';
import 'package:hellofirebase/ufo2top.dart';

import 'gen/assets.gen.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  static double astroYaxis = 0;
  static int score = 0;
  static int record = 0;
  double time = 0;
  double height = 0;
  double intialheight = astroYaxis;
  bool gameHasStart = false;
  static double ufoXone = 2;
  double ufoXtwo = ufoXone + 1.5;
  void jump() {
    setState(() {
      time = 0;
      score += 1;
      intialheight = astroYaxis;
    });

    if (score >= record) {
      score = record;
    }
  }

  bool astroDied() {
    if (astroYaxis > 1 || astroYaxis < -1) {
      return true;
    }
    return false;
  }

  void startGame() {
    gameHasStart = true;
    score = 0;
    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;

      setState(() {
        astroYaxis = intialheight - height;
        setState(() {
          if (ufoXone < -1.1) {
            ufoXone += 2.2;
          } else {
            ufoXone -= 0.05;
          }
        });

        if (astroDied()) {
          timer.cancel();
        }

        setState(() {
          if (ufoXtwo < -1.1) {
            ufoXtwo += 2.2;
          } else {
            ufoXtwo -= 0.05;
          }
        });
      });
      if (astroYaxis > 1) {
        timer.cancel();
        gameHasStart = false;
      }
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      astroYaxis = 0;
      gameHasStart = false;
      time = 0;
      intialheight = astroYaxis;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          if (gameHasStart) {
            jump();
          } else {
            startGame();
          }
        },
        child: Scaffold(
          body: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bg.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                        duration: const Duration(microseconds: 0),
                        alignment: Alignment(0, astroYaxis),
                        child: const Astronaut(),
                      ),
                      Container(
                        alignment: const Alignment(3.5, -0.55),
                        width: size.width / 2.5,
                        child: gameHasStart
                            ? const Text("")
                            : TextButton(
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            side: const BorderSide(
                                                width: 2.3,
                                                color: Colors.amber))),
                                    backgroundColor:
                                        const MaterialStatePropertyAll(
                                            Colors.red)),
                                onPressed: () {},
                                child: const Padding(
                                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Text(
                                    "Play Now",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.amber),
                                  ),
                                )),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ufoXtwo, 1.2),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Ufo(size: 300),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ufoXone, 1.2),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Ufo(size: 200),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ufoXone, -1.2),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Ufo2(size: 200),
                      ),
                      AnimatedContainer(
                        alignment: Alignment(ufoXtwo, -1.2),
                        duration: const Duration(
                          milliseconds: 0,
                        ),
                        child: Ufo2(size: 200),
                      )
                    ],
                  )),
              BottomNav(
                score: score,
                record: record,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  BottomNav({super.key, required this.record, required this.score});

  int score;
  int record;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(color: Colors.black12),
        ),
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
              color: Color.fromARGB(255, 61, 64, 190),
              blurRadius: 1,
              spreadRadius: 0),
          BoxShadow(
              color: Color.fromARGB(255, 205, 245, 245),
              blurRadius: 10,
              spreadRadius: 5),
        ],
        image: DecorationImage(
          image: AssetImage("assets/earth1.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.scores.path,
              height: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Score",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              score.toString(),
              style: const TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
        InkWell(
          splashColor: Colors.amber,
          borderRadius: BorderRadius.circular(1000),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const About()));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(1000),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromARGB(255, 61, 64, 190),
                    blurRadius: 1,
                    spreadRadius: 0),
                BoxShadow(color: Colors.red, blurRadius: 10, spreadRadius: 5),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(50),
                ),
                height: 80,
                width: 80,
                child: Image.asset(
                  Assets.aboutmee.path,
                  height: 100,
                ),
              ),
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.records.path,
              height: 70,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Record",
              style: TextStyle(
                  color: Colors.amber,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              record.toString(),
              style: const TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ]),
    ));
  }
}
