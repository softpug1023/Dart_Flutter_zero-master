import 'package:flutter/material.dart';

class StackExample extends StatelessWidget {
  const StackExample({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: 100,
        child: Image.asset(
          'assets/OIP-C.jpg',
          fit: BoxFit.fitHeight,
        ),
      ),
      Positioned(
        child: Text('name'),
        top: 80,
        left: 20,
      )
    ]);
  }
}
