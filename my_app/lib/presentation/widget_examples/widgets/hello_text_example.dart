import 'package:flutter/material.dart';

class HelloText extends StatelessWidget {
  const HelloText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const SizedBox(
        height: 200,
        child: Center(child: Text('hello')),
      ),
    );
  }
}
