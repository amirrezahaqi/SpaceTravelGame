import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hellofirebase/gen/assets.gen.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.center, children: [
        Image.asset(
          Assets.bg.path,
          fit: BoxFit.cover,
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
