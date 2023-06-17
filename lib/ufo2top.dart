import 'package:flutter/material.dart';
import 'package:spacetravel/gen/assets.gen.dart';

// ignore: must_be_immutable
class Ufo2 extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  double size;
  Ufo2({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(Assets.ufo2.path),
    );
  }
}
