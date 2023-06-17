import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spacetravel/about.dart';
import 'package:spacetravel/astronaut.dart';
import 'package:spacetravel/ufo1bottom.dart';
import 'package:spacetravel/ufo2top.dart';

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
  double ufoXtwo = ufoXone + 2.5;
  //امتیاز و ریکورد
  static int score = 0;
  int record = 0;
  //زمان و ارتفاع
  double time = 0;
  double height = 0;
  double intialheight = astroYaxis;
  bool gameHasStart = false;
  bool isPlaying = true;
//فانکشن ها
  AudioPlayer audioPlayer = AudioPlayer();

  Future<void> loadRecord() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // بارگیری ریکورد از حافظه و در صورتی که قبلا ذخیره شده باشد
      // در غیر این صورت مقدار پیش‌فرض 0 است
      record = prefs.getInt('record') ?? 0;
    });
  }

  Future<void> saveRecord(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // ذخیره ریکورد در حافظه
      prefs.setInt('record', value);
    });
  }

  Future<void> playAudio() async {
    await audioPlayer.play(AssetSource(Assets.music));
    setState(() {
      isPlaying = true;
    });
  }

  Future<void> stopAudio() async {
    await audioPlayer.stop();
    setState(() {
      isPlaying = false;
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // بارگیری ریکورد از حافظه
    loadRecord();
    playAudio();
  }

//پریدن

  void jump() {
    setState(() {
      time = 0;
      score += 1;
      intialheight = astroYaxis;
    });

    if (score >= record) {
      setState(() {
        record = score;
        saveRecord(record); // ذخیره ریکورد در حافظه
      });
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
            ufoXone += 3.2;
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
                      Positioned(
                        top: 5,
                        left: 5,
                        child: IconButton(
                            onPressed: isPlaying ? stopAudio : playAudio,
                            icon: Icon(
                              isPlaying
                                  ? Icons.music_note_outlined
                                  : Icons.music_off_outlined,
                              color: Colors.amber,
                            )),
                      ),
                      Container(
                        alignment: const Alignment(2, -0.3),
                        width: size.width / 2.5,
                        child: gameHasStart
                            ? const Text("")
                            : const Center(
                                child: Text(
                                  "TAP TO  PLAY",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 5),
                                ),
                              ),
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
