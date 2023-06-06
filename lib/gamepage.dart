import 'package:flutter/material.dart';
import 'package:hellofirebase/about.dart';
import 'package:hellofirebase/astronaut.dart';
import 'package:hellofirebase/ufo.dart';

import 'gen/assets.gen.dart';

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  double astroYaxis = 0;

  void jump() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: jump,
                    child: AnimatedContainer(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/bg.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      duration: const Duration(microseconds: 0),
                      alignment: const Alignment(0, 0),
                      child: const Astronaut(),
                    ),
                  ),
                  Container(
                    alignment: const Alignment(3.5, -0.55),
                    width: size.width / 2.5,
                    child: TextButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: const BorderSide(
                                        width: 2.3, color: Colors.amber))),
                            backgroundColor:
                                const MaterialStatePropertyAll(Colors.red)),
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
                    alignment: const Alignment(-2, 1.2),
                    duration: const Duration(
                      milliseconds: 0,
                    ),
                    child: Ufo(size: 300),
                  ),
                  AnimatedContainer(
                    alignment: const Alignment(1.75, 1.2),
                    duration: const Duration(
                      milliseconds: 0,
                    ),
                    child: Ufo(size: 230),
                  )
                ],
              )),
          const BottomNav(),
        ],
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({
    super.key,
  });

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
            const Text(
              "500",
              style: TextStyle(
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
            const Text(
              "500",
              style: TextStyle(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ],
        ),
      ]),
    ));
  }
}
