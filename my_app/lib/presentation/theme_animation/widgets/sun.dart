import 'package:flutter/material.dart';
import 'package:my_app/presentation/theme_animation/widgets/sun_shine.dart';

class Sun extends StatelessWidget {
  const Sun({super.key});

  @override
  Widget build(BuildContext context) {
    return SunShine(
        radius: 160,
        child: SunShine(
            radius: 120,
            child: SunShine(
                radius: 80,
                child: SunShine(
                    radius: 60,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              Colors.red,
                              Colors.yellow,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )),
                    )))));
  }
}
