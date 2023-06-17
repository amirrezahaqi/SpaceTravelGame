import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:spacetravel/gen/assets.gen.dart';

import 'gamepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) async {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const GamePage()));
      // void playSampleSound() async {
      //   AudioPlayer player = AudioPlayer();
      //   player.play(UrlSource(
      //       'https://static.rfstat.com/hosting/file/Sounds/75_second/Midnight%2075.mp3'));

      //   player.setReleaseMode(ReleaseMode.loop);
      // }

      // playSampleSound();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splashbg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logo.path,
              scale: 1.5,
            ),
            const SpinKitSpinningLines(
              color: Colors.white,
              size: 100.0,
            )
          ],
        )),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              Assets.createdbyamir1.path,
              scale: 2,
            ))
      ]),
    );
  }
}
