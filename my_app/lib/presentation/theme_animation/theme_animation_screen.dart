import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:my_app/application/theme_service.dart';
import 'package:my_app/presentation/theme_animation/widgets/moon.dart';
import 'package:my_app/presentation/theme_animation/widgets/star.dart';
import 'package:my_app/presentation/theme_animation/widgets/sun.dart';
import 'package:provider/provider.dart';

class ThemeAnimationScreen extends StatelessWidget {
  const ThemeAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Animation'),
        centerTitle: true,
      ),
      body: Consumer<ThemeService>(builder: (context, themeservice, child) {
        return Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 500,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color:
                        themeservice.isDarkModeOn ? Colors.black : Colors.grey,
                    offset: Offset(0, 3),
                    blurRadius: 5,
                  )
                ],
                borderRadius: BorderRadius.circular(15),
                color: Colors.blue,
                gradient: LinearGradient(
                    colors: themeservice.isDarkModeOn
                        ? [
                            Color.fromARGB(255, 45, 102, 206),
                            Color.fromARGB(255, 1, 29, 81),
                          ]
                        : [
                            Colors.blue,
                            Colors.yellow,
                          ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 60,
                    right: 70,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      opacity: themeservice.isDarkModeOn ? 1 : 0,
                      child: Star(),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    left: 170,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      opacity: themeservice.isDarkModeOn ? 1 : 0,
                      child: Star(),
                    ),
                  ),
                  Positioned(
                    top: 90,
                    left: 130,
                    child: AnimatedOpacity(
                      duration: Duration(milliseconds: 1200),
                      opacity: themeservice.isDarkModeOn ? 1 : 0,
                      child: Star(),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: Duration(milliseconds: 400),
                    top: themeservice.isDarkModeOn ? 100 : 130,
                    right: themeservice.isDarkModeOn ? 100 : -40,
                    child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: themeservice.isDarkModeOn ? 1 : 0,
                        child: Moon()),
                  ),
                  AnimatedPadding(
                    duration: Duration(milliseconds: 200),
                    padding: EdgeInsets.only(
                        top: themeservice.isDarkModeOn ? 110 : 50),
                    child: Center(child: Sun()),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 225,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: themeservice.isDarkModeOn
                              ? Colors.grey
                              : Colors.amber,
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(15))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            themeservice.isDarkModeOn
                                ? 'let the sun rise'
                                : 'let it be light',
                            textAlign: TextAlign.center,
                          ),
                          Switch(
                            value: themeservice.isDarkModeOn,
                            onChanged: (_) {
                              themeservice.toggleTheme();
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
