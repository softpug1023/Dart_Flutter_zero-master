import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ButtonExamples extends StatefulWidget {
  const ButtonExamples({super.key});

  @override
  State<ButtonExamples> createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples> {
  bool switchState = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateColor.resolveWith((states) => Colors.blue),
          ),
          onPressed: (() {
            print('text button');
          }),
          onLongPress: () {
            print('long press');
          },
          child: const Text('textbutton'),
        ),
        Switch(
            value: switchState,
            onChanged: (value) {
              setState(() {
                switchState = value;
                print(switchState);
              });
            }),
      ],
    );
  }
}
