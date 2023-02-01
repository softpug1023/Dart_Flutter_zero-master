import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';

class ButtonExamples extends StatelessWidget {
  const ButtonExamples({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (() {
        print('text button');
      }),
      onLongPress: () {
        print('long press');
      },
      child: const Text('textbutton'),
    );
  }
}
