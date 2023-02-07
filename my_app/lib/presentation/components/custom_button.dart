import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onTap;
  final IconData icon;
  const CustomButton({super.key, required this.onTap, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.yellow, Colors.green]),
        ),
        child: InkWell(
          onTap: onTap(),
          splashColor: Colors.red,
          customBorder: CircleBorder(),
          child: Center(
            child: Icon(
              icon,
            ),
          ),
        ),
      ),
    );
  }
}
