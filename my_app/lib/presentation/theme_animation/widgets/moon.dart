import 'package:flutter/material.dart';

class Moon extends StatelessWidget {
  const Moon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Colors.purple,
              Colors.blue,
            ],
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
          )),
    );
  }
}
