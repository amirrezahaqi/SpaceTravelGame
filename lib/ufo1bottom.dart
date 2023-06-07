import 'package:flutter/material.dart';
import 'package:hellofirebase/gen/assets.gen.dart';

// ignore: must_be_immutable
class Ufo extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  double size;
  Ufo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Image.asset(Assets.greenufo1.path),
    );
  }
}
