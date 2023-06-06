import 'package:flutter/material.dart';
import 'package:hellofirebase/gen/assets.gen.dart';

class Astronaut extends StatelessWidget {
  const Astronaut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Image.asset(Assets.astronaut.path),
    );
  }
}
