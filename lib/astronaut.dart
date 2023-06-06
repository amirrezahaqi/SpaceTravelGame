import 'package:flutter/material.dart';
import 'package:hellofirebase/gen/assets.gen.dart';

class Astronaut extends StatelessWidget {
  const Astronaut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      height: 150,
      child: Image.asset(Assets.astronaut.path),
    );
  }
}
