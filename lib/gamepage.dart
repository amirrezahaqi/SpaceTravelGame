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
//متغییر ها

  static double astroYaxis = 0;
  static double ufoXone = 2.5;
  double ufoXtwo = ufoXone + 1.5;
  //امتیاز و ریکورد
  static int score = 0;
  static int record = 0;
  //زمان و ارتفاع
  double time = 0;
  double height = 0;
  double intialheight = astroYaxis;
  bool gameHasStart = false;

//فانکشن ها

//پریدن

  void jump() {
    setState(() {
      time = 0;
      score += 1;
      intialheight = astroYaxis;
    });

    if (score >= record) {
      record = score;
    }
  }

//باختن

  bool astroDied() {
    if (astroYaxis > 1 || astroYaxis < -1) {
      return true;
    }
    return false;
  }

//شروع بازی
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

          // ignore: unused_element

          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(32.0))),
                  backgroundColor: const Color.fromARGB(106, 0, 0, 0),
                  title: Center(child: Image.asset(Assets.gameover.path)),
                  actions: [
                    Center(
                      child: TextButton(
                          onPressed: resetGame,
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      side: const BorderSide(
                                          width: 2.3, color: Colors.amber))),
                              backgroundColor:
                                  const MaterialStatePropertyAll(Colors.red)),
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Text(
                              "Play Again",
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber),
                            ),
                          )),
                    )
                  ],
                );
              });
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

//ریست گیم
  void resetGame() {
    Navigator.pop(context);
    setState(() {
      astroYaxis = 0;
      gameHasStart = false;
      time = 0;
      intialheight = astroYaxis;
    });
  }

//صفحه بازی

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
                        child: Ufo2(size: 250),
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
              Expanded(
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
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
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                      InkWell(
                        splashColor: Colors.amber,
                        borderRadius: BorderRadius.circular(1000),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const About()));
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
                              BoxShadow(
                                  color: Colors.red,
                                  blurRadius: 10,
                                  spreadRadius: 5),
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
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ]),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
